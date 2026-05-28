#!/bin/bash
################################################################################
# SMVDU TITAN-X SoC – Step 14: Clock Tree Synthesis Shell Wrapper
# Invokes OpenROAD with the CTS TCL script.
# Technology : SCL 180nm / OSU018
# Clock      : sys_clk @ 100 MHz
# Author     : Physical Design Flow
# Date       : 2026-05-28
################################################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="${SCRIPT_DIR}/Output_Files"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "${LOG_DIR}"

echo "========================================================"
echo "  SMVDU TITAN-X SoC – Step 14: Clock Tree Synthesis"
echo "  Technology : SCL 180nm / OSU018"
echo "  Clock      : sys_clk @ 100 MHz (period = 10 ns)"
echo "  Skew Target: < 200 ps"
echo "  Timestamp  : ${TIMESTAMP}"
echo "========================================================"

# ── Check OpenROAD availability ─────────────────────────────────────────────
if command -v openroad &>/dev/null; then
    echo "[INFO] OpenROAD found at: $(which openroad)"
    echo "[INFO] Running TritonCTS …"
    openroad -exit "${SCRIPT_DIR}/cts.tcl" \
        2>&1 | tee "${LOG_DIR}/cts.log"
else
    echo "[WARN] OpenROAD not found – running Python CTS estimator …"
    python3 "${SCRIPT_DIR}/run_cts.py" \
        2>&1 | tee "${LOG_DIR}/cts.log"
fi

echo ""
echo "[INFO] CTS outputs written to: ${LOG_DIR}/"
echo "[INFO] Key output files:"
echo "       - ${LOG_DIR}/cts_report.rpt"
echo "       - ${LOG_DIR}/clock_skew_summary.rpt"
echo "       - ${LOG_DIR}/titan_x_top_cts.def (simulated)"
echo "========================================================"
echo "  Step 14 COMPLETE"
echo "========================================================"
