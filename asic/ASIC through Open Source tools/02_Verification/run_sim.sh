#!/bin/bash
# ============================================================================
# SMVDU-TITAN-X SoC — Icarus Verilog Simulation Script
# Usage: ./run_sim.sh [--waves] [--lint-only]
# ============================================================================
set -e
RTL_BASE="$(dirname "$0")/rtl"
TB_DIR="$(dirname "$0")"

echo "============================================"
echo " SMVDU-TITAN-X SoC RTL Simulation"
echo " Simulator : Icarus Verilog (iverilog)"
echo "============================================"

# ── File lists ───────────────────────────────────────────────────────────────
COMMON_SRCS=(
    "$RTL_BASE/common/sram_32x64_180nm.v"
    "$RTL_BASE/common/reset_sync.v"
    "$RTL_BASE/common/cdc_sync.v"
    "$RTL_BASE/common/fifo_sync.v"
    "$RTL_BASE/common/fifo_async.v"
)

CPU_SRCS=(
    "$RTL_BASE/cpu_complex/rv_core/rv_fetch.v"
    "$RTL_BASE/cpu_complex/rv_core/rv_decode.v"
    "$RTL_BASE/cpu_complex/rv_core/rv_execute.v"
    "$RTL_BASE/cpu_complex/rv_core/rv_mem.v"
    "$RTL_BASE/cpu_complex/rv_core/rv_writeback.v"
    "$RTL_BASE/cpu_complex/rv_core/rv_core_top.v"
    "$RTL_BASE/cpu_complex/clint.v"
    "$RTL_BASE/cpu_complex/plic.v"
    "$RTL_BASE/cpu_complex/cpu_complex_top.v"
)

MEM_SRCS=(
    "$RTL_BASE/memory_subsystem/l2_tag_array.v"
    "$RTL_BASE/memory_subsystem/l2_data_array.v"
    "$RTL_BASE/memory_subsystem/l2_cache_ctrl.v"
    "$RTL_BASE/memory_subsystem/l2_cache_top.v"
    "$RTL_BASE/memory_subsystem/ddr_ctrl/ddr_phy_if.v"
    "$RTL_BASE/memory_subsystem/ddr_ctrl/ddr_scheduler.v"
    "$RTL_BASE/memory_subsystem/ddr_ctrl/ddr_ctrl_top.v"
)

INTC_SRCS=(
    "$RTL_BASE/interconnect/axi4_crossbar.v"
    "$RTL_BASE/interconnect/axi4_to_ahb.v"
    "$RTL_BASE/interconnect/ahb_to_apb.v"
)

PCIE_SRCS=(
    "$RTL_BASE/pcie/pcie_top.v"
)

ETH_SRCS=(
    "$RTL_BASE/ethernet/gem_ethernet.v"
)

PERIPH_SRCS=(
    "$RTL_BASE/peripherals/uart_16550.v"
    "$RTL_BASE/peripherals/gpio_ctrl.v"
    "$RTL_BASE/peripherals/spi_master.v"
    "$RTL_BASE/peripherals/i2c_master.v"
    "$RTL_BASE/peripherals/watchdog_timer.v"
)

SEC_SRCS=(
    "$RTL_BASE/security/aes_engine.v"
    "$RTL_BASE/security/sha256_engine.v"
    "$RTL_BASE/security/trng.v"
)

TOP_SRCS=(
    "$RTL_BASE/titan_x_top.v"
)

TB_SRCS=(
    "$TB_DIR/tb_titan_x_top.sv"
)

ALL_SRCS=(
    "${COMMON_SRCS[@]}"
    "${CPU_SRCS[@]}"
    "${MEM_SRCS[@]}"
    "${INTC_SRCS[@]}"
    "${PCIE_SRCS[@]}"
    "${ETH_SRCS[@]}"
    "${PERIPH_SRCS[@]}"
    "${SEC_SRCS[@]}"
    "${TOP_SRCS[@]}"
    "${TB_SRCS[@]}"
)

# ── Options ───────────────────────────────────────────────────────────────────
WAVES=0
LINT_ONLY=0
for arg in "$@"; do
    case $arg in
        --waves)    WAVES=1 ;;
        --lint-only)LINT_ONLY=1 ;;
    esac
done

IVLOG_FLAGS="-g2012 -Wall -Wno-timescale -Wno-implicit-dimensions"
if [ $WAVES -eq 1 ]; then
    IVLOG_FLAGS="$IVLOG_FLAGS -DDUMP_WAVES"
fi

# ── Verify all source files exist ─────────────────────────────────────────────
echo "[1/4] Checking source files..."
MISSING=0
for f in "${ALL_SRCS[@]}"; do
    if [ ! -f "$f" ]; then
        echo "  MISSING: $f"
        MISSING=$((MISSING+1))
    fi
done
if [ $MISSING -gt 0 ]; then
    echo "ERROR: $MISSING source file(s) missing. Aborting."
    exit 1
fi
echo "  All $(echo "${#ALL_SRCS[@]}") source files present."

# ── Compile ───────────────────────────────────────────────────────────────────
echo "[2/4] Compiling with iverilog..."
iverilog $IVLOG_FLAGS \
    -o "$TB_DIR/sim_titan_x.vvp" \
    "${ALL_SRCS[@]}"
echo "  Compilation: PASSED"

if [ $LINT_ONLY -eq 1 ]; then
    echo "Lint-only mode: skipping simulation."
    exit 0
fi

# ── Simulate ──────────────────────────────────────────────────────────────────
echo "[3/4] Running simulation..."
vvp "$TB_DIR/sim_titan_x.vvp" | tee "$TB_DIR/sim_output.log"
echo "  Simulation complete. Log: sim_output.log"

# ── Open waveforms ────────────────────────────────────────────────────────────
if [ $WAVES -eq 1 ] && [ -f "$TB_DIR/titan_x_waves.vcd" ]; then
    echo "[4/4] Opening GTKWave..."
    gtkwave "$TB_DIR/titan_x_waves.vcd" &
    echo "  GTKWave launched."
else
    echo "[4/4] Run with --waves to generate VCD and open GTKWave."
fi

echo "============================================"
echo " Done."
echo "============================================"
