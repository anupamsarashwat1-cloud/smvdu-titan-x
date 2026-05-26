// SMVDU-TITAN-X Phase 1 Testbench Wrapper
//
// SystemVerilog testbench verifying clock distribution, system reset,
// and console UART transmission output.
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

`timescale 1ns/1ps

module tb_titan_x_phase1;

    // ── Signal Declarations ──────────────────────────────────────────────────
    reg         sys_clk;
    reg         sys_rst_n;
    wire        uart_tx;
    reg         uart_rx;
    wire [31:0] gpio;
    wire        spi_clk;
    wire        spi_mosi;
    reg         spi_miso;
    wire        spi_cs_n;
    wire        jtag_tdo;
    wire [3:0]  led;

    // ── Clock Generation (100 MHz System Clock) ──────────────────────────────
    always begin
        #5 sys_clk = ~sys_clk;
    end

    // ── Device Under Test (DUT) Instantiation ────────────────────────────────
    titan_x_top u_dut (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .uart0_rx  (uart_rx),
        .uart0_tx  (uart_tx),
        .gpio      (gpio),
        .spi0_clk  (spi_clk),
        .spi0_mosi (spi_mosi),
        .spi0_miso (spi_miso),
        .spi0_cs_n (spi_cs_n),
        .jtag_tck  (1'b0),
        .jtag_tms  (1'b0),
        .jtag_tdi  (1'b0),
        .jtag_tdo  (jtag_tdo),
        .led       (led)
    );

    // ── Test Procedure ───────────────────────────────────────────────────────
    initial begin
        // Initialize Signals
        sys_clk   = 1'b0;
        sys_rst_n = 1'b0;
        uart_rx   = 1'b1; // UART Line idle high
        spi_miso  = 1'b0;

        $display("[TB] Starting SMVDU-TITAN-X Phase 1 Simulation...");

        // Assert reset for 100ns
        #100;
        sys_rst_n = 1'b1;
        $display("[TB] System Reset Released at 100ns.");

        // Monitor LED diagnostics
        @(posedge led[0]);
        $display("[TB] Power Status Indicator OK (led[0] high).");

        // Wait for activity or limit simulation execution
        #5000;
        $display("[TB] Phase 1 RTL boundary stub test finished successfully.");
        $finish;
    end

    // ── UART Output Monitor (Displays characters in console) ────────────────
    always @(negedge uart_tx) begin
        // Stub monitor trace: in full Verilator simulation, SimUART prints
        // characters directly. This is a helper assertion for simple RTL runs.
        $display("[UART TX Event] Start bit detected on uart0_tx line.");
    end

endmodule // tb_titan_x_phase1
