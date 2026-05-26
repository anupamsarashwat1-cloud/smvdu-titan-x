// SMVDU-TITAN-X Phase 2 Testbench Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module tb_titan_x_phase2;
    reg sys_clk;
    reg sys_rst_n;
    wire [31:0] gpio;
    wire spi_clk;
    wire spi_mosi;
    reg spi_miso;
    wire spi_cs_n;
    wire [3:0] led;

    always begin
        #5 sys_clk = ~sys_clk;
    end

    titan_x_top u_dut (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .uart0_rx  (1'b1),
        .uart0_tx  (),
        .gpio      (gpio),
        .spi0_clk  (spi_clk),
        .spi0_mosi (spi_mosi),
        .spi0_miso (spi_miso),
        .spi0_cs_n (spi_cs_n),
        .led       (led)
    );

    initial begin
        sys_clk   = 1'b0;
        sys_rst_n = 1'b0;
        spi_miso  = 1'b0;
        #100;
        sys_rst_n = 1'b1;
        #500;
        $display("[TB Phase 2] Initial smoke check complete.");
        $finish;
    end
endmodule
