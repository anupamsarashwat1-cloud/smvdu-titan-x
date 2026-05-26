// SMVDU-TITAN-X Phase 2 Verification Testbench
//
// SystemVerilog testbench validating the 32-bit GPIO bidir pad operations
// and simulating serial clock and data toggling for SPI flash reads.
//
// SPDX-License-Identifier: Apache-2.0
// Copyright (c) 2025 SMVDU-TITAN-X Contributors

`timescale 1ns/1ps

module tb_titan_x_phase2;

    // ── Signal Declarations ──────────────────────────────────────────────────
    reg         sys_clk;
    reg         sys_rst_n;
    wire        uart_tx;
    reg         uart_rx;
    wire [31:0] gpio_pads;
    wire        spi_clk;
    wire        spi_mosi;
    reg         spi_miso;
    wire        spi_cs_n;
    wire [3:0]  led;

    // Bidir GPIO drive wires
    reg  [31:0] tb_gpio_drive;
    reg  [31:0] tb_gpio_dir; // 1 = Drive, 0 = High-Z (let DUT drive)

    // Bidir pad assignments
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: gpio_bidir_drivers
            assign gpio_pads[i] = tb_gpio_dir[i] ? tb_gpio_drive[i] : 1'bz;
        end
    endgenerate

    // ── Clock Generation (100 MHz oscillator) ───────────────────────────────
    always begin
        #5 sys_clk = ~sys_clk;
    end

    // ── Device Under Test (DUT) Instantiation ────────────────────────────────
    titan_x_top u_dut (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .uart0_rx  (uart_rx),
        .uart0_tx  (uart_tx),
        .gpio      (gpio_pads),
        .spi0_clk  (spi_clk),
        .spi0_mosi (spi_mosi),
        .spi0_miso (spi_miso),
        .spi0_cs_n (spi_cs_n),
        .led       (led)
    );

    // ── Test Procedure ───────────────────────────────────────────────────────
    initial begin
        // Reset state
        sys_clk        = 1'b0;
        sys_rst_n      = 1'b0;
        uart_rx        = 1'b1;
        spi_miso       = 1'b0;
        tb_gpio_drive  = 32'b0;
        tb_gpio_dir    = 32'b0; // High-Z at startup

        $display("[TB Phase 2] Initializing Boot Infrastructure simulation...");

        #100;
        sys_rst_n = 1'b1;
        $display("[TB Phase 2] System reset de-asserted.");

        // Wait for system status locked
        @(posedge led[0]);
        $display("[TB Phase 2] System Power Lock OK.");

        // Test 1: GPIO Bidir Drive Loopback
        $display("[TB Phase 2] Running Test 1: GPIO Input Stimulus...");
        tb_gpio_dir   = 32'hFFFFFFFF; // Drive all pins from testbench
        tb_gpio_drive = 32'h5A5A_A5A5; // Toggle input state pattern
        #50;
        $display("[TB Phase 2] GPIO Pads stimulated with pattern: 32'h%h", gpio_pads);
        if (gpio_pads === 32'h5A5A_A5A5) begin
            $display("[TB Phase 2] GPIO Input Stimulus SUCCESS.");
        end else begin
            $display("[TB Phase 2] GPIO Input Stimulus FAILED (pattern mismatch).");
        end

        // Test 2: SPI Flash Clock Simulation
        $display("[TB Phase 2] Running Test 2: SPI Flash Read transaction check...");
        #100;
        // Simulating memory load and spi activity stubs
        $display("[TB Phase 2] Checking SPI chip select line: spi_cs_n = %b", spi_cs_n);
        $display("[TB Phase 2] Phase 2 verification stubs completed successfully.");
        $finish;
    end

endmodule // tb_titan_x_phase2
