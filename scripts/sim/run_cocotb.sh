#!/usr/bin/env bash
# SMVDU-TITAN-X — cocotb Testbench Runner
# Runs Python-based cocotb testbenches for peripheral verification
#
# Usage:
#   bash scripts/sim/run_cocotb.sh uart          # Run UART tests
#   bash scripts/sim/run_cocotb.sh spi           # Run SPI tests
#   bash scripts/sim/run_cocotb.sh gpio          # Run GPIO tests
#   bash scripts/sim/run_cocotb.sh all           # Run all tests
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
step()  { echo -e "\n${BLUE}━━━ $* ━━━${NC}"; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COCOTB_DIR="$REPO_ROOT/verification/cocotb"
RESULTS_DIR="$REPO_ROOT/verification/results"
SIM="${SIM:-verilator}"   # or icarus

MODULE="${1:-all}"

mkdir -p "$RESULTS_DIR"

# ─── Prerequisites ────────────────────────────────────────────────────────────
check_prereqs() {
    if ! python3 -c "import cocotb" 2>/dev/null; then
        error "cocotb not installed. Run: pip3 install cocotb cocotb-bus"
        exit 1
    fi
    info "cocotb: $(python3 -c 'import cocotb; print(cocotb.__version__)')"

    if [ "$SIM" = "verilator" ]; then
        if ! command -v verilator &>/dev/null; then
            error "Verilator not found"
            exit 1
        fi
        info "Verilator: $(verilator --version | head -1)"
    elif [ "$SIM" = "icarus" ]; then
        if ! command -v iverilog &>/dev/null; then
            error "Icarus Verilog not found. Run: sudo apt install iverilog"
            exit 1
        fi
        info "Icarus: $(iverilog -V 2>&1 | head -1)"
    fi
}

# ─── Run a single test module ────────────────────────────────────────────────
run_test() {
    local TEST_NAME="$1"
    local TEST_DIR="$COCOTB_DIR/$TEST_NAME"

    if [ ! -d "$TEST_DIR" ]; then
        warn "Test directory not found: $TEST_DIR"
        return 1
    fi

    step "Running $TEST_NAME tests"
    info "Simulator: $SIM"
    info "Test dir: $TEST_DIR"

    cd "$TEST_DIR"

    # Create Makefile if not present
    if [ ! -f "Makefile" ]; then
        create_cocotb_makefile "$TEST_NAME"
    fi

    SIM="$SIM" make 2>&1 | tee "$RESULTS_DIR/${TEST_NAME}_result.log"
    TEST_EXIT=${PIPESTATUS[0]}

    if [ $TEST_EXIT -eq 0 ]; then
        info "✓ $TEST_NAME tests PASSED"
    else
        error "✗ $TEST_NAME tests FAILED"
    fi

    # Copy results
    if [ -f "results.xml" ]; then
        cp "results.xml" "$RESULTS_DIR/${TEST_NAME}_results.xml"
    fi

    cd "$REPO_ROOT"
    return $TEST_EXIT
}

# ─── Auto-generate basic Makefile for cocotb test ────────────────────────────
create_cocotb_makefile() {
    local MODULE_NAME="$1"
    cat > "Makefile" << EOF
# Auto-generated cocotb Makefile for SMVDU-TITAN-X ${MODULE_NAME} test

SIM ?= verilator
TOPLEVEL_LANG ?= verilog

# RTL source
VERILOG_SOURCES = \$(shell find \$(REPO_ROOT)/hardware/rtl/peripherals/${MODULE_NAME} -name "*.v" 2>/dev/null || echo "")

# Top-level module name
TOPLEVEL = ${MODULE_NAME}_top

# Python test module
MODULE = test_${MODULE_NAME}

# Compiler args
ifeq (\$(SIM), verilator)
EXTRA_ARGS = --trace --trace-structs
endif

REPO_ROOT ?= $(cd "$REPO_ROOT" && pwd)

include \$(shell cocotb-config --makefiles)/Makefile.sim
EOF
    info "Generated Makefile for $MODULE_NAME"
}

# ─── Main ────────────────────────────────────────────────────────────────────
check_prereqs

PASS=0
FAIL=0

if [ "$MODULE" = "all" ]; then
    MODULES=("uart" "spi" "gpio")
    for mod in "${MODULES[@]}"; do
        if run_test "$mod"; then
            ((PASS++)) || true
        else
            ((FAIL++)) || true
        fi
    done
else
    if run_test "$MODULE"; then
        PASS=1
    else
        FAIL=1
    fi
fi

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
info "═══════════════════════════════════════════"
info "  cocotb Test Results"
info "  PASSED: $PASS"
if [ "$FAIL" -gt 0 ]; then
    info "  FAILED: $FAIL"
fi
info "  Results: $RESULTS_DIR"
info "═══════════════════════════════════════════"
echo ""

[ "$FAIL" -eq 0 ]
