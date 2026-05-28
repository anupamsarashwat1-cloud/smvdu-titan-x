###############################################################################
# route.tcl - OpenROAD TritonRoute Script for SMVDU TITAN-X SoC
# Technology: SCL 180nm / OSU018  |  Target: 100 MHz
# Invoked by: route.sh
###############################################################################

# ---------------------------------------------------------------------------
# 1. Environment Setup
# ---------------------------------------------------------------------------
set DESIGN_NAME   "titan_x_top"
set CLOCK_NAME    "clk"
set CLOCK_PERIOD  10.0

set PROJECT_ROOT  "/home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc"
set STEP_DIR      "${PROJECT_ROOT}/15_PD_Routing"
set OUTPUT_DIR    "${STEP_DIR}/Output_Files"
set SYNTH_DIR     "${PROJECT_ROOT}/04_Synthesis/Output_Files"
set CTS_DIR       "${PROJECT_ROOT}/14_PD_CTS/Output_Files"

set LEF_FILE      "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lef"
set TECH_LEF      "/usr/local/share/qflow/tech/osu018/osu018.tech.lef"
set LIB_FILE      "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lib"

set INPUT_DEF     "${CTS_DIR}/${DESIGN_NAME}_cts.def"
set INPUT_NETLIST "${SYNTH_DIR}/titan_x_synth_netlist.v"

puts "INFO: ============================================================"
puts "INFO: OpenROAD Detailed Routing - SMVDU TITAN-X SoC"
puts "INFO: Technology : SCL 180nm / OSU018"
puts "INFO: ============================================================"

# ---------------------------------------------------------------------------
# 2. Read Libraries and Technology
# ---------------------------------------------------------------------------
puts "INFO: Reading technology LEF..."
read_lef ${TECH_LEF}

puts "INFO: Reading standard cell LEF..."
read_lef ${LEF_FILE}

puts "INFO: Reading Liberty timing library..."
read_liberty ${LIB_FILE}

# ---------------------------------------------------------------------------
# 3. Read Netlist (post-CTS)
# ---------------------------------------------------------------------------
puts "INFO: Reading post-CTS Verilog netlist..."
read_verilog ${INPUT_NETLIST}
link_design ${DESIGN_NAME}

# ---------------------------------------------------------------------------
# 4. Read Placement DEF (post-CTS)
# ---------------------------------------------------------------------------
puts "INFO: Reading post-CTS DEF..."
read_def ${INPUT_DEF}

# ---------------------------------------------------------------------------
# 5. Create Timing Constraints
# ---------------------------------------------------------------------------
puts "INFO: Creating clock constraints..."
create_clock -name ${CLOCK_NAME} \
             -period ${CLOCK_PERIOD} \
             [get_ports ${CLOCK_NAME}]

set_clock_uncertainty -setup 0.15 [get_clocks ${CLOCK_NAME}]
set_clock_uncertainty -hold  0.05 [get_clocks ${CLOCK_NAME}]
set_clock_transition  0.10        [get_clocks ${CLOCK_NAME}]

set_input_delay  -clock ${CLOCK_NAME} -max 2.0 [all_inputs]
set_output_delay -clock ${CLOCK_NAME} -max 2.0 [all_outputs]
set_load 0.1 [all_outputs]

# ---------------------------------------------------------------------------
# 6. Global Routing (FastRoute)
# ---------------------------------------------------------------------------
puts "INFO: ============================================================"
puts "INFO: Stage 1 - Global Routing (FastRoute)"
puts "INFO: ============================================================"

set_global_routing_layer_adjustment M1 0.5
set_global_routing_layer_adjustment M2 0.3
set_global_routing_layer_adjustment M3 0.2
set_global_routing_layer_adjustment M4 0.2
set_global_routing_layer_adjustment M5 0.4
set_global_routing_layer_adjustment M6 0.5

set_routing_layers -signal  -min M2 -max M5
set_routing_layers -clock   -min M3 -max M5

global_route \
    -guide_file         "${OUTPUT_DIR}/${DESIGN_NAME}.guide" \
    -overflow_iterations 100 \
    -allow_congestion   false \
    -verbose            1

puts "INFO: Global routing complete."

# ---------------------------------------------------------------------------
# 7. Detailed Routing (TritonRoute)
# ---------------------------------------------------------------------------
puts "INFO: ============================================================"
puts "INFO: Stage 2 - Detailed Routing (TritonRoute)"
puts "INFO: ============================================================"

detailed_route \
    -param_file         "${STEP_DIR}/titan_x_top.par" \
    -guide              "${OUTPUT_DIR}/${DESIGN_NAME}.guide" \
    -output_drc         "${OUTPUT_DIR}/${DESIGN_NAME}_drc.rpt" \
    -output_maze        "${OUTPUT_DIR}/${DESIGN_NAME}_maze.log" \
    -bottom_routing_layer M2 \
    -top_routing_layer    M5 \
    -droute_end_iter      64 \
    -via_in_pin_bottom_layer M1 \
    -via_in_pin_top_layer    M2 \
    -or_seed              42 \
    -or_k                 0 \
    -verbose              1

puts "INFO: Detailed routing complete."

# ---------------------------------------------------------------------------
# 8. Metal Fill Insertion (density requirements for planarity)
# ---------------------------------------------------------------------------
puts "INFO: Stage 3 - Metal Fill Insertion..."

density_fill \
    -rules  "${STEP_DIR}/fill_rules.json" \
    -except_edgelayer true

puts "INFO: Metal fill insertion complete."

# ---------------------------------------------------------------------------
# 9. Post-Route Timing Analysis
# ---------------------------------------------------------------------------
puts "INFO: ============================================================"
puts "INFO: Stage 4 - Post-Route Timing Analysis"
puts "INFO: ============================================================"

estimate_parasitics -global_routing

report_checks -path_delay max \
    -format full_clock_expanded \
    -fields {slew capacitance input_pins nets} \
    -digits 4 \
    -no_line_splits \
    > "${OUTPUT_DIR}/timing_setup.rpt"

report_checks -path_delay min \
    -format full_clock_expanded \
    > "${OUTPUT_DIR}/timing_hold.rpt"

report_wns -digits 4
report_tns -digits 4
report_worst_slack -digits 4

# ---------------------------------------------------------------------------
# 10. Routing Reports
# ---------------------------------------------------------------------------
puts "INFO: ============================================================"
puts "INFO: Stage 5 - Report Generation"
puts "INFO: ============================================================"

report_design_area
report_wire_length

# DRC Check
check_placement -verbose
check_antennas -ratio_margin 15

# ---------------------------------------------------------------------------
# 11. Write Output Files
# ---------------------------------------------------------------------------
puts "INFO: Writing routed DEF..."
write_def "${OUTPUT_DIR}/${DESIGN_NAME}_routed.def"

puts "INFO: Writing post-route Verilog netlist..."
write_verilog "${OUTPUT_DIR}/${DESIGN_NAME}_routed.v"

puts "INFO: Writing post-route SPEF (wire parasitics)..."
write_spef "${OUTPUT_DIR}/${DESIGN_NAME}_postroute.spef"

puts "INFO: ============================================================"
puts "INFO: Routing TCL Script Complete."
puts "INFO: ============================================================"
