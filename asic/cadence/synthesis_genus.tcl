# ==============================================================================
# SMVDU-TITAN-X Cadence Genus Synthesis Automation Script
#
# Target Node: Standard 28nm / 180nm CMOS Standard Cell Library
# Flow Phase: Logical Synthesis & Design Optimization
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

# 1. Define CAD Environment & Design Paths
set_db init_lib_search_path {../lib/typ ../lib/worst ../lib/best}
set_db init_hdl_search_path {../../phases/phase1-bare-metal/rtl/top \
                             ../../phases/phase2-boot-infra/rtl/peripherals \
                             ../../phases/phase3-linux-boot/rtl/top \
                             ../../phases/phase4-high-speed-io/rtl/top \
                             ../../phases/phase5-acceleration/rtl/top}

# CURATE Standard-Cell Target Library Models (.lib)
# Replace with actual foundry technology models
set_db library {sc_core_typ.lib memory_sram_typ.lib hbm_phy_typ.lib}
set_db lef_files {sc_core.lef memory_sram.lef hbm_phy.lef}

# 2. Read Synthesizable Verilog / SystemVerilog Sources
# Choose active Phase target (Default: Phase 5 Accelerator Top Module)
set RTL_TOP "titan_x_top"

puts "========================================================================"
puts "  READING DESIGN FILES FOR SMVDU-TITAN-X ASSEMBLY                       "
puts "========================================================================"
read_hdl -language sv {titan_x_top.v}

# 3. Elaborate and Bind Top-Level Hierarchy
puts "========================================================================"
puts "  ELABORATING TOP LEVEL DESIGN MODULE: $RTL_TOP                         "
puts "========================================================================"
elaborate $RTL_TOP

# Verify complete module binding and clean latch checks
check_design -unresolved

# 4. Load Synopsys Design Constraints (SDC)
puts "========================================================================"
puts "  APPLYING TIMING & AREA CONSTRAINTS (SDC)                             "
puts "========================================================================"
read_sdc ./titan_x_constraints.sdc

# 5. Logical Synthesis Execution
puts "========================================================================"
puts "  PHASE A: GENERIC LOGIC SYNTHESIS                                      "
puts "========================================================================"
syn_generic

puts "========================================================================"
puts "  PHASE B: GATE-LEVEL MAPPING TO TARGET STANDARD-CELLS                 "
puts "========================================================================"
syn_map

puts "========================================================================"
puts "  PHASE C: MULTI-CORNER TIMING & AREA OPTIMIZATION                     "
puts "========================================================================"
syn_opt -effort high

# 6. Generate Synthesis Reports & Verification Metrics
puts "========================================================================"
puts "  GENERATING CADENCE SYNTHESIS METRICS & TIMING PERFORMANCE REPORTS    "
puts "========================================================================"
mkdir -p ../reports
mkdir -p ../outputs

report_timing > ../reports/titan_x_timing.rpt
report_area   > ../reports/titan_x_area.rpt
report_power  > ../reports/titan_x_power.rpt
report_gates  > ../reports/titan_x_gates.rpt
report_qor    > ../reports/titan_x_qor.rpt

# Check design post-synthesis for timing/structure regressions
check_design -post_synth > ../reports/titan_x_post_synth_checks.rpt

# 7. Export Gate-Level Netlist & SDF Timing Parasitics
puts "========================================================================"
puts "  EXPORTING STRUCTURAL NETLIST FOR INNOVUS PHYSICAL PLACE-AND-ROUTE     "
puts "========================================================================"
write_hdl > ../outputs/titan_x_netlist.v
write_sdf > ../outputs/titan_x_delay.sdf

puts "========================================================================"
puts "  GENUS LOGICAL SYNTHESIS COMPLETE. NETLIST GENERATED SUCCESSFULLY.     "
puts "========================================================================"
exit
