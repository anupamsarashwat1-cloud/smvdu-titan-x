#!/bin/bash
################################################################################
# SMVDU TITAN-X SoC – Step 13: Placement Shell Wrapper
# Invokes OpenROAD with the placement TCL script.
# Technology : SCL 180nm / OSU018
# Author      : Physical Design Flow
# Date        : 2026-05-28
################################################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="${SCRIPT_DIR}/Output_Files"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "${LOG_DIR}"

echo "========================================================"
echo "  SMVDU TITAN-X SoC – Step 13: Standard Cell Placement"
echo "  Technology : SCL 180nm / OSU018"
echo "  Timestamp  : ${TIMESTAMP}"
echo "========================================================"

# ── Check OpenROAD availability ─────────────────────────────────────────────
if command -v openroad &>/dev/null; then
    echo "[INFO] OpenROAD found at: $(which openroad)"
    echo "[INFO] Running TCL-driven placement …"
    openroad -exit "${SCRIPT_DIR}/place.tcl" \
        2>&1 | tee "${LOG_DIR}/placement.log"
else
    echo "[WARN] OpenROAD not found – running Python placement estimator …"
    python3 "${SCRIPT_DIR}/run_placement.py" \
        2>&1 | tee "${LOG_DIR}/placement.log"
fi

echo ""
echo "[INFO] Placement outputs written to: ${LOG_DIR}/"
echo "[INFO] Key output files:"
echo "       - ${LOG_DIR}/placement_summary.rpt"
echo "       - ${LOG_DIR}/placement_density.rpt"
echo "       - ${LOG_DIR}/titan_x_top_placed.def (simulated)"
echo "========================================================"
echo "  Step 13 COMPLETE"
echo "========================================================"
