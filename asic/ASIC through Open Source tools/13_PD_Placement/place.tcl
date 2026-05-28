################################################################################
# SMVDU TITAN-X SoC – Step 13: Standard Cell Placement
# Technology : SCL 180nm / OSU018 Standard Cell Library
# Tool        : OpenROAD (open_sta + replace + resizer flow)
# Author      : Physical Design Flow Script
# Date        : 2026-05-28
################################################################################

# --------------------------------------------------------------------------- #
# 0. Environment & Paths
# --------------------------------------------------------------------------- #
set DESIGN         "titan_x_top"
set TECH_LEF       "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lef"
set EXTRA_LEFS     [list]
set LIB_FILE       "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lib"
set NETLIST        "../04_Synthesis/Output_Files/titan_x_synth_netlist.v"
set SDC_FILE       "Input_Files/titan_x_top.sdc"
set FLOORPLAN_DEF  "Input_Files/titan_x_top_fp.def"
set OUTPUT_DIR     "Output_Files"

# --------------------------------------------------------------------------- #
# 1. Read Libraries & Netlist
# --------------------------------------------------------------------------- #
read_lef  $TECH_LEF
foreach lef $EXTRA_LEFS { read_lef $lef }
read_lib  $LIB_FILE
read_verilog $NETLIST
link_design $DESIGN

# --------------------------------------------------------------------------- #
# 2. Load Floorplan DEF (established in Step 11 / Step 12)
# --------------------------------------------------------------------------- #
read_def $FLOORPLAN_DEF

# --------------------------------------------------------------------------- #
# 3. Timing Constraints
# --------------------------------------------------------------------------- #
read_sdc $SDC_FILE

# --------------------------------------------------------------------------- #
# 4. Global Placement  (RePlAce engine via OpenROAD)
# --------------------------------------------------------------------------- #
# Target density = 0.60  (matches floorplan utilization target)
# Overflow convergence threshold = 0.1
# Timing-driven mode: enabled
puts "INFO: Starting global placement …"
global_placement \
    -density        0.60 \
    -init_density_penalty 8e-5 \
    -timing_driven \
    -overflow       0.1 \
    -verbose        1

# --------------------------------------------------------------------------- #
# 5. I/O Pin Assignment Legalisation
# --------------------------------------------------------------------------- #
# Pins already assigned in floorplan step; perform legalization pass
place_pins \
    -random_seed   42 \
    -hor_layers    metal2 \
    -ver_layers    metal1

# --------------------------------------------------------------------------- #
# 6. Detailed Placement  (OpenDP legaliser)
# --------------------------------------------------------------------------- #
# Max displacement: 5µm in x and y
puts "INFO: Legalizing global placement …"
detailed_placement \
    -max_displacement {5.0 5.0}

# --------------------------------------------------------------------------- #
# 7. Placement-Aware Timing Optimisation  (OpenROAD resizer)
# --------------------------------------------------------------------------- #
# Repair max-cap, max-fanout, max-transition violations after placement
puts "INFO: Running post-placement timing repair …"
repair_design \
    -max_wire_length    500 \
    -slew_margin        0.1 \
    -cap_margin         0.1

# Repair setup violations by cloning/upsizing
repair_timing \
    -setup \
    -hold  \
    -setup_margin 0.3 \
    -hold_margin  0.1

# --------------------------------------------------------------------------- #
# 8. Check Placement
# --------------------------------------------------------------------------- #
check_placement -verbose

# --------------------------------------------------------------------------- #
# 9. Report Generation
# --------------------------------------------------------------------------- #
puts "INFO: Writing placement reports …"

report_placement_density \
    -n_grids_x 8 \
    -n_grids_y 8 \
    > ${OUTPUT_DIR}/placement_density.rpt

report_design_area \
    > ${OUTPUT_DIR}/placement_area.rpt

report_timing \
    -digits 4 \
    -max_paths 20 \
    > ${OUTPUT_DIR}/placement_timing.rpt

report_wire_length \
    > ${OUTPUT_DIR}/placement_hpwl.rpt

# --------------------------------------------------------------------------- #
# 10. Write Outputs
# --------------------------------------------------------------------------- #
puts "INFO: Writing placed DEF …"
write_def ${OUTPUT_DIR}/${DESIGN}_placed.def

puts "INFO: Writing placed netlist (post-resize) …"
write_verilog ${OUTPUT_DIR}/${DESIGN}_placed.v

# Summary
report_design_area
puts "INFO: Placement complete — see ${OUTPUT_DIR}/"
################################################################################
# END OF PLACEMENT SCRIPT
################################################################################
