// SMVDU-TITAN-X Phase 3 Testbench Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module tb_titan_x_phase3;
    reg sys_clk;
    reg sys_rst_n;
    wire [3:0] led;

    always begin
        #5 sys_clk = ~sys_clk;
    end

    titan_x_top u_dut (
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .ddr_clk_p  (),
        .ddr_clk_n  (),
        .ddr_cke    (),
        .ddr_cs_n   (),
        .ddr_ras_n  (),
        .ddr_cas_n  (),
        .ddr_we_n   (),
        .ddr_ba     (),
        .ddr_addr   (),
        .uart0_rx   (1'b1),
        .uart0_tx   (),
        .spi0_clk   (),
        .spi0_mosi  (),
        .spi0_miso  (1'b0),
        .spi0_cs_n  (),
        .eth_rx_clk (1'b0),
        .eth_rx_data(4'b0),
        .eth_rx_dv  (1'b0),
        .eth_tx_clk (),
        .eth_tx_data(),
        .eth_tx_en  (),
        .led        (led)
    );

    initial begin
        sys_clk   = 1'b0;
        sys_rst_n = 1'b0;
        #100;
        sys_rst_n = 1'b1;
        #500;
        $display("[TB Phase 3] Coherent multiprocessor top smoke check complete.");
        $finish;
    end
endmodule
