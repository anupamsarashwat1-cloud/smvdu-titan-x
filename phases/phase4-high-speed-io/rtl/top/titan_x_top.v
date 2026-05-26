// SMVDU-TITAN-X Phase 4 Top-Level SoC Integration Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module titan_x_top (
    input  wire        sys_clk,
    input  wire        sys_rst_n,

    // PCIe Gen2 Interface
    output wire [3:0]  pcie_tx_p,
    output wire [3:0]  pcie_tx_n,
    input  wire [3:0]  pcie_rx_p,
    input  wire [3:0]  pcie_rx_n,

    // USB 2.0 interface
    inout  wire        usb_dp,
    inout  wire        usb_dn,

    // HDMI Display channels
    output wire        hdmi_clk_p,
    output wire        hdmi_clk_n,
    output wire [2:0]  hdmi_data_p,
    output wire [2:0]  hdmi_data_n,

    // Diagnostic LEDs
    output wire [3:0]  led
);

    assign led[0] = sys_rst_n;
    assign led[3:1] = 3'b000;

    // Tie-off PCIe outputs
    assign pcie_tx_p = 4'b0000;
    assign pcie_tx_n = 4'b1111;

    // Tie-off HDMI outputs
    assign hdmi_clk_p  = 1'b0;
    assign hdmi_clk_n  = 1'b1;
    assign hdmi_data_p = 3'b000;
    assign hdmi_data_n = 3'b111;

endmodule
//
