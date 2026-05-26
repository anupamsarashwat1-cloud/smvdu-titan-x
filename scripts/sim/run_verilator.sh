#!/usr/bin/env bash
# SMVDU-TITAN-X — Verilator Simulation Runner
# Runs RTL simulation of the SMVDU-TITAN-X SoC using Verilator
#
# Usage:
#   bash scripts/sim/run_verilator.sh                  # Full simulation
#   bash scripts/sim/run_verilator.sh --lint-only       # Lint check only
#   bash scripts/sim/run_verilator.sh --config=TitanXSimConfig
#   bash scripts/sim/run_verilator.sh --firmware=software/firmware/hello_uart/build/hello_uart.hex
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CHIPYARD_DIR="$REPO_ROOT/hardware/chipyard"
SIM_DIR="$CHIPYARD_DIR/sims/verilator"
BUILD_DIR="$REPO_ROOT/verification/sim/build"

# ─── Defaults ────────────────────────────────────────────────────────────────
CONFIG="smvdu.titan.x.TitanXSimConfig"
FIRMWARE="${REPO_ROOT}/software/firmware/hello_uart/build/hello_uart.hex"
LINT_ONLY=false
WAVES=false
TIMEOUT=10000000   # cycles

# ─── Parse arguments ─────────────────────────────────────────────────────────
for arg in "$@"; do
    case $arg in
        --lint-only)         LINT_ONLY=true ;;
        --config=*)          CONFIG="${arg#*=}" ;;
        --firmware=*)        FIRMWARE="${arg#*=}" ;;
        --waves)             WAVES=true ;;
        --timeout=*)         TIMEOUT="${arg#*=}" ;;
        --help)
            echo "Usage: $0 [options]"
            echo "  --lint-only          Run Verilator lint without simulation"
            echo "  --config=NAME        Chipyard config (default: TitanXSimConfig)"
            echo "  --firmware=FILE      Firmware HEX file to load"
            echo "  --waves              Enable VCD waveform dump"
            echo "  --timeout=N          Simulation timeout in cycles (default: 10M)"
            exit 0
            ;;
    esac
done

info "SMVDU-TITAN-X Verilator Simulation"
info "Config:   $CONFIG"
info "Firmware: $FIRMWARE"

# ─── Check Prerequisites ──────────────────────────────────────────────────────
step "Checking prerequisites"

if ! command -v verilator &>/dev/null; then
    error "Verilator not found. Run: sudo apt install verilator"
    exit 1
fi
info "Verilator: $(verilator --version | head -1)"

if ! command -v riscv64-unknown-elf-gcc &>/dev/null; then
    warn "RISC-V toolchain not found. Simulation may fail."
    warn "Run: bash scripts/setup/setup_riscv_toolchain.sh"
fi

# ─── Build Firmware (if not present) ─────────────────────────────────────────
if [ ! -f "$FIRMWARE" ] && [ "$LINT_ONLY" = false ]; then
    step "Building Phase 1 firmware"
    FIRMWARE_DIR="$REPO_ROOT/software/firmware/hello_uart"
    if [ -f "$FIRMWARE_DIR/Makefile" ]; then
        make -C "$FIRMWARE_DIR"
        FIRMWARE="$FIRMWARE_DIR/build/hello_uart.hex"
    else
        warn "Firmware not found and Makefile missing. Using bare simulation."
        FIRMWARE=""
    fi
fi

# ─── Chipyard Simulation Build ────────────────────────────────────────────────
if [ -d "$SIM_DIR" ]; then
    step "Building Chipyard Verilator simulation"
    cd "$SIM_DIR"

    if $LINT_ONLY; then
        info "Running Verilator lint check..."
        make lint CONFIG="$CONFIG" 2>&1 | tee "$BUILD_DIR/lint.log"
        LINT_EXIT=${PIPESTATUS[0]}
        if [ $LINT_EXIT -eq 0 ]; then
            info "✓ Lint passed — zero errors/warnings"
        else
            error "✗ Lint failed — see $BUILD_DIR/lint.log"
            exit $LINT_EXIT
        fi
        exit 0
    fi

    MAKE_ARGS="CONFIG=$CONFIG"
    if $WAVES; then
        MAKE_ARGS="$MAKE_ARGS debug"
    fi

    info "Building simulator (this may take several minutes on first run)..."
    make $MAKE_ARGS 2>&1 | tee "$BUILD_DIR/build.log"

    # ─── Run Simulation ───────────────────────────────────────────────────
    step "Running simulation"

    SIM_BIN="simulator-$CONFIG"
    if [ ! -f "$SIM_BIN" ]; then
        SIM_BIN=$(find . -name "simulator-*" -type f | head -1)
    fi

    if [ -z "$SIM_BIN" ]; then
        error "Simulator binary not found after build"
        exit 1
    fi

    SIM_ARGS="+max-cycles=$TIMEOUT"
    if [ -n "$FIRMWARE" ] && [ -f "$FIRMWARE" ]; then
        SIM_ARGS="$SIM_ARGS +loadmem=$FIRMWARE"
    fi
    if $WAVES; then
        SIM_ARGS="$SIM_ARGS +vcdplusfile=$BUILD_DIR/titan_x_sim.vpd"
    fi

    info "Running: ./$SIM_BIN $SIM_ARGS"
    mkdir -p "$BUILD_DIR"
    "./$SIM_BIN" $SIM_ARGS 2>&1 | tee "$BUILD_DIR/sim.log"
    SIM_EXIT=${PIPESTATUS[0]}

else
    # ─── Fallback: Standalone Verilator on RTL stub ────────────────────────
    step "Standalone Verilator simulation (RTL stub only)"
    warn "Chipyard not available. Running standalone simulation on RTL stub."

    mkdir -p "$BUILD_DIR"
    TOP_MODULE="$REPO_ROOT/hardware/rtl/top/titan_x_top.v"

    if [ ! -f "$TOP_MODULE" ]; then
        error "Top-level RTL not found: $TOP_MODULE"
        exit 1
    fi

    info "Running Verilator lint on RTL stub..."
    verilator \
        --lint-only \
        --top-module titan_x_top \
        -Wall \
        "$TOP_MODULE" \
        2>&1 | tee "$BUILD_DIR/lint.log"

    SIM_EXIT=${PIPESTATUS[0]}
    if [ $SIM_EXIT -eq 0 ]; then
        info "✓ RTL stub lint passed"
    else
        warn "Lint warnings found — see $BUILD_DIR/lint.log"
    fi
fi

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
info "═══════════════════════════════════════════"
if [ "${SIM_EXIT:-0}" -eq 0 ]; then
    info "  ✓ Simulation PASSED"
else
    info "  ✗ Simulation FAILED (exit: ${SIM_EXIT:-?})"
fi
info "  Log: $BUILD_DIR/sim.log"
if $WAVES; then
    info "  Waveform: $BUILD_DIR/titan_x_sim.vpd"
    info "  View: gtkwave $BUILD_DIR/titan_x_sim.vpd"
fi
info "═══════════════════════════════════════════"
echo ""

exit "${SIM_EXIT:-0}"
