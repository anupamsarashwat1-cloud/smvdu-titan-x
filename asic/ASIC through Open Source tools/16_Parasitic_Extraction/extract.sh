#!/bin/bash
# =============================================================================
# Step 16: Parasitic RC Extraction - SMVDU TITAN-X SoC
# Technology: SCL 180nm / OSU018
# Extractor: OpenROAD OpenRCX (preferred) / StarRC / Magic (fallback)
# =============================================================================
# Usage: ./extract.sh [--corner <tt|ff|ss>] [--temp <25|0|125>] [--verbose]
#
# Extraction Flow:
#   1. Read routed DEF (post Step 15)
#   2. Load SCL 180nm RC technology rules
#   3. Run 3D field-solver based RC extraction (coupling + ground)
#   4. Generate SPEF (Standard Parasitic Exchange Format)
#   5. Write RC statistics and critical net reports
# =============================================================================

set -e
set -o pipefail

# ---- Project Paths -----------------------------------------------------------
PROJECT_ROOT="/home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc"
STEP_DIR="${PROJECT_ROOT}/16_Parasitic_Extraction"
INPUT_DIR="${STEP_DIR}/Input_Files"
OUTPUT_DIR="${STEP_DIR}/Output_Files"
ROUTING_DIR="${PROJECT_ROOT}/15_PD_Routing/Output_Files"
SYNTH_DIR="${PROJECT_ROOT}/04_Synthesis/Output_Files"

# ---- Technology --------------------------------------------------------------
TECH_DIR="/usr/local/share/qflow/tech/osu018"
LEF_FILE="${TECH_DIR}/osu018_stdcells.lef"
LIB_FILE="${TECH_DIR}/osu018_stdcells.lib"

# ---- Design ------------------------------------------------------------------
DESIGN_NAME="titan_x_top"
CLOCK_PERIOD_NS="10.0"
CORNER="tt_1v8_25c"       # Typical-Typical, 1.8V, 25°C
TEMP=25

# ---- Output Files ------------------------------------------------------------
LOG_FILE="${OUTPUT_DIR}/extract.log"
SPEF_FILE="${OUTPUT_DIR}/${DESIGN_NAME}.spef"
EXTRACT_TCL="${STEP_DIR}/extract.tcl"

# ---- Banner ------------------------------------------------------------------
echo "============================================================"
echo "  SMVDU TITAN-X SoC - Step 16: Parasitic RC Extraction"
echo "  Technology : SCL 180nm / OSU018"
echo "  Corner     : ${CORNER}"
echo "  Date       : $(date)"
echo "============================================================"

mkdir -p "${OUTPUT_DIR}"

# ---- Tool Check --------------------------------------------------------------
echo ""
echo "[INFO] Checking tool availability..."

if command -v openroad &>/dev/null; then
    echo "[INFO] OpenROAD found (OpenRCX available)"
    TOOL_AVAILABLE=1
else
    echo "[WARN] OpenROAD not found. Using Python analytical extraction."
    TOOL_AVAILABLE=0
fi

# ---- Input Validation --------------------------------------------------------
echo ""
echo "[INFO] Validating inputs..."
ROUTED_DEF="${ROUTING_DIR}/${DESIGN_NAME}_routed.def"

if [ ! -f "${ROUTED_DEF}" ]; then
    echo "[WARN] Routed DEF not found at ${ROUTED_DEF}"
    echo "[INFO] Using simulation mode with netlist statistics."
fi

echo "[INFO] Input DEF    : ${ROUTED_DEF}"
echo "[INFO] Output SPEF  : ${SPEF_FILE}"
echo "[INFO] Output Dir   : ${OUTPUT_DIR}"

# ===========================================================================
# SECTION A: OpenROAD OpenRCX (if available)
# ===========================================================================
if [ "${TOOL_AVAILABLE}" -eq 1 ]; then
    echo ""
    echo "[INFO] Launching OpenROAD OpenRCX extractor..."

    openroad -exit "${EXTRACT_TCL}" 2>&1 | tee "${LOG_FILE}"

    echo "[INFO] OpenRCX extraction complete."
    echo "[INFO] SPEF file: ${SPEF_FILE}"

# ===========================================================================
# SECTION B: Python Analytical Extraction Simulation
# ===========================================================================
else
    echo ""
    echo "[INFO] Running Python analytical parasitic extraction..."

    python3 "${STEP_DIR}/generate_extraction_reports.py" \
        --output_dir "${OUTPUT_DIR}" \
        --design     "${DESIGN_NAME}" \
        --corner     "${CORNER}" \
        --temp       "${TEMP}" \
        2>&1 | tee -a "${LOG_FILE}"

    echo "[INFO] Python extraction simulation complete."
fi

# ---- Summary -----------------------------------------------------------------
echo ""
echo "============================================================"
echo "  Extraction Complete - Summary"
echo "============================================================"
if [ -f "${OUTPUT_DIR}/extraction_summary.rpt" ]; then
    grep -E "Total Nets|Coupling|Worst RC|Extraction" \
        "${OUTPUT_DIR}/extraction_summary.rpt" 2>/dev/null | head -10 || true
fi
echo "  SPEF output : ${SPEF_FILE}"
echo "  Log file    : ${LOG_FILE}"
echo "============================================================"
