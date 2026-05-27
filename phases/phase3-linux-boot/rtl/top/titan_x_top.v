// SMVDU-TITAN-X Phase 3 Top-Level SoC Integration Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module titan_x_top (
    input  wire        sys_clk,
    input  wire        sys_rst_n,

    // DDR Memory Interface
    output wire        ddr_clk_p,
    output wire        ddr_clk_n,
    output wire        ddr_cke,
    output wire        ddr_cs_n,
    output wire        ddr_ras_n,
    output wire        ddr_cas_n,
    output wire        ddr_we_n,
    output wire [2:0]  ddr_ba,
    output wire [14:0] ddr_addr,

    // UART Console
    input  wire        uart0_rx,
    output wire        uart0_tx,

    // SPI (Active for SD Card Reader in Phase 3)
    output wire        spi0_clk,
    output wire        spi0_mosi,
    input  wire        spi0_miso,
    output wire        spi0_cs_n,

    // Gigabit Ethernet MAC Pins
    input  wire        eth_rx_clk,
    input  wire [3:0]  eth_rx_data,
    input  wire        eth_rx_dv,
    output wire        eth_tx_clk,
    output wire [3:0]  eth_tx_data,
    output wire        eth_tx_en,

    // Diagnostic LEDs
    output wire [3:0]  led
);

    // Diagnostics & Heartbeat logic
    reg [25:0] heartbeat_cnt;
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            heartbeat_cnt <= 26'b0;
        end else begin
            heartbeat_cnt <= heartbeat_cnt + 1'b1;
        end
    end

    assign led[0] = sys_rst_n;
    assign led[1] = heartbeat_cnt[25];
    assign led[3:2] = 2'b00;


    // DDR stub drive
    assign ddr_clk_p  = 1'b0;
    assign ddr_clk_n  = 1'b1;
    assign ddr_cke    = 1'b0;
    assign ddr_cs_n   = 1'b1;
    assign ddr_ras_n  = 1'b1;
    assign ddr_cas_n  = 1'b1;
    assign ddr_we_n   = 1'b1;
    assign ddr_ba     = 3'b0;
    assign ddr_addr   = 15'b0;

    // Ethernet MAC stub drive
    assign eth_tx_clk  = 1'b0;
    assign eth_tx_data = 4'b0;
    assign eth_tx_en   = 1'b0;

    // SPI stub drive
    assign spi0_clk  = 1'b0;
    assign spi0_mosi = 1'b0;
    assign spi0_cs_n = 1'b1;

    // UART stub drive
    assign uart0_tx  = 1'b1;

endmodule
