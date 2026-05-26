#!/usr/bin/env bash
# SMVDU-TITAN-X Phase 1 — Run Verilator Simulation
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

SUBMODULE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHIPYARD_DIR="$SUBMODULE_ROOT/../hardware/chipyard"
SIM_DIR="$CHIPYARD_DIR/sims/verilator"
CONFIG="TitanXPhase1Config"
OUTPUT_DIR="$SIM_DIR/output/chipyard.harness.TestHarness.${CONFIG}"

# Defaults
FIRMWARE="$SUBMODULE_ROOT/firmware/hello_uart/build/hello_uart.elf"
WAVES=false
TIMEOUT=50000000

for arg in "$@"; do
    case $arg in
        --test=exit)   FIRMWARE="$SUBMODULE_ROOT/firmware/exit_test/build/exit_test.elf"
                       TIMEOUT=10000000 ;;
        --test=uart)   FIRMWARE="$SUBMODULE_ROOT/firmware/hello_uart/build/hello_uart.elf"
                       TIMEOUT=50000000 ;;
        --firmware=*)  FIRMWARE="${arg#*=}" ;;
        --waves)       WAVES=true ;;
        --timeout=*)   TIMEOUT="${arg#*=}" ;;
        --help)
            echo "Usage: $0 [options]"
            echo "  --test=exit          Fast RTL smoke test (~11s, tohost exit only)"
            echo "  --test=uart          Full hello_uart simulation (~60 min)"
            echo "  --firmware=FILE      Custom ELF firmware path"
            echo "  --waves              Enable VCD waveform dump"
            echo "  --timeout=N          Cycle limit (default: 50M)"
            exit 0 ;;
        *) warn "Unknown argument: $arg" ;;
    esac
done

step "Checking simulator binary"
SIM_BIN="$SIM_DIR/simulator-chipyard.harness-${CONFIG}"
if [ ! -f "$SIM_BIN" ]; then
    error "Simulator binary not found at $SIM_BIN"
    error "Please build it first: bash $SUBMODULE_ROOT/scripts/build_sim.sh"
    exit 1
fi

step "Checking and compiling firmware if needed"
FIRMWARE_DIR="$(dirname "$FIRMWARE")"
if [ ! -f "$FIRMWARE" ]; then
    info "Compiling firmware in $FIRMWARE_DIR..."
    # Activate toolchain
    export PATH="$PATH:/home/anupam-sarashwat/.local/bin"
    make -C "$FIRMWARE_DIR"
fi

# Run
step "Running simulation"
mkdir -p "$OUTPUT_DIR"
cd "$SIM_DIR"

MAKE_TARGET="run-binary-fast"
if $WAVES; then
    MAKE_TARGET="run-binary-debug"
fi

START_TIME=$(date +%s)
make CONFIG="$CONFIG" \
     BINARY="$FIRMWARE" \
     TIMEOUT_CYCLES="$TIMEOUT" \
     "$MAKE_TARGET" 2>&1 | tee "$OUTPUT_DIR/$(basename "$FIRMWARE" .elf).log"
SIM_EXIT=${PIPESTATUS[0]}
END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))

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
