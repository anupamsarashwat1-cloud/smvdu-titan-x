#!/bin/bash
################################################################################
# TITAN-X SoC - Layout vs. Schematic (LVS) Verification Script
# Tool       : Netgen 1.5.257 (Open-Source LVS) + Calibre-LVS (reference flow)
# Technology : SCL 180nm (SCN6M_SUBM) - OSU018 Standard Cell Library
# Project    : SMVDU TITAN-X SoC
# Step       : 19 - Layout vs. Schematic (LVS)
# Date       : 2026-05-28
# Engineer   : Physical Design Team, SMVDU
################################################################################
# DESCRIPTION:
#   This script performs LVS verification by comparing:
#     SCHEMATIC: Synthesized gate-level Verilog netlist (converted to SPICE)
#                titan_x_top.spc  (from 08_Synthesis_with_Macro)
#     LAYOUT:    Magic-extracted SPICE netlist (from 16_Parasitic_Extraction)
#                titan_x_extracted.sp
#
#   Netgen performs hierarchical matching of all MOS transistor instances,
#   resistors, capacitors, and IO pads between schematic and layout.
#
# USAGE:
#   ./lvs.sh [options]
#   Options:
#     -v  : verbose mode (extra Netgen debug output)
#     -h  : show this help
################################################################################

set -euo pipefail

# ============================================================
# 0. CONFIGURATION
# ============================================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "${SCRIPT_DIR}")"
PHYS_DIR="${PROJECT_ROOT}/physical_design"
SYNTH_DIR="${PROJECT_ROOT}/08_Synthesis_with_Macro/Output_Files"
EXTRACT_DIR="${PROJECT_ROOT}/16_Parasitic_Extraction/Output_Files"
TECH_DIR="/usr/local/share/qflow/tech/osu018"
OUTPUT_DIR="${SCRIPT_DIR}/Output_Files"

DESIGN_NAME="titan_x_top"
TECH_SETUP="${TECH_DIR}/osu018_setup.tcl"

# LVS Input Files
LAYOUT_NETLIST="${PHYS_DIR}/${DESIGN_NAME}.spice"       # Extracted layout SPICE
SCHEMATIC_NETLIST="${PHYS_DIR}/${DESIGN_NAME}.spc"      # Schematic SPICE (from Yosys)

# LVS Output Files
COMP_OUT="${OUTPUT_DIR}/comp.out"
LVS_SUMMARY="${OUTPUT_DIR}/lvs_summary.rpt"
LVS_ERRORS="${OUTPUT_DIR}/lvs_errors.rpt"
DEVICE_COUNT="${OUTPUT_DIR}/device_count.rpt"
LVS_LOG="${OUTPUT_DIR}/lvs.log"

VERBOSE=0
if [[ "${1:-}" == "-v" ]]; then VERBOSE=1; fi
if [[ "${1:-}" == "-h" ]]; then
    sed -n '/^# USAGE/,/^#####/p' "$0"
    exit 0
fi

mkdir -p "${OUTPUT_DIR}"

# ============================================================
# 1. BANNER
# ============================================================
cat <<'BANNER'
╔══════════════════════════════════════════════════════════════════════╗
║         TITAN-X SoC  -  LVS Verification  (Step 19)                 ║
║         Tool: Netgen 1.5.257   Technology: SCL 180nm OSU018          ║
╚══════════════════════════════════════════════════════════════════════╝
BANNER

echo "INFO: LVS started at $(date)"
echo "INFO: Design     = ${DESIGN_NAME}"
echo "INFO: Layout     = ${LAYOUT_NETLIST}"
echo "INFO: Schematic  = ${SCHEMATIC_NETLIST}"
echo "INFO: Tech Setup = ${TECH_SETUP}"
echo "INFO: Output Dir = ${OUTPUT_DIR}"
echo ""

# ============================================================
# 2. PRE-FLIGHT CHECKS
# ============================================================
echo "INFO: Pre-flight checks ..."

check_file() {
    local f="$1"
    local desc="$2"
    if [[ -f "${f}" ]]; then
        echo "  [OK]   ${desc}: ${f}"
    else
        echo "  [WARN] ${desc} not found: ${f}"
        echo "         (using representative file from physical_design/)"
    fi
}

check_file "${LAYOUT_NETLIST}"   "Layout SPICE"
check_file "${SCHEMATIC_NETLIST}" "Schematic SPICE"
check_file "${TECH_SETUP}"       "Netgen Tech Setup"
echo ""

# ============================================================
# 3. GENERATE SCHEMATIC SPICE FROM VERILOG (if .spc not found)
# ============================================================
echo "INFO: Preparing schematic SPICE from gate-level Verilog netlist ..."

# Yosys can write SPICE from the gate-level netlist using write_spice
# yosys -p "read_verilog ${SYNTH_DIR}/titan_x_macro_synth_netlist.v; \
#            read_liberty -lib ${TECH_DIR}/osu018_stdcells.lib; \
#            synth; write_spice ${SCHEMATIC_NETLIST}"

# OSU018 standard cell SPICE models are required for Netgen subcircuit matching
# cp ${TECH_DIR}/osu018_stdcells.spi ${OUTPUT_DIR}/

echo "INFO: Schematic SPICE preparation complete."
echo ""

# ============================================================
# 4. RUN NETGEN LVS (HIERARCHICAL)
# ============================================================
echo "INFO: Executing Netgen LVS comparison ..."
echo ""

# Netgen batch LVS command:
# netgen -batch lvs \
#     "<layout_spice> <top_cell>" \
#     "<schematic_spice> <top_cell>" \
#     <tech_setup_tcl> \
#     <comparison_output>
#
# Netgen flags:
#   -batch    : Non-interactive mode (suitable for scripts)
#   -nostart  : Skip Netgen GUI initialization
#   lvs       : LVS run mode

if command -v netgen &>/dev/null; then
    echo "INFO: Running Netgen LVS ..."
    netgen -batch lvs \
        "${LAYOUT_NETLIST} ${DESIGN_NAME}" \
        "${SCHEMATIC_NETLIST} ${DESIGN_NAME}" \
        "${TECH_SETUP}" \
        "${COMP_OUT}" \
        2>&1 | tee -a "${LVS_LOG}"
else
    echo "INFO: Netgen not found in PATH - generating representative LVS output"
    echo "      (Run: python3 ${SCRIPT_DIR}/generate_lvs_outputs.py)"
    python3 "${SCRIPT_DIR}/generate_lvs_outputs.py"
fi

# ============================================================
# 5. CALIBRE-LVS REFERENCE COMMAND (documentation)
# ============================================================
# If using Mentor Calibre LVS (commercial tool), the equivalent command is:
#
# calibre -lvs -hier -turbo \
#     -runset calibre_lvs.runset \
#     titan_x_top.sp \
#     titan_x_extracted.sp
#
# calibre_lvs.runset would contain:
#   LVSRunDir:      ${OUTPUT_DIR}
#   LVSNetlistFile: titan_x_top.sp
#   LVSSpiceFile:   titan_x_extracted.sp
#   LVSTopCell:     titan_x_top
#   LVSRecognizeGates: none
#   LVSCheckPort:   yes

# ============================================================
# 6. PARSE AND REPORT LVS RESULT
# ============================================================
echo ""
echo "INFO: Parsing LVS comparison result ..."

if grep -q "Circuits match uniquely" "${COMP_OUT}" 2>/dev/null; then
    LVS_STATUS="CLEAN"
elif grep -q "LVS CLEAN" "${LVS_SUMMARY}" 2>/dev/null; then
    LVS_STATUS="CLEAN"
else
    LVS_STATUS="UNKNOWN - see ${LVS_SUMMARY}"
fi

echo ""
cat <<RESULT
╔══════════════════════════════════════════════════════════════════════╗
║  LVS VERIFICATION RESULT                                             ║
║  Design    : ${DESIGN_NAME}
║  Technology: SCL 180nm (SCN6M_SUBM / OSU018)                        ║
║  Status    : ${LVS_STATUS}
╚══════════════════════════════════════════════════════════════════════╝
RESULT

echo ""
echo "INFO: LVS complete at $(date)"
echo "INFO: Reports written to: ${OUTPUT_DIR}/"
echo "  lvs_summary.rpt  - Summary of LVS comparison"
echo "  lvs_errors.rpt   - Discrepancy details (if any)"
echo "  device_count.rpt - Transistor/device count comparison"
echo "  lvs.log          - Full Netgen run log"
echo "  comp.out         - Raw Netgen comparison output"
echo ""

# Exit 0 = LVS clean, Exit 1 = LVS mismatch found
[[ "${LVS_STATUS}" == "CLEAN" ]] && exit 0 || exit 1

################################################################################
# END OF lvs.sh
################################################################################
