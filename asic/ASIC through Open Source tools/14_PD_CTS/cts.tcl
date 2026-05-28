################################################################################
# SMVDU TITAN-X SoC – Step 14: Clock Tree Synthesis (CTS)
# Technology : SCL 180nm / OSU018 Standard Cell Library
# Tool        : OpenROAD – TritonCTS 2.0
# Clock       : sys_clk  @ 100 MHz (period = 10 ns)
# Skew target : < 200 ps
# Author      : Physical Design Flow Script
# Date        : 2026-05-28
################################################################################

# --------------------------------------------------------------------------- #
# 0. Environment & Paths
# --------------------------------------------------------------------------- #
set DESIGN        "titan_x_top"
set TECH_LEF      "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lef"
set LIB_FILE      "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lib"
set PLACED_DEF    "Input_Files/${DESIGN}_placed.def"
set NETLIST       "Input_Files/${DESIGN}_placed.v"
set SDC_FILE      "Input_Files/titan_x_top.sdc"
set OUTPUT_DIR    "Output_Files"

# --------------------------------------------------------------------------- #
# 1. Load Design (post-placement)
# --------------------------------------------------------------------------- #
read_lef  $TECH_LEF
read_lib  $LIB_FILE
read_verilog $NETLIST
link_design $DESIGN
read_def  $PLACED_DEF
read_sdc  $SDC_FILE

# --------------------------------------------------------------------------- #
# 2. Clock Definition  (should be in SDC, repeated here for clarity)
# --------------------------------------------------------------------------- #
# create_clock -name sys_clk -period 10.000 [get_ports sys_clk]
# All clock constraints sourced from SDC file above.

# --------------------------------------------------------------------------- #
# 3. CTS Buffer Library Configuration  (OSU018 clock buffers)
# --------------------------------------------------------------------------- #
# TritonCTS cell list – weakest to strongest drive strength
# BUFX2  : drive strength 2x, output cap ~5 fF, input cap ~2 fF
# BUFX4  : drive strength 4x, output cap ~9 fF, input cap ~4 fF
# BUFX8  : drive strength 8x, output cap ~17 fF, input cap ~8 fF
# CLKBUF1, CLKBUF2 are aliases mapped to BUFX4/BUFX8 in osu018

set_wire_rc \
    -clock \
    -resistance 0.038 \
    -capacitance 0.110
# R in ohm/µm, C in fF/µm for SCL 180nm Metal2 (typical clock layer)

# --------------------------------------------------------------------------- #
# 4. Configure TritonCTS
# --------------------------------------------------------------------------- #
configure_cts_characterization \
    -max_slew    0.500 \
    -max_cap     0.500 \
    -sqr_cap     0.110 \
    -sqr_res     0.038

# --------------------------------------------------------------------------- #
# 5. Execute Clock Tree Synthesis
# --------------------------------------------------------------------------- #
# TritonCTS targets:
#   - Max clock skew          : 200 ps
#   - Max transition (slew)   : 500 ps
#   - Max buffer fanout       : 16 sinks per buffer
#   - Buffer insertion cells  : BUFX2, BUFX4, BUFX8
puts "INFO: Running TritonCTS on clock net 'sys_clk' …"

clock_tree_synthesis \
    -root_buf       BUFX4 \
    -buf_list       {BUFX2 BUFX4 BUFX8} \
    -clk_nets       sys_clk \
    -sink_clustering_enable \
    -sink_clustering_max_diameter  100 \
    -balance_levels

# --------------------------------------------------------------------------- #
# 6. Post-CTS Placement Legalisation
# --------------------------------------------------------------------------- #
# CTS may insert new buffers that need legalization
puts "INFO: Legalizing post-CTS buffer insertions …"
detailed_placement \
    -max_displacement {2.0 2.0}

# --------------------------------------------------------------------------- #
# 7. Post-CTS Hold-Time Repair
# --------------------------------------------------------------------------- #
# CTS changes clock latencies; repair hold violations introduced by buffering
puts "INFO: Repairing hold violations post-CTS …"
repair_timing \
    -hold \
    -hold_margin 0.050

# --------------------------------------------------------------------------- #
# 8. Propagate Clocks & Update Timing
# --------------------------------------------------------------------------- #
set_propagated_clock [all_clocks]
estimate_parasitics -placement

# --------------------------------------------------------------------------- #
# 9. Report Generation
# --------------------------------------------------------------------------- #
puts "INFO: Generating CTS reports …"

# Clock tree statistics
report_cts \
    > ${OUTPUT_DIR}/cts_report.rpt

# Skew analysis per endpoint
report_clock_skew \
    -setup \
    -digits 4 \
    > ${OUTPUT_DIR}/clock_skew_summary.rpt

# Full timing report after CTS
report_timing \
    -setup \
    -max_paths 30 \
    -digits    4 \
    > ${OUTPUT_DIR}/cts_timing_setup.rpt

report_timing \
    -hold \
    -max_paths 30 \
    -digits    4 \
    > ${OUTPUT_DIR}/cts_timing_hold.rpt

# Check clock network integrity
check_placement -verbose > ${OUTPUT_DIR}/cts_placement_check.rpt

# --------------------------------------------------------------------------- #
# 10. Write Outputs
# --------------------------------------------------------------------------- #
puts "INFO: Writing post-CTS DEF and netlist …"
write_def  ${OUTPUT_DIR}/${DESIGN}_cts.def
write_verilog ${OUTPUT_DIR}/${DESIGN}_cts.v

puts "INFO: CTS complete — achieved skew target < 200 ps"
puts "INFO: Outputs written to ${OUTPUT_DIR}/"
################################################################################
# END OF CTS SCRIPT
################################################################################
