## SMVDU-TITAN-X Artix-7 Pin Constraints
## Target: Xilinx Artix-7 (xc7a35t / xc7a100t)
## Generic template — adapt pin assignments to your specific board
##
## Reference: Chipyard FPGA Prototype Flow
## SPDX-License-Identifier: Apache-2.0

# ─── Clock ───────────────────────────────────────────────────────────────────
# Arty A7-35T: 100 MHz system clock on E3
create_clock -period 10.000 -name sys_clk [get_ports sys_clk]
set_property PACKAGE_PIN E3  [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

# ─── Reset ───────────────────────────────────────────────────────────────────
# Arty A7: Active-high reset button on C2
set_property PACKAGE_PIN C2  [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

# ─── UART (USB-UART bridge) ───────────────────────────────────────────────────
# Arty A7: UART TX = D10, RX = A9 (via FT2232HQ)
set_property PACKAGE_PIN D10 [get_ports uart0_tx]
set_property PACKAGE_PIN A9  [get_ports uart0_rx]
set_property IOSTANDARD LVCMOS33 [get_ports {uart0_tx uart0_rx}]

# ─── LEDs ────────────────────────────────────────────────────────────────────
# Arty A7: LD0-LD3 on H5, J5, T9, T10
set_property PACKAGE_PIN H5  [get_ports {led[0]}]
set_property PACKAGE_PIN J5  [get_ports {led[1]}]
set_property PACKAGE_PIN T9  [get_ports {led[2]}]
set_property PACKAGE_PIN T10 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports led]

# ─── GPIO (PMOD JA) ──────────────────────────────────────────────────────────
# Using PMOD JA for 8 bits of GPIO
# Arty A7 PMOD JA: G13, B11, A11, D12, D13, B18, A18, K16
set_property PACKAGE_PIN G13 [get_ports {gpio[0]}]
set_property PACKAGE_PIN B11 [get_ports {gpio[1]}]
set_property PACKAGE_PIN A11 [get_ports {gpio[2]}]
set_property PACKAGE_PIN D12 [get_ports {gpio[3]}]
set_property PACKAGE_PIN D13 [get_ports {gpio[4]}]
set_property PACKAGE_PIN B18 [get_ports {gpio[5]}]
set_property PACKAGE_PIN A18 [get_ports {gpio[6]}]
set_property PACKAGE_PIN K16 [get_ports {gpio[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpio[*]}]

# ─── SPI 0 (PMOD JB) ─────────────────────────────────────────────────────────
# Arty A7 PMOD JB: E15, E16, D15, C15
set_property PACKAGE_PIN E15 [get_ports spi0_clk]
set_property PACKAGE_PIN E16 [get_ports spi0_mosi]
set_property PACKAGE_PIN D15 [get_ports spi0_miso]
set_property PACKAGE_PIN C15 [get_ports spi0_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports {spi0_clk spi0_mosi spi0_miso spi0_cs_n}]

# ─── JTAG ────────────────────────────────────────────────────────────────────
# JTAG via PMOD JD or dedicated JTAG pins
# set_property PACKAGE_PIN D4  [get_ports jtag_tck]
# set_property PACKAGE_PIN D3  [get_ports jtag_tms]
# set_property PACKAGE_PIN F4  [get_ports jtag_tdi]
# set_property PACKAGE_PIN F3  [get_ports jtag_tdo]
# set_property IOSTANDARD LVCMOS33 [get_ports {jtag_tck jtag_tms jtag_tdi jtag_tdo}]

# ─── Timing Constraints ───────────────────────────────────────────────────────
# Input/Output delay constraints relative to sys_clk
set_input_delay  -clock sys_clk -max 2.0 [get_ports uart0_rx]
set_output_delay -clock sys_clk -max 2.0 [get_ports uart0_tx]

# ─── Bitstream Settings ──────────────────────────────────────────────────────
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
