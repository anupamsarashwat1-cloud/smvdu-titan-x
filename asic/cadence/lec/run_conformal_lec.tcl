# ==============================================================================
# SMVDU-TITAN-X Cadence Conformal Logical Equivalence Checking (LEC)
#
# Target Flow: Golden RTL vs. Synthesized Netlist Equivalency Verification
# Tool: Cadence Conformal LEC (lec)
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

# 1. Define Design Library Searches & Options
set log_file "../logs/conformal_lec.log"

puts "========================================================================"
puts "  READING GOLDEN DESIGN (RTL SOURCES)                                   "
puts "========================================================================"

# Set to Golden Design mode (read RTL)
set_system_mode golden

# Read Technology Library Models (Standard Cells LEF/lib)
# Use -lib to read as library cells
read_library -lib -both {sc_core_typ.lib memory_sram_typ.lib}

# Read synthesizable Golden RTL Verilog
read_design -verilog -golden {
  ../../phases/final-integration/rtl_handoff/titan_x_final_top.v
}

# 2. Reading Revised Design (Post-Synthesis Netlist)
puts "========================================================================"
puts "  READING REVISED DESIGN (SYNTHESIZED STRUCTURAL NETLIST)               "
puts "========================================================================"

# Set to Revised Design mode
set_system_mode revised

# Read post-synthesis gate-level netlist
read_design -verilog -revised {
  ../outputs/titan_x_netlist.v
}

# 3. Pin Mapping and Constraints Match
puts "========================================================================"
puts "  MAP KEY REGISTERS & RESOLVE PORT MATCHING                            "
puts "========================================================================"
set_system_mode lec

# Perform automatic pin and state element mapping
add_mapped_points -all

# 4. Run Conformal Logical Equivalence Checking
puts "========================================================================"
puts "  EXECUTING FORMAL EQUIVALENCE CHECKING RUN                             "
puts "========================================================================"
compare

# 5. Extract Verification Verdict
puts "========================================================================"
puts "  LEC COMPARISON COMPLETE. EXTRACTING REPORT                           "
puts "========================================================================"
report_verification -file "../reports/lec_verification_verdict.rpt"

exit
