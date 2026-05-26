#!/usr/bin/env bash
# SMVDU-TITAN-X Phase 1 — Spike ISA Test Runner
#
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

SUBMODULE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ISA_DIR="$SUBMODULE_ROOT/../verification/riscv-tests/isa"

# Activate Chipyard environment
CONDA_BASE=$(conda info --base 2>/dev/null || echo "$HOME/miniforge3")
source "$CONDA_BASE/etc/profile.d/conda.sh"
conda activate chipyard
export PATH="/home/anupam-sarashwat/.local/bin:$PATH"

PASS=0; FAIL=0; FAILED=""

# rv64ui tests
TESTS="rv64ui-p-add rv64ui-p-addi rv64ui-p-addiw rv64ui-p-addw rv64ui-p-and rv64ui-p-andi rv64ui-p-auipc rv64ui-p-beq rv64ui-p-bge rv64ui-p-bgeu rv64ui-p-blt rv64ui-p-bltu rv64ui-p-bne rv64ui-p-jal rv64ui-p-jalr rv64ui-p-lb rv64ui-p-lbu rv64ui-p-lh rv64ui-p-lhu rv64ui-p-lui rv64ui-p-lw rv64ui-p-lwu rv64ui-p-ld rv64ui-p-or rv64ui-p-ori rv64ui-p-sb rv64ui-p-sh rv64ui-p-sw rv64ui-p-sd rv64ui-p-sll rv64ui-p-slli rv64ui-p-slliw rv64ui-p-sllw rv64ui-p-slt rv64ui-p-slti rv64ui-p-sltiu rv64ui-p-sltu rv64ui-p-sra rv64ui-p-srai rv64ui-p-sraiw rv64ui-p-sraw rv64ui-p-srl rv64ui-p-srli rv64ui-p-srliw rv64ui-p-srlw rv64ui-p-sub rv64ui-p-subw rv64ui-p-xor rv64ui-p-xori"

if [ ! -d "$ISA_DIR" ]; then
    error "ISA tests directory not found at $ISA_DIR"
    exit 1
fi

echo -e "${BLUE}Running Spike ISA Functional Compliance...${NC}"

for t in $TESTS; do
    TEST="$ISA_DIR/$t"
    if [ -f "$TEST" ]; then
        if spike --isa=rv64gc -m0x80000000:0x10000000 "$TEST" > /dev/null 2>&1; then
            echo "  ✓ PASS  $t"
            PASS=$((PASS+1))
        else
            echo "  ✗ FAIL  $t"
            FAIL=$((FAIL+1))
            FAILED="$FAILED $t"
        fi
    fi
done

# rv64um tests
for t in rv64um-p-mul rv64um-p-mulh rv64um-p-mulhsu rv64um-p-mulhu rv64um-p-mulw rv64um-p-div rv64um-p-divu rv64um-p-divuw rv64um-p-divw rv64um-p-rem rv64um-p-remu rv64um-p-remuw rv64um-p-remw; do
    TEST="$ISA_DIR/$t"
    if [ -f "$TEST" ]; then
        if spike --isa=rv64gc -m0x80000000:0x10000000 "$TEST" > /dev/null 2>&1; then
            echo "  ✓ PASS  $t"
            PASS=$((PASS+1))
        else
            echo "  ✗ FAIL  $t"
            FAIL=$((FAIL+1))
            FAILED="$FAILED $t"
        fi
    fi
done

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  Spike Functional Compliance Summary"
echo -e "${GREEN}  Passed: $PASS${NC}"
if [ $FAIL -gt 0 ]; then
    echo -e "${RED}  Failed: $FAIL${NC}"
    echo -e "${RED}  Failed tests: $FAILED${NC}"
else
    echo -e "${GREEN}  Failed: 0${NC}"
fi
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

[ $FAIL -eq 0 ] && exit 0 || exit 1
