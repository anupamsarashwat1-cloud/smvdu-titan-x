#!/bin/bash
# ==============================================================================
# SMVDU-TITAN-X Cadence Xcelium Functional Verification Runner
#
# Target Flow: RTL Functional Simulation & Verification
# Tool: Cadence Xcelium (xrun)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

# Exit immediately if a command exits with a non-zero status
set -e

# Set paths
RTL_DIR="../../../phases/final-integration/rtl_handoff"
TB_DIR="../../../phases/final-integration/rtl_handoff"
LOG_DIR="../logs"
OUT_DIR="../outputs"

mkdir -p "$LOG_DIR"
mkdir -p "$OUT_DIR"

echo "========================================================================"
# Avoid superlatives like flawlessly or perfectly
echo "  LAUNCHING CADENCE XCELIUM FUNCTIONAL VERIFICATION ENGINE              "
echo "========================================================================"

# Run compilation and simulation
# Parameters explained:
#   -64bit: Run 64-bit engine
#   -sv: Enable SystemVerilog support
#   -timescale: Set default simulation timescale
#   -access +rwc: Enable read/write/connectivity access for wave dumping
#   -l: Direct execution logs to a file
#   -jobs 4: Parallelize compilation using 4 CPU cores
xrun -64bit -sv \
  -timescale 1ns/1ps \
  -access +rwc \
  -jobs 4 \
  -uvm \
  -l "$LOG_DIR/xrun_functional_sim.log" \
  "$RTL_DIR/titan_x_final_top.v" \
  "$TB_DIR/tb_titan_x_final.sv" \
  +xrun+gui=false \
  +define+SIMULATION \
  +define+SHM_DUMP

echo "========================================================================"
echo "  SIMULATION RUN COMPLETED. PARSING XCELIUM LOG FOR STATUS            "
echo "========================================================================"

if grep -q "ERROR" "$LOG_DIR/xrun_functional_sim.log" || grep -q "Fatal" "$LOG_DIR/xrun_functional_sim.log"; then
  echo "  Result: SIMULATION FAILED with errors. Check $LOG_DIR/xrun_functional_sim.log"
  exit 1
else
  echo "  Result: SIMULATION COMPLETED SUCCESSFULLY with zero functional errors."
fi
