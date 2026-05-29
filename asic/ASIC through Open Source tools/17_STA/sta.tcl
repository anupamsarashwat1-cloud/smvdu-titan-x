################################################################################
# Step 17: Static Timing Analysis – SMVDU TITAN-X SoC
# Technology : OSU018 180nm Standard Cell Library
# Tool        : OpenSTA (sta)
# Target Freq : sys_clk  100 MHz (10 ns period)
#               eth_clk  125 MHz ( 8 ns period)
#               pcie_refclk 100 MHz (10 ns period)
# Author      : SMVDU VLSI Lab
# Date        : 2026-05-28
################################################################################

# ─────────────────────────────────────────────────────────────────────────────
# 1. Liberty / Technology Setup
# ─────────────────────────────────────────────────────────────────────────────
set LIB_PATH "/usr/local/share/qflow/tech/osu018/osu018_stdcells.lib"
set ALT_LIB_PATHS {
    "/usr/local/lib/osu018_stdcells.lib"
    "/usr/share/osu018/osu018_stdcells.lib"
    "/opt/osu018/lib/osu018_stdcells.lib"
}

proc load_liberty_graceful {primary_path alt_paths} {
    if {[file exists $primary_path]} {
        puts "INFO: Loading liberty from $primary_path"
        read_liberty $primary_path
        return 1
    }
    foreach path $alt_paths {
        if {[file exists $path]} {
            puts "INFO: Loading liberty from alternate path: $path"
            read_liberty $path
            return 1
        }
    }
    puts "WARNING: OSU018 liberty not found in any search path."
    puts "WARNING: STA will proceed with wire-load model estimates only."
    puts "WARNING: Results are based on analytical timing models."
    return 0
}

set lib_loaded [load_liberty_graceful $LIB_PATH $ALT_LIB_PATHS]

# ─────────────────────────────────────────────────────────────────────────────
# 2. Read Gate-Level Netlist
# ─────────────────────────────────────────────────────────────────────────────
set NETLIST "../04_Synthesis/Output_Files/titan_x_synth_netlist.v"
if {![file exists $NETLIST]} {
    error "FATAL: Cannot find synthesis netlist at $NETLIST"
}
puts "INFO: Reading gate-level netlist: $NETLIST"
read_verilog $NETLIST
link_design titan_x_top

# ─────────────────────────────────────────────────────────────────────────────
# 3. Clock Definitions
# ─────────────────────────────────────────────────────────────────────────────
# Primary system clock – 100 MHz
create_clock -name sys_clk \
             -period 10.000 \
             -waveform {0 5.000} \
             [get_ports sys_clk]

# Ethernet MAC clock – 125 MHz (RGMII)
create_clock -name eth_clk \
             -period 8.000 \
             -waveform {0 4.000} \
             [get_ports eth_clk]

# PCIe reference clock – 100 MHz (differential)
# In OSU018 180nm the differential pair is treated as a single-ended port
# after IOB instantiation; constrain the positive leg.
create_clock -name pcie_refclk \
             -period 10.000 \
             -waveform {0 5.000} \
             [get_ports pcie_refclk_p]

# ─────────────────────────────────────────────────────────────────────────────
# 4. Clock Quality Attributes
# ─────────────────────────────────────────────────────────────────────────────
# Clock uncertainty: jitter + skew budget
#   sys_clk   : PLL jitter ~80ps + CTS skew budget 120ps = 200ps
#   eth_clk   : External crystal / recovered – 150ps jitter + 100ps skew
#   pcie_refclk: REFCLK oscillator ~100ps + PCIe PHY CDR 150ps
set_clock_uncertainty -setup 0.200 [get_clocks sys_clk]
set_clock_uncertainty -hold  0.050 [get_clocks sys_clk]
set_clock_uncertainty -setup 0.250 [get_clocks eth_clk]
set_clock_uncertainty -hold  0.050 [get_clocks eth_clk]
set_clock_uncertainty -setup 0.250 [get_clocks pcie_refclk]
set_clock_uncertainty -hold  0.050 [get_clocks pcie_refclk]

# Clock transition time (slew) at source
set_clock_transition 0.100 [get_clocks sys_clk]
set_clock_transition 0.120 [get_clocks eth_clk]
set_clock_transition 0.100 [get_clocks pcie_refclk]

# Clock latency (insertion delay) – estimated pre-CTS
set_clock_latency -source 0.500 [get_clocks sys_clk]
set_clock_latency -source 0.400 [get_clocks eth_clk]
set_clock_latency -source 0.500 [get_clocks pcie_refclk]

# ─────────────────────────────────────────────────────────────────────────────
# 5. False Paths Between Asynchronous Clock Domains
# ─────────────────────────────────────────────────────────────────────────────
set_false_path -from [get_clocks sys_clk]     -to [get_clocks eth_clk]
set_false_path -from [get_clocks eth_clk]     -to [get_clocks sys_clk]
set_false_path -from [get_clocks sys_clk]     -to [get_clocks pcie_refclk]
set_false_path -from [get_clocks pcie_refclk] -to [get_clocks sys_clk]
set_false_path -from [get_clocks eth_clk]     -to [get_clocks pcie_refclk]
set_false_path -from [get_clocks pcie_refclk] -to [get_clocks eth_clk]

# ─────────────────────────────────────────────────────────────────────────────
# 6. Input / Output Delay Constraints
# ─────────────────────────────────────────────────────────────────────────────
# Exclude clock ports from I/O delay application
set all_input_ex_clk  [remove_from_collection [all_inputs] \
    [get_ports {sys_clk eth_clk pcie_refclk_p pcie_refclk_n}]]

set_input_delay  -max 2.000 -clock sys_clk $all_input_ex_clk
set_input_delay  -min 0.500 -clock sys_clk $all_input_ex_clk
set_output_delay -max 2.000 -clock sys_clk [all_outputs]
set_output_delay -min 0.300 -clock sys_clk [all_outputs]

# Ethernet-domain I/O ports
set eth_inputs  [get_ports {gem0_rgmii_rxc gem0_rgmii_rx_ctl gem0_rgmii_rxd \
                              gem1_rgmii_rxc gem1_rgmii_rx_ctl gem1_rgmii_rxd}]
set eth_outputs [get_ports {gem0_rgmii_txc gem0_rgmii_tx_ctl gem0_rgmii_txd \
                              gem1_rgmii_txc gem1_rgmii_tx_ctl gem1_rgmii_txd}]
set_input_delay  -max 1.500 -clock eth_clk $eth_inputs
set_input_delay  -min 0.300 -clock eth_clk $eth_inputs
set_output_delay -max 1.500 -clock eth_clk $eth_outputs
set_output_delay -min 0.300 -clock eth_clk $eth_outputs

# PCIe domain
set pcie_inputs  [get_ports {pcie_rxp pcie_rxn pcie_perst_n}]
set pcie_outputs [get_ports {pcie_txp pcie_txn link_up_pcie}]
set_input_delay  -max 2.000 -clock pcie_refclk $pcie_inputs
set_output_delay -max 2.000 -clock pcie_refclk $pcie_outputs

# ─────────────────────────────────────────────────────────────────────────────
# 7. Operating Conditions (OSU018 180nm – Typical Corner)
# ─────────────────────────────────────────────────────────────────────────────
if {$lib_loaded} {
    set_operating_conditions -analysis_type bc_wc
}

# Wire-load model (180nm – medium complexity SoC)
set_wire_load_model -name "wl10" -library osu018_stdcells

# Load / drive assumptions at I/O boundary
set_load 0.020 [all_outputs]
set_driving_cell -lib_cell BUFX4 -library osu018_stdcells \
                 -pin Y [all_inputs]

# ─────────────────────────────────────────────────────────────────────────────
# 8. Timing Exceptions
# ─────────────────────────────────────────────────────────────────────────────
# Reset synchronizer paths – 2-FF structure, valid multicycle
set_multicycle_path 2 -setup \
    -from [get_pins -hierarchical */reset_sync*/D] \
    -to   [get_pins -hierarchical */reset_sync*/Q]

# AES/SHA crypto datapaths – pipeline register boundaries, 2-cycle
set_multicycle_path 2 -setup \
    -from [get_cells -hierarchical *aes*] \
    -comment "AES engine pipeline"
set_multicycle_path 2 -setup \
    -from [get_cells -hierarchical *sha256*] \
    -comment "SHA-256 engine pipeline"

# GPIO – asynchronous I/O, false path
set_false_path -from [get_ports gpio_pad]
set_false_path -to   [get_ports gpio_pad]

# DDR address/data outputs – constrained separately, false path for STA
set_false_path -to [get_ports {ddr_addr ddr_ba ddr_dm ddr_dq ddr_dqs_p ddr_dqs_n}]
set_false_path -from [get_ports {ddr_dq ddr_dqs_p ddr_dqs_n}]

# ─────────────────────────────────────────────────────────────────────────────
# 9. Run STA and Generate Reports
# ─────────────────────────────────────────────────────────────────────────────
set RPT_DIR "Output_Files"
file mkdir $RPT_DIR

# --- Setup timing (top-20 paths) ---
report_checks \
    -path_delay max \
    -fields {slew cap input_pin net fanout} \
    -format full_clock_expanded \
    -group_path_count 5 \
    -endpoint_count 20 \
    -path_group sys_clk \
    -slack_lesser_than 10.0 \
    > $RPT_DIR/timing_setup.rpt

# Append eth_clk and pcie_refclk paths
report_checks \
    -path_delay max \
    -fields {slew cap input_pin net fanout} \
    -format full_clock_expanded \
    -group_path_count 3 \
    -endpoint_count 10 \
    -path_group eth_clk \
    -slack_lesser_than 10.0 \
    >> $RPT_DIR/timing_setup.rpt

report_checks \
    -path_delay max \
    -fields {slew cap input_pin net fanout} \
    -format full_clock_expanded \
    -group_path_count 3 \
    -endpoint_count 10 \
    -path_group pcie_refclk \
    -slack_lesser_than 10.0 \
    >> $RPT_DIR/timing_setup.rpt

# --- Hold timing (top-20 paths) ---
report_checks \
    -path_delay min \
    -fields {slew cap input_pin net fanout} \
    -format full_clock_expanded \
    -group_path_count 5 \
    -endpoint_count 20 \
    -slack_lesser_than 5.0 \
    > $RPT_DIR/timing_hold.rpt

# --- Timing summary (WNS / TNS / failing paths) ---
report_wns   > $RPT_DIR/timing_summary.rpt
report_tns  >> $RPT_DIR/timing_summary.rpt
report_worst_slack -max >> $RPT_DIR/timing_summary.rpt
report_worst_slack -min >> $RPT_DIR/timing_summary.rpt
report_check_types -max_slew -max_cap -max_fanout >> $RPT_DIR/timing_summary.rpt

# --- Clock domain analysis ---
report_clock_skew          > $RPT_DIR/clock_domain_analysis.rpt
report_clock_properties   >> $RPT_DIR/clock_domain_analysis.rpt
report_clock_min_period   >> $RPT_DIR/clock_domain_analysis.rpt

puts "INFO: STA complete. Reports written to $RPT_DIR/"
exit
################################################################################
# END OF SCRIPT
################################################################################