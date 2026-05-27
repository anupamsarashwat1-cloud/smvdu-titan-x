#!/bin/bash
# ==============================================================================
# SMVDU-TITAN-X Cadence Gate-Level Simulation (GLS) Setup
#
# Target Flow: Gate-Level Timing & Netlist Verification
# Tool: Cadence Xcelium (xrun)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

set -e

NETLIST_DIR="../outputs"
SDF_DIR="../outputs"
TB_DIR="../../../phases/final-integration/rtl_handoff"
LOG_DIR="../logs"

mkdir -p "$LOG_DIR"

echo "========================================================================"
echo "  COMPILING POST-SYNTHESIS NETLIST & SDF FOR TIMING SIMULATION          "
echo "========================================================================"

# Check for existence of the netlist and SDF parasitics file
if [ ! -f "$NETLIST_DIR/titan_x_netlist.v" ]; then
  echo "  Error: Synthesized netlist not found at $NETLIST_DIR/titan_x_netlist.v"
  echo "  Please execute synthesis using synthesis_genus.tcl first."
  exit 1
fi

if [ ! -f "$SDF_DIR/titan_x_delay.sdf" ]; then
  echo "  Warning: SDF timing parasitics not found at $SDF_DIR/titan_x_delay.sdf"
  echo "  Running GLS in zero-delay (functional-only) netlist mode..."
  SDF_ARG=""
else
  echo "  SDF file discovered! Back-annotating timing delays..."
  # SDF back-annotation argument for Xcelium
  # Form: -sdf_file <sdf_file_path> -sdf_nocheck_celltype
  SDF_ARG="-sdf_file $SDF_DIR/titan_x_delay.sdf -sdf_nocheck_celltype"
fi

# Run GLS in Cadence Xcelium
# Parameters explained:
#   +delay_mode_path: Use path delays specified in cells
#   -negdelay: Allow negative timing delays
#   -sdf_verbose: Print complete SDF annotation mapping details
xrun -64bit -sv \
  -timescale 1ns/1ps \
  -access +rwc \
  -negdelay \
  +delay_mode_path \
  -sdf_verbose \
  $SDF_ARG \
  -l "$LOG_DIR/xrun_gls_sim.log" \
  "$NETLIST_DIR/titan_x_netlist.v" \
  "$TB_DIR/tb_titan_x_final.sv" \
  +define+GLS_SIMULATION \
  +define+SHM_DUMP

echo "========================================================================"
echo "  GATE-LEVEL SIMULATION COMPLETE. PARSING SIMULATION METRICS           "
echo "========================================================================"

if grep -q "ERROR" "$LOG_DIR/xrun_gls_sim.log" || grep -q "Fatal" "$LOG_DIR/xrun_gls_sim.log" || grep -q "Timing violation" "$LOG_DIR/xrun_gls_sim.log"; then
  echo "  Result: GATE-LEVEL SIMULATION FAILED. Review timing/logical errors in $LOG_DIR/xrun_gls_sim.log"
  exit 1
else
  echo "  Result: GATE-LEVEL SIMULATION PASSED SUCCESSFULLY with zero timing/functional regressions."
fi
