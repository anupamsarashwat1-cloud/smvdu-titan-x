#!/usr/bin/env bash
# SMVDU-TITAN-X — ISA Compliance Test Runner
# Runs riscv-tests ISA suite against the Verilator RTL simulation.
#
# Usage:
#   bash scripts/sim/run_isa_tests.sh               # Run rv64ui-p (integer tests)
#   bash scripts/sim/run_isa_tests.sh --suite=rv64um # Multiply/divide tests
#   bash scripts/sim/run_isa_tests.sh --suite=rv64mi # Machine-mode trap tests
#   bash scripts/sim/run_isa_tests.sh --all          # Run all suites
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
pass()  { echo -e "${GREEN}  ✓ PASS${NC}  $1"; }
fail()  { echo -e "${RED}  ✗ FAIL${NC}  $1 (exit $2)"; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CHIPYARD_DIR="$REPO_ROOT/hardware/chipyard"
SIM_DIR="$CHIPYARD_DIR/sims/verilator"
ISA_DIR="$REPO_ROOT/verification/riscv-tests/isa"
CONFIG="TitanXPhase1Config"
SIM_BIN="$SIM_DIR/simulator-chipyard.harness-${CONFIG}"
TIMEOUT=10000000   # 10M cycles per test (each ISA test is tiny)
RESULTS_DIR="$SIM_DIR/output/chipyard.harness.TestHarness.${CONFIG}/isa-results"

# ─── Parse arguments ─────────────────────────────────────────────────────────
SUITES=("rv64ui")   # Default: integer user tests
RUN_ALL=false

for arg in "$@"; do
    case $arg in
        --suite=*)  SUITES=("${arg#*=}") ;;
        --all)      RUN_ALL=true ;;
        --help)
            echo "Usage: $0 [options]"
            echo "  --suite=NAME   Test suite (rv64ui, rv64um, rv64mi, rv64si)"
            echo "  --all          Run all suites"
            exit 0 ;;
    esac
done

if $RUN_ALL; then
    SUITES=("rv64ui" "rv64um" "rv64mi")
fi

echo ""
echo -e "${CYAN}  ╔══════════════════════════════════════════╗${NC}"
echo -e "${CYAN}  ║   SMVDU-TITAN-X ISA Compliance Tests    ║${NC}"
echo -e "${CYAN}  ║   Suites: ${SUITES[*]}${NC}"
echo -e "${CYAN}  ╚══════════════════════════════════════════╝${NC}"
echo ""

# ─── Environment ─────────────────────────────────────────────────────────────
CONDA_BASE=$(conda info --base 2>/dev/null || echo "$HOME/miniforge3")
source "$CONDA_BASE/etc/profile.d/conda.sh"
conda activate chipyard
export PATH="$HOME/.local/bin:$PATH"

# ─── Check prerequisites ─────────────────────────────────────────────────────
if [ ! -f "$SIM_BIN" ]; then
    error "Simulator not found: $SIM_BIN"
    error "Build it first: cd hardware/chipyard/sims/verilator && make CONFIG=TitanXPhase1Config"
    exit 1
fi

if [ ! -d "$ISA_DIR" ]; then
    error "ISA tests not built: $ISA_DIR"
    error "Build: cd verification/riscv-tests && make isa"
    exit 1
fi

mkdir -p "$RESULTS_DIR"

# ─── Run tests ────────────────────────────────────────────────────────────────
TOTAL=0; PASSED=0; FAILED=0
FAILED_TESTS=()

for SUITE in "${SUITES[@]}"; do
    echo -e "\n${BLUE}━━━ Suite: $SUITE ━━━${NC}"
    TESTS=($(ls "$ISA_DIR/${SUITE}-p-"* 2>/dev/null | grep -v '\.dump$' || true))

    if [ ${#TESTS[@]} -eq 0 ]; then
        warn "No tests found for suite: $SUITE"
        continue
    fi

    for TEST_ELF in "${TESTS[@]}"; do
        TEST_NAME=$(basename "$TEST_ELF")
        TOTAL=$((TOTAL + 1))
        LOG="$RESULTS_DIR/${TEST_NAME}.log"

        # Run via make run-binary-fast
        cd "$SIM_DIR"
        if make CONFIG="$CONFIG" \
               BINARY="$TEST_ELF" \
               TIMEOUT_CYCLES="$TIMEOUT" \
               run-binary-fast > "$LOG" 2>&1; then
            PASSED=$((PASSED + 1))
            pass "$TEST_NAME"
        else
            EXIT_CODE=$?
            FAILED=$((FAILED + 1))
            FAILED_TESTS+=("$TEST_NAME")
            fail "$TEST_NAME" "$EXIT_CODE"
        fi
    done
done

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  Total:  $TOTAL"
echo -e "${GREEN}  Passed: $PASSED${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "${RED}  Failed: $FAILED${NC}"
    echo ""
    echo -e "${RED}  Failed tests:${NC}"
    for t in "${FAILED_TESTS[@]}"; do
        echo -e "${RED}    - $t${NC}"
    done
else
    echo -e "${GREEN}  Failed: 0${NC}"
fi
echo -e "  Logs:   $RESULTS_DIR/"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

[ $FAILED -eq 0 ] && exit 0 || exit 1
