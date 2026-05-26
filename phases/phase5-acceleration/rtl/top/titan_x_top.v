// SMVDU-TITAN-X Phase 5 Top-Level SoC Integration Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module titan_x_top (
    input  wire        sys_clk,
    input  wire        sys_rst_n,

    // HBM2 memory interface stub
    output wire        hbm_clk,
    output wire        hbm_cs_n,

    // Diagnostic LEDs
    output wire [3:0]  led
);

    assign led[0] = sys_rst_n;
    assign led[3:1] = 3'b000;

    assign hbm_clk  = 1'b0;
    assign hbm_cs_n = 1'b1;

endmodule
