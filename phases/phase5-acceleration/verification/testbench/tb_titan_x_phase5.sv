// SMVDU-TITAN-X Phase 5 Testbench Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module tb_titan_x_phase5;
    reg sys_clk;
    reg sys_rst_n;
    wire [3:0] led;

    always begin
        #5 sys_clk = ~sys_clk;
    end

    titan_x_top u_dut (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .hbm_clk   (),
        .hbm_cs_n  (),
        .led       (led)
    );

    initial begin
        sys_clk   = 1'b0;
        sys_rst_n = 1'b0;
        #100;
        sys_rst_n = 1'b1;
        #500;
        $display("[TB Phase 5] AI coprocessor + security module top smoke check complete.");
        $finish;
    end
endmodule
