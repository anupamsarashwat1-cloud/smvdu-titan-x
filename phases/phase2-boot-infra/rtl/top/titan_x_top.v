// SMVDU-TITAN-X Phase 2 Top-Level SoC Integration Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module titan_x_top (
    input  wire        sys_clk,
    input  wire        sys_rst_n,

    // UART Console
    input  wire        uart0_rx,
    output wire        uart0_tx,

    // GPIO Pad Array (Active in Phase 2)
    inout  wire [31:0] gpio,

    // SPI Flash Interface (Active in Phase 2)
    output wire        spi0_clk,
    output wire        spi0_mosi,
    input  wire        spi0_miso,
    output wire        spi0_cs_n,

    // Diagnostic LEDs
    output wire [3:0]  led
);

    // Instantiate Phase 2 internal components
    wire [31:0] gpio_irq;

    titan_x_gpio u_gpio (
        .clk       (sys_clk),
        .rst_n     (sys_rst_n),
        .psel      (1'b0), // Stub: Tied-off register bus
        .penable   (1'b0),
        .pwrite    (1'b0),
        .paddr     (8'b0),
        .pwdata    (32'b0),
        .prdata    (),
        .pready    (),
        .gpio_pads (gpio),
        .gpio_irq  (gpio_irq)
    );

    // Diagnostics
    assign led[0] = sys_rst_n;
    assign led[3:1] = 3'b000;

    // Tie-off unused SPI outputs
    assign spi0_clk  = 1'b0;
    assign spi0_mosi = 1'b0;
    assign spi0_cs_n = 1'b1;
    assign uart0_tx  = 1'b1;

endmodule
