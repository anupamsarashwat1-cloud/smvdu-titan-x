# ==============================================================================
# SMVDU-TITAN-X Cadence Innovus Physical Implementation (PNR) Script
#
# Target Node: Standard 28nm / 180nm CMOS Standard Cell Library
# Flow Phase: Physical Placement, Clock Tree Synthesis, Detailed Routing
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

# 1. Initialize Physical Design Database & Tech LEFs
set_db init_hdl_search_path {../outputs}
set_db init_lef_file {../lib/tech.lef ../lib/sc_core.lef ../lib/memory_sram.lef ../lib/hbm_phy.lef}
set_db init_verilog {../outputs/titan_x_netlist.v}
set_db init_top_cell {titan_x_top}

# Configure Timing Analysis corners (Multi-Mode Multi-Corner)
set_db init_timing_analysis_type ocv
set_db init_power_nets {VDD}
set_db init_ground_nets {VSS}

# Initialize Design Hierarchy
init_design

# 2. Floorplanning & Macro Placement Configuration
# Define boundary: Aspect ratio 1.0 (Square), Core utilization 70%, 15um margin
create_floorplan -core_density_size_by {utilization} -core_utilization 0.70 \
                 -aspect_ratio 1.0 -left_margin 15.0 -right_margin 15.0 \
                 -top_margin 15.0 -bottom_margin 15.0

# Standard Cell / Macro Reservation Placement
# Anchor SRAM and memory bus controllers along boundaries to prevent routing congestion
place_cell {u_dut/memory_sram_macro} 50.0 50.0 R0
place_cell {u_dut/hbm_phy_macro} 450.0 50.0 R0

# Create Placement Halos around physical memory blocks (prevent cell insertion inside macro boundary)
create_halo -macro -all -halo_width 5.0

# 3. Power Planning (PG Grid Generation)
# Define Rings around Chip boundaries
add_rings -nets {VDD VSS} -width 5.0 -spacing 2.0 -layer {vertical metal6 horizontal metal5}

# Add vertical and horizontal stripes for solid power distribution
add_stripes -nets {VDD VSS} -width 3.0 -spacing 10.0 -set_to_set_distance 60.0 -layer metal6

# 4. Standard Cell Placement
puts "========================================================================"
puts "  EXECUTING PLACEMENT & CONGESTION OPTIMIZATION                         "
puts "========================================================================"
place_opt_design -effort high

# Analyze placement congestion and timing slack
check_place_congestion
report_timing -corner typ -max_paths 10

# 5. Clock Tree Synthesis (CTS)
puts "========================================================================"
puts "  EXECUTING CLOCK TREE SYNTHESIS (CTS) VIA CCOPT                        "
puts "========================================================================"
# Auto-configure Clock Tree buffers, inverters, and routing layers
create_ccopt_clock_tree_spec
ccopt_design -effort medium

# Generate CTS skew and latency reports
report_ccopt_clock_trees > ../reports/titan_x_cts.rpt
report_ccopt_skew_groups > ../reports/titan_x_skew.rpt

# 6. Detailed Routing (NanoRoute)
puts "========================================================================"
puts "  EXECUTING NANO-ROUTE DETAILED SIGNAL ROUTING                           "
puts "========================================================================"
# Run timing-driven detail routing
route_design -effort high

# Optimize design post-routing to resolve timing violations (Setup/Hold)
opt_design -post_route -hold
opt_design -post_route -setup

# 7. Signoff Static Timing Analysis & Physical Verification
puts "========================================================================"
puts "  RUNNING SIGNOFF PHYSICAL VERIFICATION & DRC/LVS CHECKS                "
puts "========================================================================"
verify_drc     > ../reports/titan_x_drc.rpt
verify_lvs     > ../reports/titan_x_lvs.rpt
verify_antenna > ../reports/titan_x_antenna.rpt

# Check timing metrics and timing slack summaries
report_timing -corner worst -max_paths 50 > ../reports/titan_x_signoff_timing.rpt
report_power -corner typ                  > ../reports/titan_x_signoff_power.rpt

# 8. Export Physical GDSII Layout & parasitics
puts "========================================================================"
puts "  EXPORTING FINAL ASIC TAPE-OUT GDSII LAYOUT STREAM                    "
puts "========================================================================"
write_stream -format gds ../outputs/titan_x_layout.gds
write_parasitics -format spef ../outputs/titan_x_extraction.spef

puts "========================================================================"
puts "  INNOVUS PHYSICAL IMPLEMENTATION COMPLETE. GDSII STREAM GENERATED.    "
puts "========================================================================"
exit
