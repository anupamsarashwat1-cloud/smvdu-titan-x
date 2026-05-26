#!/usr/bin/env bash
# SMVDU-TITAN-X — Verilator Simulation Runner
# Runs RTL simulation using the Chipyard Verilator flow.
#
# Usage:
#   bash scripts/sim/run_verilator.sh                          # Run hello_uart
#   bash scripts/sim/run_verilator.sh --firmware=path/to/fw   # Custom firmware
#   bash scripts/sim/run_verilator.sh --test=exit             # Run exit_test (fast)
#   bash scripts/sim/run_verilator.sh --waves                 # Enable VCD dump
#   bash scripts/sim/run_verilator.sh --timeout=50000000      # 50M cycle limit
#
# Phase 1 Config: TitanXPhase1Config (single Rocket RV64GC + SiFive UART)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CHIPYARD_DIR="$REPO_ROOT/hardware/chipyard"
SIM_DIR="$CHIPYARD_DIR/sims/verilator"
OUTPUT_DIR="$SIM_DIR/output/chipyard.harness.TestHarness.TitanXPhase1Config"

# ─── Defaults ────────────────────────────────────────────────────────────────
CONFIG="TitanXPhase1Config"
FIRMWARE="$REPO_ROOT/software/firmware/hello_uart/build/hello_uart.elf"
WAVES=false
TIMEOUT=50000000   # 50M cycles — enough for full UART banner with DRAMSim2

# ─── Parse arguments ─────────────────────────────────────────────────────────
for arg in "$@"; do
    case $arg in
        --test=exit)   FIRMWARE="$REPO_ROOT/software/firmware/exit_test/exit_test.elf"
                       TIMEOUT=10000000 ;;
        --test=uart)   FIRMWARE="$REPO_ROOT/software/firmware/hello_uart/build/hello_uart.elf"
                       TIMEOUT=50000000 ;;
        --firmware=*)  FIRMWARE="${arg#*=}" ;;
        --waves)       WAVES=true ;;
        --timeout=*)   TIMEOUT="${arg#*=}" ;;
        --config=*)    CONFIG="${arg#*=}" ;;
        --help)
            echo "Usage: $0 [options]"
            echo "  --test=exit          Fast RTL smoke test (~11s, tohost exit only)"
            echo "  --test=uart          Full hello_uart simulation (~60 min)"
            echo "  --firmware=FILE      Custom ELF firmware path"
            echo "  --waves              Enable VCD waveform dump"
            echo "  --timeout=N          Cycle limit (default: 50M)"
            echo "  --config=NAME        Chipyard config (default: TitanXPhase1Config)"
            exit 0 ;;
        *) warn "Unknown argument: $arg" ;;
    esac
done

echo ""
echo -e "${CYAN}  ╔══════════════════════════════════════╗${NC}"
echo -e "${CYAN}  ║   SMVDU-TITAN-X Verilator Runner     ║${NC}"
echo -e "${CYAN}  ║   Phase 1 — Rocket RV64GC SoC        ║${NC}"
echo -e "${CYAN}  ╚══════════════════════════════════════╝${NC}"
echo ""
info "Config:   $CONFIG"
info "Firmware: $FIRMWARE"
info "Timeout:  ${TIMEOUT} cycles"

# ─── Activate Chipyard environment ───────────────────────────────────────────
step "Activating Chipyard environment"
CONDA_BASE=$(conda info --base 2>/dev/null || echo "$HOME/miniforge3")
source "$CONDA_BASE/etc/profile.d/conda.sh"
conda activate chipyard
export PATH="$HOME/.local/bin:$PATH"
info "firtool: $(firtool --version 2>/dev/null || echo 'not found')"

# ─── Check simulator binary ───────────────────────────────────────────────────
step "Checking simulator binary"
SIM_BIN="$SIM_DIR/simulator-chipyard.harness-${CONFIG}"

if [ ! -f "$SIM_BIN" ]; then
    warn "Simulator not found. Building now (may take 30–60 min)..."
    cd "$SIM_DIR"
    make CONFIG="$CONFIG" -j$(nproc) 2>&1 | tee /tmp/titan_x_build.log
    info "Build complete."
fi
info "Simulator: $SIM_BIN"

# ─── Check firmware ───────────────────────────────────────────────────────────
step "Checking firmware"
if [ ! -f "$FIRMWARE" ]; then
    FIRMWARE_DIR=$(dirname "$FIRMWARE")
    if [ -f "$FIRMWARE_DIR/Makefile" ]; then
        info "Building firmware..."
        make -C "$FIRMWARE_DIR"
    elif [ -f "$FIRMWARE_DIR/main.S" ]; then
        info "Building firmware from assembly..."
        make -C "$FIRMWARE_DIR" -f "$FIRMWARE_DIR/../../hello_uart/Makefile" \
             BUILD_DIR="$FIRMWARE_DIR/build" 2>/dev/null || true
    fi
fi

if [ ! -f "$FIRMWARE" ]; then
    error "Firmware not found: $FIRMWARE"
    error "Build it first: make -C software/firmware/hello_uart"
    exit 1
fi
info "Firmware: $(riscv64-unknown-elf-size "$FIRMWARE" 2>/dev/null | tail -1 || echo 'size unavailable')"

# ─── Run Simulation ───────────────────────────────────────────────────────────
step "Running simulation"
mkdir -p "$OUTPUT_DIR"
cd "$SIM_DIR"

MAKE_TARGET="run-binary-fast"
if $WAVES; then
    MAKE_TARGET="run-binary-debug"
    info "VCD waveform enabled — output: $OUTPUT_DIR/$(basename "$FIRMWARE" .elf).vcd"
fi

START_TIME=$(date +%s)

make CONFIG="$CONFIG" \
     BINARY="$FIRMWARE" \
     TIMEOUT_CYCLES="$TIMEOUT" \
     "$MAKE_TARGET" 2>&1 | tee "$OUTPUT_DIR/$(basename "$FIRMWARE" .elf).log"
SIM_EXIT=${PIPESTATUS[0]}

END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [ "$SIM_EXIT" -eq 0 ]; then
    echo -e "${GREEN}  ✓ Simulation PASSED${NC}"
else
    echo -e "${RED}  ✗ Simulation FAILED (exit: $SIM_EXIT)${NC}"
fi
echo -e "  Time:    ${ELAPSED}s"
echo -e "  Log:     $OUTPUT_DIR/$(basename "$FIRMWARE" .elf).log"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

exit "$SIM_EXIT"
