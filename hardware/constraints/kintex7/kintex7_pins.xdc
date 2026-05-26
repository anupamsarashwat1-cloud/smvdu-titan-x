## SMVDU-TITAN-X Kintex-7 Pin Constraints
## Target: Xilinx Kintex-7 (Genesys 2 — xc7k325t)
## Generic template — adapt pin assignments to your specific board
##
## SPDX-License-Identifier: Apache-2.0

# ─── Clock ───────────────────────────────────────────────────────────────────
# Genesys 2: 200 MHz differential system clock on AD12/AD11
create_clock -period 5.000 -name sys_clk_p [get_ports sys_clk_p]
set_property PACKAGE_PIN AD12 [get_ports sys_clk_p]
set_property PACKAGE_PIN AD11 [get_ports sys_clk_n]
set_property IOSTANDARD LVDS [get_ports {sys_clk_p sys_clk_n}]

# ─── Reset ───────────────────────────────────────────────────────────────────
# Genesys 2: CPU_RESET button on R19
set_property PACKAGE_PIN R19 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

# ─── UART ────────────────────────────────────────────────────────────────────
# Genesys 2: UART TX = AA19, RX = V18 (via USB-UART)
set_property PACKAGE_PIN AA19 [get_ports uart0_tx]
set_property PACKAGE_PIN V18  [get_ports uart0_rx]
set_property IOSTANDARD LVCMOS33 [get_ports {uart0_tx uart0_rx}]

# ─── LEDs ────────────────────────────────────────────────────────────────────
# Genesys 2: LED0-LED7 on T28, V19, U30, U29, V20, V26, W24, W23
set_property PACKAGE_PIN T28 [get_ports {led[0]}]
set_property PACKAGE_PIN V19 [get_ports {led[1]}]
set_property PACKAGE_PIN U30 [get_ports {led[2]}]
set_property PACKAGE_PIN U29 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports led]

# ─── Bitstream Settings ──────────────────────────────────────────────────────
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
