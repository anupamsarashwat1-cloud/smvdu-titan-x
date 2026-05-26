# ==============================================================================
# SMVDU-TITAN-X Synopsys Design Constraints (SDC) File
#
# Target Frequency: 100 MHz Core / 125 MHz PCIe / 200 MHz HBM PHY
# Flow Phase: Synthesis & Placement timing constraints
#
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025 SMVDU-TITAN-X Contributors
# ==============================================================================

# 1. Define Design Clocks
# Define primary SoC System Clock (sys_clk) @ 100 MHz (10ns period)
create_clock -name sys_clk -period 10.00 [get_ports sys_clk]

# Define PCIe Gen2 Reference Clock @ 125 MHz (8ns period)
create_clock -name pcie_clk -period 8.00 [get_ports {pcie_rx_p[0]}]

# Define Virtual Clocks for off-chip interface timing analysis
create_clock -name v_sys_clk -period 10.00
create_clock -name v_pcie_clk -period 8.00

# 2. Clock Uncertainties & Margins (Modeling Jitter and Skew)
set_clock_uncertainty -setup 0.200 [get_clocks {sys_clk pcie_clk}]
set_clock_uncertainty -hold  0.080 [get_clocks {sys_clk pcie_clk}]

set_clock_transition 0.150 [get_clocks {sys_clk pcie_clk}]

# 3. Input & Output Interface Delays
# Standard off-chip delay constraint settings (Assumed 40% of clock period)
set_input_delay  -max 4.00 -clock v_sys_clk [remove_from_collection [all_inputs] [get_ports sys_clk]]
set_input_delay  -min 1.00 -clock v_sys_clk [remove_from_collection [all_inputs] [get_ports sys_clk]]

set_output_delay -max 4.00 -clock v_sys_clk [all_outputs]
set_output_delay -min 0.50 -clock v_sys_clk [all_outputs]

# PCIe Transceiver Boundary Interface Delays
set_input_delay  -max 3.20 -clock v_pcie_clk [get_ports {pcie_rx_p[*] pcie_rx_n[*]}]
set_input_delay  -min 0.80 -clock v_pcie_clk [get_ports {pcie_rx_p[*] pcie_rx_n[*]}]

set_output_delay -max 3.20 -clock v_pcie_clk [get_ports {pcie_tx_p[*] pcie_tx_n[*]}]
set_output_delay -min 0.40 -clock v_pcie_clk [get_ports {pcie_tx_p[*] pcie_tx_n[*]}]

# 4. Physical Loading & Operating Conditions
# Configure maximum capacitance and transition times for standard cell nodes
set_max_fanout 20 [current_design]
set_max_transition 0.500 [current_design]

# Model physical wire capacitance load at output boundary
set_load -max 0.05 [all_outputs]
set_load -min 0.01 [all_outputs]

# 5. False & Asynchronous Path Exceptions
# Clock domains are mutually asynchronous; declare false paths between them
set_clock_groups -asynchronous -group {sys_clk} -group {pcie_clk}

# Diagnostic LED logic is non-critical; declare false paths to outputs
set_false_path -to [get_ports {led[*]}]
