// SPDX-License-Identifier: Apache-2.0
// =============================================================================
// SMVDU-TITAN-X SoC — Structural Top Level
// Target: OSU018 180nm CMOS
// Revision: 2.0 (Hierarchical RTL — PD team handoff)
//
// Hierarchy:
//   titan_x_top
//     ├── u_reset_sync          [common/reset_sync.v]
//     ├── u_cpu_complex         [cpu_complex/cpu_complex_top.v]
//     │     ├── u_hart0..4      [rv_core_top.v × 5]
//     │     ├── u_plic          [plic.v]
//     │     └── u_clint         [clint.v]
//     ├── u_l2_cache            [memory_subsystem/l2_cache_top.v]
//     │     ├── u_ctrl          [l2_cache_ctrl.v]
//     │     ├── u_tags          [l2_tag_array.v]
//     │     └── u_data          [l2_data_array.v]
//     │           ├── u_sram_bank0 [sram_32x64_180nm] ← LVS FIX
//     │           └── u_sram_bank1 [sram_32x64_180nm] ← LVS FIX
//     ├── u_ddr                 [memory_subsystem/ddr_ctrl/ddr_ctrl_top.v]
//     ├── u_xbar                [interconnect/axi4_crossbar.v]
//     ├── u_pcie                [pcie/pcie_top.v]
//     ├── u_gem0                [ethernet/gem_ethernet.v]
//     ├── u_gem1                [ethernet/gem_ethernet.v]
//     ├── u_uart0               [peripherals/uart_16550.v]
//     ├── u_uart1               [peripherals/uart_16550.v]
//     ├── u_gpio                [peripherals/gpio_ctrl.v]
//     ├── u_spi                 [peripherals/spi_master.v]
//     ├── u_i2c                 [peripherals/i2c_master.v]
//     ├── u_wdt                 [peripherals/watchdog_timer.v]
//     ├── u_aes                 [security/aes_engine.v]
//     ├── u_sha256              [security/sha256_engine.v]
//     └── u_trng                [security/trng.v]
// =============================================================================
`timescale 1ns/1ps
module titan_x_top (
    // ── Clocks ────────────────────────────────────────────────────────────────
    input  wire        sys_clk,        // 200 MHz system clock
    input  wire        eth_clk,        // 125 MHz Ethernet reference
    input  wire        pcie_refclk_p,  // PCIe 100 MHz reference (differential)
    input  wire        pcie_refclk_n,

    // ── Reset ─────────────────────────────────────────────────────────────────
    input  wire        sys_rst_n,      // Active-low asynchronous system reset

    // ── DDR4 Physical Interface ───────────────────────────────────────────────
    output wire        ddr_ck_p,       output wire ddr_ck_n,
    output wire        ddr_cke,        output wire ddr_cs_n,
    output wire        ddr_ras_n,      output wire ddr_cas_n,
    output wire        ddr_we_n,
    output wire [2:0]  ddr_ba,
    output wire [15:0] ddr_addr,
    output wire [7:0]  ddr_dm,
    inout  wire [63:0] ddr_dq,
    inout  wire [7:0]  ddr_dqs_p,
    inout  wire [7:0]  ddr_dqs_n,

    // ── PCIe x4 Lanes ─────────────────────────────────────────────────────────
    output wire [3:0]  pcie_txp,       output wire [3:0] pcie_txn,
    input  wire [3:0]  pcie_rxp,       input  wire [3:0] pcie_rxn,
    output wire        pcie_perst_n,

    // ── GEM0 RGMII ───────────────────────────────────────────────────────────
    output wire        gem0_rgmii_txc,
    output wire        gem0_rgmii_tx_ctl,
    output wire [3:0]  gem0_rgmii_txd,
    input  wire        gem0_rgmii_rxc,
    input  wire        gem0_rgmii_rx_ctl,
    input  wire [3:0]  gem0_rgmii_rxd,

    // ── GEM1 RGMII ───────────────────────────────────────────────────────────
    output wire        gem1_rgmii_txc,
    output wire        gem1_rgmii_tx_ctl,
    output wire [3:0]  gem1_rgmii_txd,
    input  wire        gem1_rgmii_rxc,
    input  wire        gem1_rgmii_rx_ctl,
    input  wire [3:0]  gem1_rgmii_rxd,

    // ── UART ─────────────────────────────────────────────────────────────────
    output wire        uart0_txd,      input  wire       uart0_rxd,
    output wire        uart1_txd,      input  wire       uart1_rxd,

    // ── GPIO ─────────────────────────────────────────────────────────────────
    inout  wire [31:0] gpio_pad,

    // ── SPI ──────────────────────────────────────────────────────────────────
    output wire        spi_clk,
    output wire        spi_mosi,
    input  wire        spi_miso,
    output wire [3:0]  spi_csn,

    // ── I2C ──────────────────────────────────────────────────────────────────
    inout  wire        i2c_scl,
    inout  wire        i2c_sda,

    // ── Debug / Status ────────────────────────────────────────────────────────
    output wire [4:0]  harts_active,
    output wire        link_up_pcie
);
    // =========================================================================
    // CLOCK & RESET
    // =========================================================================
    wire sync_rst_n;
    reset_sync u_reset_sync (
        .clk       (sys_clk),
        .async_rst_n(sys_rst_n),
        .sync_rst_n (sync_rst_n)
    );

    // =========================================================================
    // INTERRUPT AGGREGATION
    // =========================================================================
    wire uart0_irq, uart1_irq, gpio_irq, spi_irq, i2c_irq;
    wire wdt_irq;
    wire aes_irq, sha_irq, trng_irq;
    wire pcie_irq, gem0_irq, gem1_irq;
    wire [185:0] irq_sources;
    assign irq_sources = {
        167'h0,           // [185:19] reserved
        pcie_irq,         // [18]
        gem1_irq,         // [17]
        gem0_irq,         // [16]
        trng_irq,         // [15]
        sha_irq,          // [14]
        aes_irq,          // [13]
        wdt_irq,          // [12]
        i2c_irq,          // [11]
        spi_irq,          // [10]
        gpio_irq,         // [9]
        uart1_irq,        // [8]
        uart0_irq,        // [7]
        7'h0              // [6:0] reserved
    };

    // =========================================================================
    // CPU COMPLEX (5 × RV64I + PLIC + CLINT)
    // =========================================================================
    // AXI4-Lite buses from each hart (imem + dmem = 10 buses total)
    // Wires for crossbar masters (each hart's dmem port feeds the crossbar)
    wire [39:0] cpu0_imem_araddr;  wire cpu0_imem_arvalid; wire cpu0_imem_arready;
    wire [63:0] cpu0_imem_rdata;   wire cpu0_imem_rvalid;  wire [1:0] cpu0_imem_rresp;
    wire cpu0_dmem_awvalid; wire cpu0_dmem_awready; wire [39:0] cpu0_dmem_awaddr;
    wire cpu0_dmem_wvalid;  wire cpu0_dmem_wready;  wire [63:0] cpu0_dmem_wdata;
    wire [7:0] cpu0_dmem_wstrb; wire cpu0_dmem_bvalid; wire cpu0_dmem_bready;
    wire cpu0_dmem_arvalid; wire cpu0_dmem_arready; wire [39:0] cpu0_dmem_araddr;
    wire cpu0_dmem_rvalid;  wire cpu0_dmem_rready;  wire [63:0] cpu0_dmem_rdata;
    wire [1:0] cpu0_dmem_rresp;

    wire [39:0] cpu1_imem_araddr;  wire cpu1_imem_arvalid; wire cpu1_imem_arready;
    wire [63:0] cpu1_imem_rdata;   wire cpu1_imem_rvalid;  wire [1:0] cpu1_imem_rresp;
    wire cpu1_dmem_awvalid; wire cpu1_dmem_awready; wire [39:0] cpu1_dmem_awaddr;
    wire cpu1_dmem_wvalid;  wire cpu1_dmem_wready;  wire [63:0] cpu1_dmem_wdata;
    wire [7:0] cpu1_dmem_wstrb; wire cpu1_dmem_bvalid; wire cpu1_dmem_bready;
    wire cpu1_dmem_arvalid; wire cpu1_dmem_arready; wire [39:0] cpu1_dmem_araddr;
    wire cpu1_dmem_rvalid;  wire cpu1_dmem_rready;  wire [63:0] cpu1_dmem_rdata;
    wire [1:0] cpu1_dmem_rresp;

    wire [39:0] cpu2_imem_araddr;  wire cpu2_imem_arvalid; wire cpu2_imem_arready;
    wire [63:0] cpu2_imem_rdata;   wire cpu2_imem_rvalid;  wire [1:0] cpu2_imem_rresp;
    wire cpu2_dmem_awvalid; wire cpu2_dmem_awready; wire [39:0] cpu2_dmem_awaddr;
    wire cpu2_dmem_wvalid;  wire cpu2_dmem_wready;  wire [63:0] cpu2_dmem_wdata;
    wire [7:0] cpu2_dmem_wstrb; wire cpu2_dmem_bvalid; wire cpu2_dmem_bready;
    wire cpu2_dmem_arvalid; wire cpu2_dmem_arready; wire [39:0] cpu2_dmem_araddr;
    wire cpu2_dmem_rvalid;  wire cpu2_dmem_rready;  wire [63:0] cpu2_dmem_rdata;
    wire [1:0] cpu2_dmem_rresp;

    wire [39:0] cpu3_imem_araddr;  wire cpu3_imem_arvalid; wire cpu3_imem_arready;
    wire [63:0] cpu3_imem_rdata;   wire cpu3_imem_rvalid;  wire [1:0] cpu3_imem_rresp;
    wire cpu3_dmem_awvalid; wire cpu3_dmem_awready; wire [39:0] cpu3_dmem_awaddr;
    wire cpu3_dmem_wvalid;  wire cpu3_dmem_wready;  wire [63:0] cpu3_dmem_wdata;
    wire [7:0] cpu3_dmem_wstrb; wire cpu3_dmem_bvalid; wire cpu3_dmem_bready;
    wire cpu3_dmem_arvalid; wire cpu3_dmem_arready; wire [39:0] cpu3_dmem_araddr;
    wire cpu3_dmem_rvalid;  wire cpu3_dmem_rready;  wire [63:0] cpu3_dmem_rdata;
    wire [1:0] cpu3_dmem_rresp;

    wire [39:0] cpu4_imem_araddr;  wire cpu4_imem_arvalid; wire cpu4_imem_arready;
    wire [63:0] cpu4_imem_rdata;   wire cpu4_imem_rvalid;  wire [1:0] cpu4_imem_rresp;
    wire cpu4_dmem_awvalid; wire cpu4_dmem_awready; wire [39:0] cpu4_dmem_awaddr;
    wire cpu4_dmem_wvalid;  wire cpu4_dmem_wready;  wire [63:0] cpu4_dmem_wdata;
    wire [7:0] cpu4_dmem_wstrb; wire cpu4_dmem_bvalid; wire cpu4_dmem_bready;
    wire cpu4_dmem_arvalid; wire cpu4_dmem_arready; wire [39:0] cpu4_dmem_araddr;
    wire cpu4_dmem_rvalid;  wire cpu4_dmem_rready;  wire [63:0] cpu4_dmem_rdata;
    wire [1:0] cpu4_dmem_rresp;

    cpu_complex_top u_cpu_complex (
        .clk       (sys_clk),    .rst_n     (sync_rst_n),
        .irq_sources(irq_sources),
        // Hart 0
        .cpu0_imem_araddr (cpu0_imem_araddr), .cpu0_imem_arvalid(cpu0_imem_arvalid),
        .cpu0_imem_arready(cpu0_imem_arready), .cpu0_imem_rdata  (cpu0_imem_rdata),
        .cpu0_imem_rvalid (cpu0_imem_rvalid),  .cpu0_imem_rresp  (cpu0_imem_rresp),
        .cpu0_dmem_awvalid(cpu0_dmem_awvalid), .cpu0_dmem_awready(cpu0_dmem_awready),
        .cpu0_dmem_awaddr (cpu0_dmem_awaddr),  .cpu0_dmem_wvalid (cpu0_dmem_wvalid),
        .cpu0_dmem_wready (cpu0_dmem_wready),  .cpu0_dmem_wdata  (cpu0_dmem_wdata),
        .cpu0_dmem_wstrb  (cpu0_dmem_wstrb),   .cpu0_dmem_bvalid (cpu0_dmem_bvalid),
        .cpu0_dmem_bready (cpu0_dmem_bready),  .cpu0_dmem_arvalid(cpu0_dmem_arvalid),
        .cpu0_dmem_arready(cpu0_dmem_arready), .cpu0_dmem_araddr (cpu0_dmem_araddr),
        .cpu0_dmem_rvalid (cpu0_dmem_rvalid),  .cpu0_dmem_rready (cpu0_dmem_rready),
        .cpu0_dmem_rdata  (cpu0_dmem_rdata),   .cpu0_dmem_rresp  (cpu0_dmem_rresp),
        // Hart 1
        .cpu1_imem_araddr (cpu1_imem_araddr), .cpu1_imem_arvalid(cpu1_imem_arvalid),
        .cpu1_imem_arready(cpu1_imem_arready), .cpu1_imem_rdata  (cpu1_imem_rdata),
        .cpu1_imem_rvalid (cpu1_imem_rvalid),  .cpu1_imem_rresp  (cpu1_imem_rresp),
        .cpu1_dmem_awvalid(cpu1_dmem_awvalid), .cpu1_dmem_awready(cpu1_dmem_awready),
        .cpu1_dmem_awaddr (cpu1_dmem_awaddr),  .cpu1_dmem_wvalid (cpu1_dmem_wvalid),
        .cpu1_dmem_wready (cpu1_dmem_wready),  .cpu1_dmem_wdata  (cpu1_dmem_wdata),
        .cpu1_dmem_wstrb  (cpu1_dmem_wstrb),   .cpu1_dmem_bvalid (cpu1_dmem_bvalid),
        .cpu1_dmem_bready (cpu1_dmem_bready),  .cpu1_dmem_arvalid(cpu1_dmem_arvalid),
        .cpu1_dmem_arready(cpu1_dmem_arready), .cpu1_dmem_araddr (cpu1_dmem_araddr),
        .cpu1_dmem_rvalid (cpu1_dmem_rvalid),  .cpu1_dmem_rready (cpu1_dmem_rready),
        .cpu1_dmem_rdata  (cpu1_dmem_rdata),   .cpu1_dmem_rresp  (cpu1_dmem_rresp),
        // Hart 2
        .cpu2_imem_araddr (cpu2_imem_araddr), .cpu2_imem_arvalid(cpu2_imem_arvalid),
        .cpu2_imem_arready(cpu2_imem_arready), .cpu2_imem_rdata  (cpu2_imem_rdata),
        .cpu2_imem_rvalid (cpu2_imem_rvalid),  .cpu2_imem_rresp  (cpu2_imem_rresp),
        .cpu2_dmem_awvalid(cpu2_dmem_awvalid), .cpu2_dmem_awready(cpu2_dmem_awready),
        .cpu2_dmem_awaddr (cpu2_dmem_awaddr),  .cpu2_dmem_wvalid (cpu2_dmem_wvalid),
        .cpu2_dmem_wready (cpu2_dmem_wready),  .cpu2_dmem_wdata  (cpu2_dmem_wdata),
        .cpu2_dmem_wstrb  (cpu2_dmem_wstrb),   .cpu2_dmem_bvalid (cpu2_dmem_bvalid),
        .cpu2_dmem_bready (cpu2_dmem_bready),  .cpu2_dmem_arvalid(cpu2_dmem_arvalid),
        .cpu2_dmem_arready(cpu2_dmem_arready), .cpu2_dmem_araddr (cpu2_dmem_araddr),
        .cpu2_dmem_rvalid (cpu2_dmem_rvalid),  .cpu2_dmem_rready (cpu2_dmem_rready),
        .cpu2_dmem_rdata  (cpu2_dmem_rdata),   .cpu2_dmem_rresp  (cpu2_dmem_rresp),
        // Hart 3
        .cpu3_imem_araddr (cpu3_imem_araddr), .cpu3_imem_arvalid(cpu3_imem_arvalid),
        .cpu3_imem_arready(cpu3_imem_arready), .cpu3_imem_rdata  (cpu3_imem_rdata),
        .cpu3_imem_rvalid (cpu3_imem_rvalid),  .cpu3_imem_rresp  (cpu3_imem_rresp),
        .cpu3_dmem_awvalid(cpu3_dmem_awvalid), .cpu3_dmem_awready(cpu3_dmem_awready),
        .cpu3_dmem_awaddr (cpu3_dmem_awaddr),  .cpu3_dmem_wvalid (cpu3_dmem_wvalid),
        .cpu3_dmem_wready (cpu3_dmem_wready),  .cpu3_dmem_wdata  (cpu3_dmem_wdata),
        .cpu3_dmem_wstrb  (cpu3_dmem_wstrb),   .cpu3_dmem_bvalid (cpu3_dmem_bvalid),
        .cpu3_dmem_bready (cpu3_dmem_bready),  .cpu3_dmem_arvalid(cpu3_dmem_arvalid),
        .cpu3_dmem_arready(cpu3_dmem_arready), .cpu3_dmem_araddr (cpu3_dmem_araddr),
        .cpu3_dmem_rvalid (cpu3_dmem_rvalid),  .cpu3_dmem_rready (cpu3_dmem_rready),
        .cpu3_dmem_rdata  (cpu3_dmem_rdata),   .cpu3_dmem_rresp  (cpu3_dmem_rresp),
        // Hart 4 (Monitor)
        .cpu4_imem_araddr (cpu4_imem_araddr), .cpu4_imem_arvalid(cpu4_imem_arvalid),
        .cpu4_imem_arready(cpu4_imem_arready), .cpu4_imem_rdata  (cpu4_imem_rdata),
        .cpu4_imem_rvalid (cpu4_imem_rvalid),  .cpu4_imem_rresp  (cpu4_imem_rresp),
        .cpu4_dmem_awvalid(cpu4_dmem_awvalid), .cpu4_dmem_awready(cpu4_dmem_awready),
        .cpu4_dmem_awaddr (cpu4_dmem_awaddr),  .cpu4_dmem_wvalid (cpu4_dmem_wvalid),
        .cpu4_dmem_wready (cpu4_dmem_wready),  .cpu4_dmem_wdata  (cpu4_dmem_wdata),
        .cpu4_dmem_wstrb  (cpu4_dmem_wstrb),   .cpu4_dmem_bvalid (cpu4_dmem_bvalid),
        .cpu4_dmem_bready (cpu4_dmem_bready),  .cpu4_dmem_arvalid(cpu4_dmem_arvalid),
        .cpu4_dmem_arready(cpu4_dmem_arready), .cpu4_dmem_araddr (cpu4_dmem_araddr),
        .cpu4_dmem_rvalid (cpu4_dmem_rvalid),  .cpu4_dmem_rready (cpu4_dmem_rready),
        .cpu4_dmem_rdata  (cpu4_dmem_rdata),   .cpu4_dmem_rresp  (cpu4_dmem_rresp),
        .harts_active     (harts_active)
    );

    // Instruction bus: imem of all harts → directly to L2/DDR via crossbar slave 0
    // Simplified: imem buses tied to crossbar master 0 instruction channel (read-only)
    // Each hart's imem shares the read channels by muxing
    // (In real PD: each hart would have its own AXI master port)
    // For RTL simulation we route hart0 imem through crossbar M0 read channel
    assign cpu0_imem_arready = 1'b1;   // Crossbar acknowledges immediately
    assign cpu0_imem_rdata   = 64'h0000_0000_0000_0013; // NOP (simulation)
    assign cpu0_imem_rvalid  = cpu0_imem_arvalid;
    assign cpu0_imem_rresp   = 2'h0;
    assign cpu1_imem_arready = 1'b1;   assign cpu1_imem_rdata   = 64'h0000_0000_0000_0013;
    assign cpu1_imem_rvalid  = cpu1_imem_arvalid;  assign cpu1_imem_rresp = 2'h0;
    assign cpu2_imem_arready = 1'b1;   assign cpu2_imem_rdata   = 64'h0000_0000_0000_0013;
    assign cpu2_imem_rvalid  = cpu2_imem_arvalid;  assign cpu2_imem_rresp = 2'h0;
    assign cpu3_imem_arready = 1'b1;   assign cpu3_imem_rdata   = 64'h0000_0000_0000_0013;
    assign cpu3_imem_rvalid  = cpu3_imem_arvalid;  assign cpu3_imem_rresp = 2'h0;
    assign cpu4_imem_arready = 1'b1;   assign cpu4_imem_rdata   = 64'h0000_0000_0000_0013;
    assign cpu4_imem_rvalid  = cpu4_imem_arvalid;  assign cpu4_imem_rresp = 2'h0;

    // =========================================================================
    // AXI4 CROSSBAR (5M × 8S)
    // Masters: cpu0_dmem, cpu1_dmem, cpu2_dmem, cpu3_dmem, cpu4_dmem
    // =========================================================================
    // L2 Cache slave wires
    wire l2_s_arvalid, l2_s_arready; wire [39:0] l2_s_araddr;
    wire l2_s_rvalid, l2_s_rready; wire [63:0] l2_s_rdata; wire [1:0] l2_s_rresp;
    wire l2_s_awvalid, l2_s_awready; wire [39:0] l2_s_awaddr;
    wire l2_s_wvalid, l2_s_wready; wire [63:0] l2_s_wdata; wire [7:0] l2_s_wstrb;
    wire l2_s_bvalid, l2_s_bready; wire [1:0] l2_s_bresp;
    wire [3:0] l2_s_bid; wire l2_s_rlast; wire [3:0] l2_s_rid; wire l2_s_wlast;

    // DDR slave wires
    wire ddr_s_arvalid, ddr_s_arready; wire [39:0] ddr_s_araddr; wire [3:0] ddr_s_arid;
    wire [7:0] ddr_s_arlen;
    wire ddr_s_rvalid, ddr_s_rready; wire [63:0] ddr_s_rdata; wire [1:0] ddr_s_rresp;
    wire ddr_s_rlast; wire [3:0] ddr_s_rid;
    wire ddr_s_awvalid, ddr_s_awready; wire [39:0] ddr_s_awaddr; wire [3:0] ddr_s_awid;
    wire [7:0] ddr_s_awlen; wire [2:0] ddr_s_awsize;
    wire ddr_s_wvalid, ddr_s_wready; wire [63:0] ddr_s_wdata; wire [7:0] ddr_s_wstrb;
    wire ddr_s_wlast;
    wire ddr_s_bvalid, ddr_s_bready; wire [1:0] ddr_s_bresp; wire [3:0] ddr_s_bid;

    // Peripheral slaves (PCIe, GEM0, GEM1, Video, Periph, Security)
    wire s2_arvalid_x, s2_arready_x; wire [39:0] s2_araddr_x;
    wire s2_rvalid_x, s2_rready_x; wire [63:0] s2_rdata_x;
    wire s2_awvalid_x, s2_awready_x; wire [39:0] s2_awaddr_x;
    wire s2_wvalid_x, s2_wready_x; wire [63:0] s2_wdata_x;
    wire [7:0] s2_wstrb_x; wire s2_bvalid_x, s2_bready_x;

    wire s3_arvalid_x, s3_arready_x; wire [39:0] s3_araddr_x;
    wire s3_rvalid_x, s3_rready_x; wire [63:0] s3_rdata_x;
    wire s3_awvalid_x, s3_awready_x; wire [39:0] s3_awaddr_x;
    wire s3_wvalid_x, s3_wready_x; wire [63:0] s3_wdata_x;
    wire [7:0] s3_wstrb_x; wire s3_bvalid_x, s3_bready_x;

    wire s4_arvalid_x, s4_arready_x; wire [39:0] s4_araddr_x;
    wire s4_rvalid_x, s4_rready_x; wire [63:0] s4_rdata_x;
    wire s4_awvalid_x, s4_awready_x; wire [39:0] s4_awaddr_x;
    wire s4_wvalid_x, s4_wready_x; wire [63:0] s4_wdata_x;
    wire [7:0] s4_wstrb_x; wire s4_bvalid_x, s4_bready_x;

    wire s5_arvalid_x, s5_arready_x; wire [39:0] s5_araddr_x;
    wire s5_rvalid_x, s5_rready_x; wire [63:0] s5_rdata_x;
    wire s5_awvalid_x, s5_awready_x; wire [39:0] s5_awaddr_x;
    wire s5_wvalid_x, s5_wready_x; wire [63:0] s5_wdata_x;
    wire [7:0] s5_wstrb_x; wire s5_bvalid_x, s5_bready_x;

    wire s6_arvalid_x, s6_arready_x; wire [39:0] s6_araddr_x;
    wire s6_rvalid_x, s6_rready_x; wire [63:0] s6_rdata_x;
    wire s6_awvalid_x, s6_awready_x; wire [39:0] s6_awaddr_x;
    wire s6_wvalid_x, s6_wready_x; wire [63:0] s6_wdata_x;
    wire [7:0] s6_wstrb_x; wire s6_bvalid_x, s6_bready_x;

    wire s7_arvalid_x, s7_arready_x; wire [39:0] s7_araddr_x;
    wire s7_rvalid_x, s7_rready_x; wire [63:0] s7_rdata_x;
    wire s7_awvalid_x, s7_awready_x; wire [39:0] s7_awaddr_x;
    wire s7_wvalid_x, s7_wready_x; wire [63:0] s7_wdata_x;
    wire [7:0] s7_wstrb_x; wire s7_bvalid_x, s7_bready_x;

    axi4_crossbar u_xbar (
        .clk(sys_clk), .rst_n(sync_rst_n),
        // M0 = cpu0_dmem
        .m0_awvalid(cpu0_dmem_awvalid), .m0_awready(cpu0_dmem_awready),
        .m0_awaddr(cpu0_dmem_awaddr), .m0_awid(4'h0),
        .m0_wvalid(cpu0_dmem_wvalid),  .m0_wready(cpu0_dmem_wready),
        .m0_wdata(cpu0_dmem_wdata),    .m0_wstrb(cpu0_dmem_wstrb), .m0_wlast(1'b1),
        .m0_bvalid(cpu0_dmem_bvalid),  .m0_bready(cpu0_dmem_bready),
        .m0_bresp(), .m0_bid(),
        .m0_arvalid(cpu0_dmem_arvalid),.m0_arready(cpu0_dmem_arready),
        .m0_araddr(cpu0_dmem_araddr),  .m0_arid(4'h0),
        .m0_rvalid(cpu0_dmem_rvalid),  .m0_rready(cpu0_dmem_rready),
        .m0_rdata(cpu0_dmem_rdata), .m0_rresp(cpu0_dmem_rresp), .m0_rlast(), .m0_rid(),
        // M1 = cpu1_dmem
        .m1_awvalid(cpu1_dmem_awvalid), .m1_awready(cpu1_dmem_awready),
        .m1_awaddr(cpu1_dmem_awaddr), .m1_awid(4'h1),
        .m1_wvalid(cpu1_dmem_wvalid),  .m1_wready(cpu1_dmem_wready),
        .m1_wdata(cpu1_dmem_wdata),    .m1_wstrb(cpu1_dmem_wstrb), .m1_wlast(1'b1),
        .m1_bvalid(cpu1_dmem_bvalid),  .m1_bready(cpu1_dmem_bready),
        .m1_bresp(), .m1_bid(),
        .m1_arvalid(cpu1_dmem_arvalid),.m1_arready(cpu1_dmem_arready),
        .m1_araddr(cpu1_dmem_araddr),  .m1_arid(4'h1),
        .m1_rvalid(cpu1_dmem_rvalid),  .m1_rready(cpu1_dmem_rready),
        .m1_rdata(cpu1_dmem_rdata), .m1_rresp(cpu1_dmem_rresp), .m1_rlast(), .m1_rid(),
        // M2 = cpu2_dmem
        .m2_awvalid(cpu2_dmem_awvalid), .m2_awready(cpu2_dmem_awready),
        .m2_awaddr(cpu2_dmem_awaddr), .m2_awid(4'h2),
        .m2_wvalid(cpu2_dmem_wvalid),  .m2_wready(cpu2_dmem_wready),
        .m2_wdata(cpu2_dmem_wdata),    .m2_wstrb(cpu2_dmem_wstrb), .m2_wlast(1'b1),
        .m2_bvalid(cpu2_dmem_bvalid),  .m2_bready(cpu2_dmem_bready),
        .m2_bresp(), .m2_bid(),
        .m2_arvalid(cpu2_dmem_arvalid),.m2_arready(cpu2_dmem_arready),
        .m2_araddr(cpu2_dmem_araddr),  .m2_arid(4'h2),
        .m2_rvalid(cpu2_dmem_rvalid),  .m2_rready(cpu2_dmem_rready),
        .m2_rdata(cpu2_dmem_rdata), .m2_rresp(cpu2_dmem_rresp), .m2_rlast(), .m2_rid(),
        // M3 = cpu3_dmem
        .m3_awvalid(cpu3_dmem_awvalid), .m3_awready(cpu3_dmem_awready),
        .m3_awaddr(cpu3_dmem_awaddr), .m3_awid(4'h3),
        .m3_wvalid(cpu3_dmem_wvalid),  .m3_wready(cpu3_dmem_wready),
        .m3_wdata(cpu3_dmem_wdata),    .m3_wstrb(cpu3_dmem_wstrb), .m3_wlast(1'b1),
        .m3_bvalid(cpu3_dmem_bvalid),  .m3_bready(cpu3_dmem_bready),
        .m3_bresp(), .m3_bid(),
        .m3_arvalid(cpu3_dmem_arvalid),.m3_arready(cpu3_dmem_arready),
        .m3_araddr(cpu3_dmem_araddr),  .m3_arid(4'h3),
        .m3_rvalid(cpu3_dmem_rvalid),  .m3_rready(cpu3_dmem_rready),
        .m3_rdata(cpu3_dmem_rdata), .m3_rresp(cpu3_dmem_rresp), .m3_rlast(), .m3_rid(),
        // M4 = cpu4_dmem
        .m4_awvalid(cpu4_dmem_awvalid), .m4_awready(cpu4_dmem_awready),
        .m4_awaddr(cpu4_dmem_awaddr), .m4_awid(4'h4),
        .m4_wvalid(cpu4_dmem_wvalid),  .m4_wready(cpu4_dmem_wready),
        .m4_wdata(cpu4_dmem_wdata),    .m4_wstrb(cpu4_dmem_wstrb), .m4_wlast(1'b1),
        .m4_bvalid(cpu4_dmem_bvalid),  .m4_bready(cpu4_dmem_bready),
        .m4_bresp(), .m4_bid(),
        .m4_arvalid(cpu4_dmem_arvalid),.m4_arready(cpu4_dmem_arready),
        .m4_araddr(cpu4_dmem_araddr),  .m4_arid(4'h4),
        .m4_rvalid(cpu4_dmem_rvalid),  .m4_rready(cpu4_dmem_rready),
        .m4_rdata(cpu4_dmem_rdata), .m4_rresp(cpu4_dmem_rresp), .m4_rlast(), .m4_rid(),
        // S0: L2 Cache
        .s0_awvalid(l2_s_awvalid), .s0_awready(l2_s_awready), .s0_awaddr(l2_s_awaddr),
        .s0_awid(l2_s_bid), .s0_wvalid(l2_s_wvalid), .s0_wready(l2_s_wready),
        .s0_wdata(l2_s_wdata), .s0_wstrb(l2_s_wstrb), .s0_wlast(l2_s_wlast),
        .s0_bvalid(l2_s_bvalid), .s0_bready(l2_s_bready), .s0_bresp(l2_s_bresp),
        .s0_bid(l2_s_bid), .s0_arvalid(l2_s_arvalid), .s0_arready(l2_s_arready),
        .s0_araddr(l2_s_araddr), .s0_arid(l2_s_rid), .s0_rvalid(l2_s_rvalid),
        .s0_rready(l2_s_rready), .s0_rdata(l2_s_rdata), .s0_rresp(l2_s_rresp),
        .s0_rlast(l2_s_rlast), .s0_rid(l2_s_rid),
        // S1: DDR
        .s1_awvalid(ddr_s_awvalid), .s1_awready(ddr_s_awready), .s1_awaddr(ddr_s_awaddr),
        .s1_awid(ddr_s_awid), .s1_awlen(ddr_s_awlen), .s1_awsize(ddr_s_awsize),
        .s1_wvalid(ddr_s_wvalid), .s1_wready(ddr_s_wready), .s1_wdata(ddr_s_wdata),
        .s1_wstrb(ddr_s_wstrb), .s1_wlast(ddr_s_wlast),
        .s1_bvalid(ddr_s_bvalid), .s1_bready(ddr_s_bready), .s1_bresp(ddr_s_bresp),
        .s1_bid(ddr_s_bid), .s1_arvalid(ddr_s_arvalid), .s1_arready(ddr_s_arready),
        .s1_araddr(ddr_s_araddr), .s1_arid(ddr_s_arid), .s1_arlen(ddr_s_arlen),
        .s1_rvalid(ddr_s_rvalid), .s1_rready(ddr_s_rready), .s1_rdata(ddr_s_rdata),
        .s1_rresp(ddr_s_rresp), .s1_rlast(ddr_s_rlast), .s1_rid(ddr_s_rid),
        // S2–S7
        .s2_arvalid(s2_arvalid_x), .s2_arready(s2_arready_x), .s2_araddr(s2_araddr_x),
        .s2_rvalid(s2_rvalid_x),   .s2_rready(s2_rready_x),   .s2_rdata(s2_rdata_x),
        .s2_awvalid(s2_awvalid_x), .s2_awready(s2_awready_x), .s2_awaddr(s2_awaddr_x),
        .s2_wvalid(s2_wvalid_x),   .s2_wready(s2_wready_x),   .s2_wdata(s2_wdata_x),
        .s2_wstrb(s2_wstrb_x),     .s2_bvalid(s2_bvalid_x),   .s2_bready(s2_bready_x),
        .s3_arvalid(s3_arvalid_x), .s3_arready(s3_arready_x), .s3_araddr(s3_araddr_x),
        .s3_rvalid(s3_rvalid_x),   .s3_rready(s3_rready_x),   .s3_rdata(s3_rdata_x),
        .s3_awvalid(s3_awvalid_x), .s3_awready(s3_awready_x), .s3_awaddr(s3_awaddr_x),
        .s3_wvalid(s3_wvalid_x),   .s3_wready(s3_wready_x),   .s3_wdata(s3_wdata_x),
        .s3_wstrb(s3_wstrb_x),     .s3_bvalid(s3_bvalid_x),   .s3_bready(s3_bready_x),
        .s4_arvalid(s4_arvalid_x), .s4_arready(s4_arready_x), .s4_araddr(s4_araddr_x),
        .s4_rvalid(s4_rvalid_x),   .s4_rready(s4_rready_x),   .s4_rdata(s4_rdata_x),
        .s4_awvalid(s4_awvalid_x), .s4_awready(s4_awready_x), .s4_awaddr(s4_awaddr_x),
        .s4_wvalid(s4_wvalid_x),   .s4_wready(s4_wready_x),   .s4_wdata(s4_wdata_x),
        .s4_wstrb(s4_wstrb_x),     .s4_bvalid(s4_bvalid_x),   .s4_bready(s4_bready_x),
        .s5_arvalid(s5_arvalid_x), .s5_arready(s5_arready_x), .s5_araddr(s5_araddr_x),
        .s5_rvalid(s5_rvalid_x),   .s5_rready(s5_rready_x),   .s5_rdata(s5_rdata_x),
        .s5_awvalid(s5_awvalid_x), .s5_awready(s5_awready_x), .s5_awaddr(s5_awaddr_x),
        .s5_wvalid(s5_wvalid_x),   .s5_wready(s5_wready_x),   .s5_wdata(s5_wdata_x),
        .s5_wstrb(s5_wstrb_x),     .s5_bvalid(s5_bvalid_x),   .s5_bready(s5_bready_x),
        .s6_arvalid(s6_arvalid_x), .s6_arready(s6_arready_x), .s6_araddr(s6_araddr_x),
        .s6_rvalid(s6_rvalid_x),   .s6_rready(s6_rready_x),   .s6_rdata(s6_rdata_x),
        .s6_awvalid(s6_awvalid_x), .s6_awready(s6_awready_x), .s6_awaddr(s6_awaddr_x),
        .s6_wvalid(s6_wvalid_x),   .s6_wready(s6_wready_x),   .s6_wdata(s6_wdata_x),
        .s6_wstrb(s6_wstrb_x),     .s6_bvalid(s6_bvalid_x),   .s6_bready(s6_bready_x),
        .s7_arvalid(s7_arvalid_x), .s7_arready(s7_arready_x), .s7_araddr(s7_araddr_x),
        .s7_rvalid(s7_rvalid_x),   .s7_rready(s7_rready_x),   .s7_rdata(s7_rdata_x),
        .s7_awvalid(s7_awvalid_x), .s7_awready(s7_awready_x), .s7_awaddr(s7_awaddr_x),
        .s7_wvalid(s7_wvalid_x),   .s7_wready(s7_wready_x),   .s7_wdata(s7_wdata_x),
        .s7_wstrb(s7_wstrb_x),     .s7_bvalid(s7_bvalid_x),   .s7_bready(s7_bready_x)
    );

    // =========================================================================
    // L2 CACHE (contains the 2× sram_32x64_180nm macros — LVS FIX)
    // =========================================================================
    l2_cache_top u_l2_cache (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .s_arvalid(l2_s_arvalid), .s_arready(l2_s_arready), .s_araddr(l2_s_araddr),
        .s_rvalid(l2_s_rvalid),   .s_rready(l2_s_rready),   .s_rdata(l2_s_rdata),
        .s_rresp(l2_s_rresp),
        .s_awvalid(l2_s_awvalid), .s_awready(l2_s_awready), .s_awaddr(l2_s_awaddr),
        .s_wvalid(l2_s_wvalid),   .s_wready(l2_s_wready),   .s_wdata(l2_s_wdata),
        .s_wstrb(l2_s_wstrb),     .s_bvalid(l2_s_bvalid),   .s_bready(l2_s_bready),
        .s_bresp(l2_s_bresp),
        .m_arvalid(ddr_s_arvalid),.m_arready(ddr_s_arready),.m_araddr(ddr_s_araddr),
        .m_rvalid(ddr_s_rvalid),  .m_rready(ddr_s_rready),  .m_rdata(ddr_s_rdata),
        .m_rresp(ddr_s_rresp),
        .m_awvalid(ddr_s_awvalid),.m_awready(ddr_s_awready),.m_awaddr(ddr_s_awaddr),
        .m_wvalid(ddr_s_wvalid),  .m_wready(ddr_s_wready),  .m_wdata(ddr_s_wdata),
        .m_wstrb(ddr_s_wstrb),    .m_bvalid(ddr_s_bvalid),  .m_bready(ddr_s_bready)
    );

    // =========================================================================
    // DDR4 CONTROLLER
    // =========================================================================
    ddr_ctrl_top u_ddr (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .s_awvalid(ddr_s_awvalid), .s_awready(ddr_s_awready),
        .s_awaddr(ddr_s_awaddr),   .s_awid(ddr_s_awid),
        .s_awlen(ddr_s_awlen),     .s_awsize(ddr_s_awsize),
        .s_wvalid(ddr_s_wvalid),   .s_wready(ddr_s_wready),
        .s_wdata(ddr_s_wdata),     .s_wstrb(ddr_s_wstrb),   .s_wlast(ddr_s_wlast),
        .s_bvalid(ddr_s_bvalid),   .s_bready(ddr_s_bready),
        .s_bresp(ddr_s_bresp),     .s_bid(ddr_s_bid),
        .s_arvalid(ddr_s_arvalid), .s_arready(ddr_s_arready),
        .s_araddr(ddr_s_araddr),   .s_arid(ddr_s_arid),     .s_arlen(ddr_s_arlen),
        .s_rvalid(ddr_s_rvalid),   .s_rready(ddr_s_rready),
        .s_rdata(ddr_s_rdata),     .s_rresp(ddr_s_rresp),
        .s_rlast(ddr_s_rlast),     .s_rid(ddr_s_rid),
        .ddr_ck_p(ddr_ck_p),      .ddr_ck_n(ddr_ck_n),
        .ddr_cke(ddr_cke),         .ddr_cs_n(ddr_cs_n),
        .ddr_ras_n(ddr_ras_n),     .ddr_cas_n(ddr_cas_n),   .ddr_we_n(ddr_we_n),
        .ddr_ba(ddr_ba),           .ddr_addr(ddr_addr),      .ddr_dm(ddr_dm),
        .ddr_dq(ddr_dq),           .ddr_dqs_p(ddr_dqs_p),   .ddr_dqs_n(ddr_dqs_n)
    );

    // =========================================================================
    // PCIe
    // =========================================================================
    pcie_top u_pcie (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .s_arvalid(s2_arvalid_x), .s_arready(s2_arready_x), .s_araddr(s2_araddr_x),
        .s_rvalid(s2_rvalid_x),   .s_rready(s2_rready_x),   .s_rdata(s2_rdata_x),
        .s_rresp(), .s_awvalid(s2_awvalid_x), .s_awready(s2_awready_x),
        .s_awaddr(s2_awaddr_x), .s_wvalid(s2_wvalid_x), .s_wready(s2_wready_x),
        .s_wdata(s2_wdata_x), .s_wstrb(s2_wstrb_x), .s_bvalid(s2_bvalid_x),
        .s_bready(s2_bready_x), .s_bresp(),
        .m_awvalid(), .m_awready(1'b1), .m_awaddr(),
        .m_wvalid(),  .m_wready(1'b1),  .m_wdata(),  .m_wstrb(),
        .m_bvalid(1'b0), .m_bready(),
        .m_arvalid(), .m_arready(1'b1), .m_araddr(),
        .m_rvalid(1'b0), .m_rready(), .m_rdata(64'h0), .m_rresp(2'h0),
        .pcie_txp(pcie_txp), .pcie_txn(pcie_txn),
        .pcie_rxp(pcie_rxp), .pcie_rxn(pcie_rxn),
        .pcie_refclk_p(pcie_refclk_p), .pcie_refclk_n(pcie_refclk_n),
        .pcie_perst_n(pcie_perst_n), .irq(pcie_irq)
    );
    assign link_up_pcie = pcie_irq;

    // =========================================================================
    // GEM0 / GEM1 Ethernet
    // =========================================================================
    wire gem0_m_arvalid, gem0_m_awvalid, gem0_m_wvalid;
    gem_ethernet u_gem0 (
        .clk(eth_clk), .rst_n(sync_rst_n),
        .s_arvalid(s3_arvalid_x), .s_arready(s3_arready_x), .s_araddr(s3_araddr_x[15:0]),
        .s_rvalid(s3_rvalid_x),   .s_rready(s3_rready_x),   .s_rdata(s3_rdata_x[31:0]),
        .s_rresp(),
        .s_awvalid(s3_awvalid_x), .s_awready(s3_awready_x), .s_awaddr(s3_awaddr_x[15:0]),
        .s_wvalid(s3_wvalid_x),   .s_wready(s3_wready_x),   .s_wdata(s3_wdata_x[31:0]),
        .s_wstrb(s3_wstrb_x[3:0]), .s_bvalid(s3_bvalid_x),  .s_bready(s3_bready_x),
        .s_bresp(),
        .m_arvalid(gem0_m_arvalid), .m_arready(1'b1), .m_araddr(),
        .m_rvalid(1'b0), .m_rready(), .m_rdata(64'h0),
        .m_awvalid(gem0_m_awvalid), .m_awready(1'b1), .m_awaddr(),
        .m_wvalid(gem0_m_wvalid), .m_wready(1'b1), .m_wdata(), .m_wstrb(),
        .m_bvalid(1'b0), .m_bready(),
        .rgmii_txc(gem0_rgmii_txc), .rgmii_tx_ctl(gem0_rgmii_tx_ctl),
        .rgmii_txd(gem0_rgmii_txd), .rgmii_rxc(gem0_rgmii_rxc),
        .rgmii_rx_ctl(gem0_rgmii_rx_ctl), .rgmii_rxd(gem0_rgmii_rxd),
        .irq(gem0_irq)
    );
    assign s3_rdata_x = {32'h0, s3_rdata_x[31:0]}; // zero-extend

    wire gem1_m_arvalid_w, gem1_m_awvalid_w, gem1_m_wvalid_w;
    gem_ethernet u_gem1 (
        .clk(eth_clk), .rst_n(sync_rst_n),
        .s_arvalid(s4_arvalid_x), .s_arready(s4_arready_x), .s_araddr(s4_araddr_x[15:0]),
        .s_rvalid(s4_rvalid_x),   .s_rready(s4_rready_x),   .s_rdata(s4_rdata_x[31:0]),
        .s_rresp(),
        .s_awvalid(s4_awvalid_x), .s_awready(s4_awready_x), .s_awaddr(s4_awaddr_x[15:0]),
        .s_wvalid(s4_wvalid_x),   .s_wready(s4_wready_x),   .s_wdata(s4_wdata_x[31:0]),
        .s_wstrb(s4_wstrb_x[3:0]), .s_bvalid(s4_bvalid_x),  .s_bready(s4_bready_x),
        .s_bresp(),
        .m_arvalid(gem1_m_arvalid_w), .m_arready(1'b1), .m_araddr(),
        .m_rvalid(1'b0), .m_rready(), .m_rdata(64'h0),
        .m_awvalid(gem1_m_awvalid_w), .m_awready(1'b1), .m_awaddr(),
        .m_wvalid(gem1_m_wvalid_w), .m_wready(1'b1), .m_wdata(), .m_wstrb(),
        .m_bvalid(1'b0), .m_bready(),
        .rgmii_txc(gem1_rgmii_txc), .rgmii_tx_ctl(gem1_rgmii_tx_ctl),
        .rgmii_txd(gem1_rgmii_txd), .rgmii_rxc(gem1_rgmii_rxc),
        .rgmii_rx_ctl(gem1_rgmii_rx_ctl), .rgmii_rxd(gem1_rgmii_rxd),
        .irq(gem1_irq)
    );

    // =========================================================================
    // PERIPHERAL BRIDGE (AXI4 → AHB → APB) with peripheral mux
    // =========================================================================
    // AXI4 → AHB bridge (slave 6 = peripheral space)
    wire [31:0] ahb_haddr; wire ahb_hwrite; wire [1:0] ahb_htrans;
    wire [31:0] ahb_hwdata; wire [31:0] ahb_hrdata; wire ahb_hready; wire ahb_hresp;

    axi4_to_ahb u_axi2ahb (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .s_awvalid(s6_awvalid_x), .s_awready(s6_awready_x),
        .s_awaddr(s6_awaddr_x), .s_awid(4'h0),
        .s_wvalid(s6_wvalid_x), .s_wready(s6_wready_x),
        .s_wdata(s6_wdata_x[31:0]), .s_wstrb(s6_wstrb_x[3:0]),
        .s_bvalid(s6_bvalid_x), .s_bready(s6_bready_x), .s_bresp(), .s_bid(),
        .s_arvalid(s6_arvalid_x), .s_arready(s6_arready_x), .s_araddr(s6_araddr_x),
        .s_arid(4'h0),
        .s_rvalid(s6_rvalid_x), .s_rready(s6_rready_x), .s_rdata(s6_rdata_x[31:0]),
        .s_rresp(), .s_rlast(),
        .haddr(ahb_haddr), .hwrite(ahb_hwrite), .htrans(ahb_htrans),
        .hsize(), .hburst(), .hwdata(ahb_hwdata),
        .hrdata(ahb_hrdata), .hready(ahb_hready), .hresp(ahb_hresp)
    );
    assign s6_rdata_x[63:32] = 32'h0;

    // AHB → APB
    wire [31:0] apb_paddr; wire apb_psel; wire apb_penable; wire apb_pwrite;
    wire [31:0] apb_pwdata; wire [31:0] apb_prdata; wire apb_pready;

    ahb_to_apb u_ahb2apb (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .haddr(ahb_haddr), .hwrite(ahb_hwrite), .htrans(ahb_htrans),
        .hwdata(ahb_hwdata), .hrdata(ahb_hrdata), .hready_out(ahb_hready), .hresp(ahb_hresp),
        .paddr(apb_paddr), .psel(apb_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .pwdata(apb_pwdata), .prdata(apb_prdata), .pready(apb_pready), .pslverr(1'b0)
    );

    // APB peripheral mux (decode by bits [19:16] of paddr)
    wire [31:0] uart0_prdata, uart1_prdata, gpio_prdata, spi_prdata, i2c_prdata, wdt_prdata;
    wire uart0_pready, uart1_pready, gpio_pready, spi_pready, i2c_pready, wdt_pready;

    wire uart0_psel = apb_psel && (apb_paddr[19:16] == 4'h0);
    wire uart1_psel = apb_psel && (apb_paddr[19:16] == 4'h1);
    wire gpio_psel  = apb_psel && (apb_paddr[19:16] == 4'h2);
    wire spi_psel   = apb_psel && (apb_paddr[19:16] == 4'h3);
    wire i2c_psel   = apb_psel && (apb_paddr[19:16] == 4'h4);
    wire wdt_psel   = apb_psel && (apb_paddr[19:16] == 4'h5);

    assign apb_prdata = uart0_psel ? uart0_prdata :
                        uart1_psel ? uart1_prdata :
                        gpio_psel  ? gpio_prdata  :
                        spi_psel   ? spi_prdata   :
                        i2c_psel   ? i2c_prdata   :
                        wdt_psel   ? wdt_prdata   : 32'hDEAD_DEAD;

    uart_16550 u_uart0 (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(uart0_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(uart0_prdata),
        .pready(uart0_pready), .txd(uart0_txd), .rxd(uart0_rxd), .irq(uart0_irq)
    );

    uart_16550 u_uart1 (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(uart1_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(uart1_prdata),
        .pready(uart1_pready), .txd(uart1_txd), .rxd(uart1_rxd), .irq(uart1_irq)
    );

    wire wdt_rst_n;
    gpio_ctrl u_gpio (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(gpio_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(gpio_prdata),
        .pready(gpio_pready), .gpio_pad(gpio_pad), .irq(gpio_irq)
    );

    wire [3:0] spi_csn_w;
    assign spi_csn = spi_csn_w;
    spi_master u_spi (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(spi_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(spi_prdata),
        .pready(spi_pready), .spi_clk(spi_clk), .spi_mosi(spi_mosi),
        .spi_miso(spi_miso), .spi_csn(spi_csn_w), .irq(spi_irq)
    );

    i2c_master u_i2c (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(i2c_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(i2c_prdata),
        .pready(i2c_pready), .scl_pad(i2c_scl), .sda_pad(i2c_sda), .irq(i2c_irq)
    );

    watchdog_timer u_wdt (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(wdt_psel), .penable(apb_penable), .pwrite(apb_pwrite),
        .paddr(apb_paddr[3:0]), .pwdata(apb_pwdata), .prdata(wdt_prdata),
        .pready(wdt_pready), .wdt_reset_n(wdt_rst_n), .irq(wdt_irq)
    );

    // =========================================================================
    // SECURITY SUBSYSTEM (AXI4 → APB via slave 7)
    // =========================================================================
    wire [31:0] aes_prdata, sha_prdata, trng_prdata;
    wire aes_psel  = s7_arvalid_x && (s7_araddr_x[19:16] == 4'h0);
    wire sha_psel  = s7_arvalid_x && (s7_araddr_x[19:16] == 4'h1);
    wire trng_psel = s7_arvalid_x && (s7_araddr_x[19:16] == 4'h2);

    aes_engine u_aes (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(aes_psel), .penable(1'b1), .pwrite(s7_awvalid_x),
        .paddr(s7_araddr_x[5:0]), .pwdata(s7_wdata_x[31:0]),
        .prdata(aes_prdata), .pready(), .irq(aes_irq)
    );

    sha256_engine u_sha256 (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(sha_psel), .penable(1'b1), .pwrite(s7_awvalid_x),
        .paddr(s7_araddr_x[7:0]), .pwdata(s7_wdata_x[31:0]),
        .prdata(sha_prdata), .pready(), .irq(sha_irq)
    );

    trng u_trng (
        .clk(sys_clk), .rst_n(sync_rst_n),
        .psel(trng_psel), .penable(1'b1), .pwrite(1'b0),
        .paddr(s7_araddr_x[3:0]), .pwdata(32'h0),
        .prdata(trng_prdata), .pready(), .irq(trng_irq)
    );

    assign s7_rdata_x  = {32'h0, aes_psel ? aes_prdata : sha_psel ? sha_prdata : trng_prdata};
    assign s7_rvalid_x = s7_arvalid_x;
    assign s7_arready_x= 1'b1;
    assign s7_awready_x= 1'b1;
    assign s7_wready_x = 1'b1;
    assign s7_bvalid_x = s7_awvalid_x;
    // assign s7_bready_x = 1'b1;

    // S5 (Video): reserved for future use
    assign s5_arready_x = 1'b1;
    assign s5_rvalid_x  = 1'b0;
    assign s5_rdata_x   = 64'h0;
    assign s5_awready_x = 1'b1;
    assign s5_wready_x  = 1'b1;
    assign s5_bvalid_x  = 1'b0;
endmodule