#!/bin/bash
# ==============================================================================
# SMVDU-TITAN-X Cadence Code Coverage Setup Script
#
# Target Flow: Quantitative Stimulus & Logic Coverage Extraction
# Tools: Cadence Xcelium (xrun) & Integrated Metrics Center (imc)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

set -e

RTL_DIR="../../../phases/final-integration/rtl_handoff"
TB_DIR="../../../phases/final-integration/rtl_handoff"
LOG_DIR="../logs"
COV_DIR="../coverage"

mkdir -p "$LOG_DIR"
mkdir -p "$COV_DIR"

echo "========================================================================"
echo "  INITIATING CODE COVERAGE EXTRACTION VIA CADENCE XCELIUM              "
echo "========================================================================"

# Compile and simulate with coverage enabled
# Parameters explained:
#   -covoverwrite: Overwrite existing coverage directory
#   -coverage b:s:t:e: Collect Block (statement), Subprogram, Toggle, and Expression coverage
#   -covdut: Instrument only the DUT top instance (excluding testbench)
xrun -64bit -sv \
  -timescale 1ns/1ps \
  -access +rwc \
  -coverage b:s:t:e \
  -covdut titan_x_final_top \
  -covoverwrite \
  -covdir "$COV_DIR/titan_x_cov_db" \
  -l "$LOG_DIR/xrun_coverage_sim.log" \
  "$RTL_DIR/titan_x_final_top.v" \
  "$TB_DIR/tb_titan_x_final.sv" \
  +define+SIMULATION

echo "========================================================================"
echo "  GENERATING COVERAGE REPORTS VIA CADENCE IMC                           "
echo "========================================================================"

# Run Cadence IMC in batch mode to generate HTML/text reports
# Parameter -load loads the coverage database directory
imc -batch -dir "$COV_DIR/titan_x_cov_db" -metrics all -exec <<EOF
report -summary -out "$COV_DIR/coverage_summary.rpt"
report -detail -metrics block -out "$COV_DIR/coverage_detail_block.rpt"
report -detail -metrics toggle -out "$COV_DIR/coverage_detail_toggle.rpt"
report -detail -metrics expr -out "$COV_DIR/coverage_detail_expr.rpt"
exit
EOF

echo "========================================================================"
echo "  COVERAGE ANALYSIS REPORT COMPLETE                                     "
echo "  Summary report written to: $COV_DIR/coverage_summary.rpt"
echo "========================================================================"
