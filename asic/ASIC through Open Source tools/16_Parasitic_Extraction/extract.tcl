###############################################################################
# extract.tcl - StarRC/OpenRCX Parasitic Extraction Script
# SMVDU TITAN-X SoC | OSU018 180nm | Step 16
#
# Supported extraction flows:
#   (A) StarRC   - Synopsys parasitic extractor (licensed)
#   (B) OpenRCX  - OpenROAD's open-source RCX (via OpenROAD)
#   (C) Magic    - Open-source extractor (fallback)
#
# This script targets OpenRCX (OpenROAD's built-in extractor).
# It is invoked by extract.sh and produces:
#   - SPEF (Standard Parasitic Exchange Format) file
#   - RC extraction report
###############################################################################

# ===========================================================================
# 1. Project Configuration
# ===========================================================================
set DESIGN_NAME    "titan_x_top"
set TECH_NODE      "scl180nm"
set CLOCK_NAME     "clk"
set CLOCK_PERIOD   10.0

set PROJECT_ROOT   "/home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc"
set STEP_DIR       "${PROJECT_ROOT}/16_Parasitic_Extraction"
set OUTPUT_DIR     "${STEP_DIR}/Output_Files"
set ROUTING_DIR    "${PROJECT_ROOT}/15_PD_Routing/Output_Files"
set SYNTH_DIR      "${PROJECT_ROOT}/04_Synthesis/Output_Files"

set LEF_FILE       "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lef"
set TECH_LEF       "/usr/local/share/qflow/tech/osu018/osu018.tech.lef"
set LIB_FILE       "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lib"

# 180nm process corner (Typical-Typical at 25°C)
set CORNER_NAME    "tt_1v8_25c"
set TEMP_CELSIUS   25
set VDD_VOLTAGE    1.8

# RCX process file (technology-specific extraction rules)
set RCX_RULES_FILE "${STEP_DIR}/scl180nm_rcx_rules.itf"

# Input/Output files
set INPUT_DEF      "${ROUTING_DIR}/${DESIGN_NAME}_routed.def"
set INPUT_NETLIST  "${SYNTH_DIR}/titan_x_synth_netlist.v"
set OUTPUT_SPEF    "${OUTPUT_DIR}/${DESIGN_NAME}.spef"

puts "INFO: ============================================================"
puts "INFO: SMVDU TITAN-X SoC - Step 16: Parasitic RC Extraction"
puts "INFO: Technology : OSU018 180nm"
puts "INFO: Corner     : $CORNER_NAME  ($TEMP_CELSIUS°C, ${VDD_VOLTAGE}V)"
puts "INFO: ============================================================"

# ===========================================================================
# 2. Read Libraries
# ===========================================================================
puts "INFO: Loading technology LEF..."
read_lef ${TECH_LEF}

puts "INFO: Loading standard cell LEF..."
read_lef ${LEF_FILE}

puts "INFO: Loading Liberty library (corner: $CORNER_NAME)..."
read_liberty -corner ${CORNER_NAME} ${LIB_FILE}

# ===========================================================================
# 3. Read Routed Netlist and DEF
# ===========================================================================
puts "INFO: Reading post-route Verilog netlist..."
read_verilog ${INPUT_NETLIST}
link_design  ${DESIGN_NAME}

puts "INFO: Reading routed DEF..."
read_def ${INPUT_DEF}

# ===========================================================================
# 4. Define Timing Constraints (needed for SPEF annotation)
# ===========================================================================
create_clock -name ${CLOCK_NAME} \
             -period ${CLOCK_PERIOD} \
             [get_ports ${CLOCK_NAME}]

set_clock_uncertainty -setup 0.15 [get_clocks ${CLOCK_NAME}]
set_clock_uncertainty -hold  0.05 [get_clocks ${CLOCK_NAME}]
set_input_delay  -clock ${CLOCK_NAME} -max 2.0 [all_inputs]
set_output_delay -clock ${CLOCK_NAME} -max 2.0 [all_outputs]

# ===========================================================================
# 5. OpenRCX Extraction Setup
# ===========================================================================
puts "INFO: ============================================================"
puts "INFO: Configuring OpenRCX (OpenROAD built-in extractor)"
puts "INFO: ============================================================"

# Load process-specific extraction rules (RC technology file)
# For OSU018 180nm: Rsh(M1)=0.08 Ω/sq, C(M1-M2)=35 aF/μm²
define_process_corner -ext_model_index 0 ${CORNER_NAME}

# ===========================================================================
# 6. Run Parasitic Extraction
# ===========================================================================
puts "INFO: Running OpenRCX parasitic extraction..."

# Step 6a: Pattern-based coupling extraction
extract_parasitics \
    -ext_model_file    ${RCX_RULES_FILE} \
    -corner_cnt        1 \
    -max_res           5.0 \
    -coupling_threshold 0.1 \
    -cc_model          12 \
    -context_depth     5 \
    -no_merge_via_res  false

puts "INFO: Pattern extraction complete."

# Step 6b: Coupling-aware extraction (aggressor nets)
# Enable coupling capacitance for nets with significant coupling
extract_parasitics \
    -ext_model_file    ${RCX_RULES_FILE} \
    -with_density      true \
    -lef_res           false \
    -eco_ext           false

puts "INFO: Coupling capacitance extraction complete."

# ===========================================================================
# 7. SPEF Generation
# ===========================================================================
puts "INFO: Writing SPEF parasitic data..."

write_spef \
    -corner    ${CORNER_NAME} \
    -nets      [get_nets *] \
    ${OUTPUT_SPEF}

puts "INFO: SPEF written: $OUTPUT_SPEF"

# ===========================================================================
# 8. Post-Extraction Timing Analysis (with parasitics)
# ===========================================================================
puts "INFO: ============================================================"
puts "INFO: Post-Extraction STA with Parasitic Back-Annotation"
puts "INFO: ============================================================"

read_spef ${OUTPUT_SPEF}

report_checks \
    -path_delay max \
    -format full_clock_expanded \
    -digits 4 \
    > "${OUTPUT_DIR}/timing_postextract_setup.rpt"

report_checks \
    -path_delay min \
    -format full_clock_expanded \
    -digits 4 \
    > "${OUTPUT_DIR}/timing_postextract_hold.rpt"

# ===========================================================================
# 9. Extraction Reports
# ===========================================================================
puts "INFO: Generating extraction reports..."

report_wire_length \
    > "${OUTPUT_DIR}/wire_rc_report.rpt"

# RC statistics
report_net_parasitics \
    -threshold 0.01 \
    > "${OUTPUT_DIR}/net_parasitics.rpt"

puts "INFO: ============================================================"
puts "INFO: Parasitic Extraction Complete"
puts "INFO: Outputs:"
puts "INFO:   SPEF : ${OUTPUT_SPEF}"
puts "INFO:   Dir  : ${OUTPUT_DIR}/"
puts "INFO: ============================================================"