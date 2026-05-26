// SMVDU-TITAN-X Phase 4 Testbench Stub
//
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps

module tb_titan_x_phase4;
    reg sys_clk;
    reg sys_rst_n;
    wire [3:0] led;

    always begin
        #5 sys_clk = ~sys_clk;
    end

    titan_x_top u_dut (
        .sys_clk     (sys_clk),
        .sys_rst_n   (sys_rst_n),
        .pcie_tx_p   (),
        .pcie_tx_n   (),
        .pcie_rx_p   (4'b0),
        .pcie_rx_n   (4'b0),
        .usb_dp      (),
        .usb_dn      (),
        .hdmi_clk_p  (),
        .hdmi_clk_n  (),
        .hdmi_data_p (),
        .hdmi_data_n (),
        .led         (led)
    );

    initial begin
        sys_clk   = 1'b0;
        sys_rst_n = 1'b0;
        #100;
        sys_rst_n = 1'b1;
        #500;
        $display("[TB Phase 4] High-speed I/O (PCIe/HDMI) top smoke check complete.");
        $finish;
    end
endmodule
