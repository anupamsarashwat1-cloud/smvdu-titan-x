// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — Top-Level Testbench
// Compatible with Icarus Verilog + GTKWave
`timescale 1ns/1ps
module tb_titan_x_top;
    // ── Clock and Reset ──────────────────────────────────────────────────────
    reg        sys_clk;
    reg        eth_clk;
    reg        sys_rst_n;

    initial sys_clk = 1'b0;
    always #2.5 sys_clk = ~sys_clk;    // 200 MHz

    initial eth_clk = 1'b0;
    always #4.0 eth_clk = ~eth_clk;    // 125 MHz

    // ── DDR4 pins (dummy) ────────────────────────────────────────────────────
    wire        ddr_ck_p, ddr_ck_n, ddr_cke, ddr_cs_n;
    wire        ddr_ras_n, ddr_cas_n, ddr_we_n;
    wire [2:0]  ddr_ba;
    wire [15:0] ddr_addr;
    wire [7:0]  ddr_dm;
    wire [63:0] ddr_dq;
    wire [7:0]  ddr_dqs_p, ddr_dqs_n;

    // Pulldown tri-state DDR signals in TB
    assign ddr_dq    = 64'bz;
    assign ddr_dqs_p = 8'bz;
    assign ddr_dqs_n = 8'bz;

    // ── PCIe (tie off) ───────────────────────────────────────────────────────
    wire [3:0] pcie_txp, pcie_txn;
    reg  [3:0] pcie_rxp = 4'b1111, pcie_rxn = 4'b0000;
    reg        pcie_refclk_p = 1'b0, pcie_refclk_n = 1'b1;
    always #5 {pcie_refclk_p, pcie_refclk_n} = ~{pcie_refclk_p, pcie_refclk_n};
    wire pcie_perst_n;

    // ── GEM pins (tie off) ───────────────────────────────────────────────────
    wire gem0_rgmii_txc, gem0_rgmii_tx_ctl;
    wire [3:0] gem0_rgmii_txd;
    reg  gem0_rgmii_rxc = 0; always #4 gem0_rgmii_rxc = ~gem0_rgmii_rxc;
    reg  gem0_rgmii_rx_ctl = 0;
    reg  [3:0] gem0_rgmii_rxd = 4'h0;

    wire gem1_rgmii_txc, gem1_rgmii_tx_ctl;
    wire [3:0] gem1_rgmii_txd;
    reg  gem1_rgmii_rxc = 0; always #4 gem1_rgmii_rxc = ~gem1_rgmii_rxc;
    reg  gem1_rgmii_rx_ctl = 0;
    reg  [3:0] gem1_rgmii_rxd = 4'h0;

    // ── UART loopback ────────────────────────────────────────────────────────
    wire uart0_txd, uart1_txd;
    wire uart0_rxd = uart0_txd;  // loopback
    wire uart1_rxd = uart1_txd;

    // ── GPIO (pull all inputs to 0) ──────────────────────────────────────────
    wire [31:0] gpio_pad;
    assign gpio_pad = 32'bz;

    // ── SPI (MISO tie-off) ───────────────────────────────────────────────────
    wire spi_clk, spi_mosi;
    wire [3:0] spi_csn;
    reg  spi_miso = 1'b0;

    // ── I2C (open drain pull-up) ─────────────────────────────────────────────
    wire i2c_scl, i2c_sda;
    assign i2c_scl = 1'bz;
    assign i2c_sda = 1'bz;

    // ── Outputs ──────────────────────────────────────────────────────────────
    wire [4:0] harts_active;
    wire       link_up_pcie;

    // ── DUT ──────────────────────────────────────────────────────────────────
    titan_x_top dut (
        .sys_clk        (sys_clk),
        .eth_clk        (eth_clk),
        .pcie_refclk_p  (pcie_refclk_p),
        .pcie_refclk_n  (pcie_refclk_n),
        .sys_rst_n      (sys_rst_n),
        .ddr_ck_p       (ddr_ck_p),  .ddr_ck_n    (ddr_ck_n),
        .ddr_cke        (ddr_cke),   .ddr_cs_n    (ddr_cs_n),
        .ddr_ras_n      (ddr_ras_n), .ddr_cas_n   (ddr_cas_n), .ddr_we_n(ddr_we_n),
        .ddr_ba         (ddr_ba),    .ddr_addr    (ddr_addr),  .ddr_dm  (ddr_dm),
        .ddr_dq         (ddr_dq),    .ddr_dqs_p   (ddr_dqs_p), .ddr_dqs_n(ddr_dqs_n),
        .pcie_txp       (pcie_txp),  .pcie_txn    (pcie_txn),
        .pcie_rxp       (pcie_rxp),  .pcie_rxn    (pcie_rxn),
        .pcie_perst_n   (pcie_perst_n),
        .gem0_rgmii_txc (gem0_rgmii_txc), .gem0_rgmii_tx_ctl(gem0_rgmii_tx_ctl),
        .gem0_rgmii_txd (gem0_rgmii_txd), .gem0_rgmii_rxc   (gem0_rgmii_rxc),
        .gem0_rgmii_rx_ctl(gem0_rgmii_rx_ctl), .gem0_rgmii_rxd(gem0_rgmii_rxd),
        .gem1_rgmii_txc (gem1_rgmii_txc), .gem1_rgmii_tx_ctl(gem1_rgmii_tx_ctl),
        .gem1_rgmii_txd (gem1_rgmii_txd), .gem1_rgmii_rxc   (gem1_rgmii_rxc),
        .gem1_rgmii_rx_ctl(gem1_rgmii_rx_ctl), .gem1_rgmii_rxd(gem1_rgmii_rxd),
        .uart0_txd      (uart0_txd), .uart0_rxd  (uart0_rxd),
        .uart1_txd      (uart1_txd), .uart1_rxd  (uart1_rxd),
        .gpio_pad       (gpio_pad),
        .spi_clk        (spi_clk),   .spi_mosi   (spi_mosi),
        .spi_miso       (spi_miso),  .spi_csn    (spi_csn),
        .i2c_scl        (i2c_scl),   .i2c_sda    (i2c_sda),
        .harts_active   (harts_active),
        .link_up_pcie   (link_up_pcie)
    );

    // ── VCD / Wave dump ──────────────────────────────────────────────────────
`ifdef DUMP_WAVES
    initial begin
        $dumpfile("titan_x_waves.vcd");
        $dumpvars(0, tb_titan_x_top);
    end
`endif

    // ── Test Sequence ────────────────────────────────────────────────────────
    integer cycle_cnt = 0;
    always @(posedge sys_clk) cycle_cnt <= cycle_cnt + 1;

    initial begin
        $display("===========================================");
        $display(" SMVDU-TITAN-X SoC Simulation Start");
        $display("===========================================");

        // Assert reset for 20 cycles
        sys_rst_n = 1'b0;
        repeat(20) @(posedge sys_clk);
        sys_rst_n = 1'b1;
        $display("[%0t] Reset deasserted. SoC booting...", $time);

        // Wait for harts to become active (poll)
        begin : wait_harts
            integer w;
            for (w = 0; w < 200; w = w+1) begin
                @(posedge sys_clk);
                if (harts_active != 5'h0) disable wait_harts;
            end
        end
        $display("[%0t] HART(s) active: 0b%b", $time, harts_active);

        // Let it run for 10,000 cycles
        repeat(10000) @(posedge sys_clk);

        // Check: all 5 harts should be active
        if (harts_active == 5'b11111)
            $display("[PASS] All 5 harts active after reset.");
        else
            $display("[WARN] harts_active = %b (expected 5'b11111)", harts_active);

        // Check DDR clock output
        if (ddr_ck_p !== ddr_ck_n)
            $display("[PASS] DDR differential clock running.");
        else
            $display("[WARN] DDR differential clock not oscillating.");

        $display("[%0t] Simulation completed (%0d cycles).", $time, cycle_cnt);
        $display("===========================================");
        $finish;
    end

    // Timeout watchdog
    initial begin
        #5_000_000; // 5ms @ 1ns resolution
        $display("[TIMEOUT] Simulation exceeded 5ms — possible hang.");
        $finish;
    end
endmodule
