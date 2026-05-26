#!/usr/bin/env bash
source ~/miniforge3/etc/profile.d/conda.sh
conda activate chipyard
export PATH=/home/anupam-sarashwat/.local/bin:$PATH

ISA_DIR=/home/anupam-sarashwat/Documents/antigravity/wonderful-mendel/verification/riscv-tests/isa
PASS=0; FAIL=0; FAILED=""

TESTS="rv64ui-p-add rv64ui-p-addi rv64ui-p-addiw rv64ui-p-addw rv64ui-p-and rv64ui-p-andi rv64ui-p-auipc rv64ui-p-beq rv64ui-p-bge rv64ui-p-bgeu rv64ui-p-blt rv64ui-p-bltu rv64ui-p-bne rv64ui-p-jal rv64ui-p-jalr rv64ui-p-lb rv64ui-p-lbu rv64ui-p-lh rv64ui-p-lhu rv64ui-p-lui rv64ui-p-lw rv64ui-p-lwu rv64ui-p-ld rv64ui-p-or rv64ui-p-ori rv64ui-p-sb rv64ui-p-sh rv64ui-p-sw rv64ui-p-sd rv64ui-p-sll rv64ui-p-slli rv64ui-p-slliw rv64ui-p-sllw rv64ui-p-slt rv64ui-p-slti rv64ui-p-sltiu rv64ui-p-sltu rv64ui-p-sra rv64ui-p-srai rv64ui-p-sraiw rv64ui-p-sraw rv64ui-p-srl rv64ui-p-srli rv64ui-p-srliw rv64ui-p-srlw rv64ui-p-sub rv64ui-p-subw rv64ui-p-xor rv64ui-p-xori"

for t in $TESTS; do
    TEST="$ISA_DIR/$t"
    if [ -f "$TEST" ]; then
        spike --isa=rv64gc -m0x80000000:0x10000000 "$TEST" > /dev/null 2>&1 \
            && echo "PASS $t" && PASS=$((PASS+1)) \
            || { echo "FAIL $t" && FAIL=$((FAIL+1)); FAILED="$FAILED $t"; }
    fi
done

# rv64um tests
for t in rv64um-p-mul rv64um-p-mulh rv64um-p-mulhsu rv64um-p-mulhu rv64um-p-mulw rv64um-p-div rv64um-p-divu rv64um-p-divuw rv64um-p-divw rv64um-p-rem rv64um-p-remu rv64um-p-remuw rv64um-p-remw; do
    TEST="$ISA_DIR/$t"
    if [ -f "$TEST" ]; then
        spike --isa=rv64gc -m0x80000000:0x10000000 "$TEST" > /dev/null 2>&1 \
            && echo "PASS $t" && PASS=$((PASS+1)) \
            || { echo "FAIL $t" && FAIL=$((FAIL+1)); FAILED="$FAILED $t"; }
    fi
done

echo ""
echo "=== Spike ISA Results: PASS=$PASS FAIL=$FAIL ==="
if [ -n "$FAILED" ]; then
    echo "Failed: $FAILED"
    exit 1
else
    echo "All tests passed!"
    exit 0
fi
