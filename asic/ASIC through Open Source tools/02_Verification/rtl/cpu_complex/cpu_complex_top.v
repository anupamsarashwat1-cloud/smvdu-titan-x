// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — CPU Complex Top
// Instantiates 5x RV64I cores (HART 0-3: App, HART 4: Monitor)
// plus PLIC (186 IRQs) and CLINT
`timescale 1ns/1ps
module cpu_complex_top (
    input  wire        clk,
    input  wire        rst_n,
    // Interrupt sources from peripherals (routed through PLIC)
    input  wire [185:0] irq_sources,
    // ── HART 0 AXI4-Lite Instruction + Data buses ───────────────
    output wire [39:0] cpu0_imem_araddr,  output wire cpu0_imem_arvalid,
    input  wire        cpu0_imem_arready, input  wire [63:0] cpu0_imem_rdata,
    input  wire        cpu0_imem_rvalid,  input  wire [1:0]  cpu0_imem_rresp,
    output wire        cpu0_dmem_awvalid, input  wire        cpu0_dmem_awready,
    output wire [39:0] cpu0_dmem_awaddr,  output wire        cpu0_dmem_wvalid,
    input  wire        cpu0_dmem_wready,  output wire [63:0] cpu0_dmem_wdata,
    output wire [7:0]  cpu0_dmem_wstrb,   input  wire        cpu0_dmem_bvalid,
    output wire        cpu0_dmem_bready,  output wire        cpu0_dmem_arvalid,
    input  wire        cpu0_dmem_arready, output wire [39:0] cpu0_dmem_araddr,
    input  wire        cpu0_dmem_rvalid,  output wire        cpu0_dmem_rready,
    input  wire [63:0] cpu0_dmem_rdata,   input  wire [1:0]  cpu0_dmem_rresp,
    // ── HART 1 ───────────────────────────────────────────────────
    output wire [39:0] cpu1_imem_araddr,  output wire cpu1_imem_arvalid,
    input  wire        cpu1_imem_arready, input  wire [63:0] cpu1_imem_rdata,
    input  wire        cpu1_imem_rvalid,  input  wire [1:0]  cpu1_imem_rresp,
    output wire        cpu1_dmem_awvalid, input  wire        cpu1_dmem_awready,
    output wire [39:0] cpu1_dmem_awaddr,  output wire        cpu1_dmem_wvalid,
    input  wire        cpu1_dmem_wready,  output wire [63:0] cpu1_dmem_wdata,
    output wire [7:0]  cpu1_dmem_wstrb,   input  wire        cpu1_dmem_bvalid,
    output wire        cpu1_dmem_bready,  output wire        cpu1_dmem_arvalid,
    input  wire        cpu1_dmem_arready, output wire [39:0] cpu1_dmem_araddr,
    input  wire        cpu1_dmem_rvalid,  output wire        cpu1_dmem_rready,
    input  wire [63:0] cpu1_dmem_rdata,   input  wire [1:0]  cpu1_dmem_rresp,
    // ── HART 2 ───────────────────────────────────────────────────
    output wire [39:0] cpu2_imem_araddr,  output wire cpu2_imem_arvalid,
    input  wire        cpu2_imem_arready, input  wire [63:0] cpu2_imem_rdata,
    input  wire        cpu2_imem_rvalid,  input  wire [1:0]  cpu2_imem_rresp,
    output wire        cpu2_dmem_awvalid, input  wire        cpu2_dmem_awready,
    output wire [39:0] cpu2_dmem_awaddr,  output wire        cpu2_dmem_wvalid,
    input  wire        cpu2_dmem_wready,  output wire [63:0] cpu2_dmem_wdata,
    output wire [7:0]  cpu2_dmem_wstrb,   input  wire        cpu2_dmem_bvalid,
    output wire        cpu2_dmem_bready,  output wire        cpu2_dmem_arvalid,
    input  wire        cpu2_dmem_arready, output wire [39:0] cpu2_dmem_araddr,
    input  wire        cpu2_dmem_rvalid,  output wire        cpu2_dmem_rready,
    input  wire [63:0] cpu2_dmem_rdata,   input  wire [1:0]  cpu2_dmem_rresp,
    // ── HART 3 ───────────────────────────────────────────────────
    output wire [39:0] cpu3_imem_araddr,  output wire cpu3_imem_arvalid,
    input  wire        cpu3_imem_arready, input  wire [63:0] cpu3_imem_rdata,
    input  wire        cpu3_imem_rvalid,  input  wire [1:0]  cpu3_imem_rresp,
    output wire        cpu3_dmem_awvalid, input  wire        cpu3_dmem_awready,
    output wire [39:0] cpu3_dmem_awaddr,  output wire        cpu3_dmem_wvalid,
    input  wire        cpu3_dmem_wready,  output wire [63:0] cpu3_dmem_wdata,
    output wire [7:0]  cpu3_dmem_wstrb,   input  wire        cpu3_dmem_bvalid,
    output wire        cpu3_dmem_bready,  output wire        cpu3_dmem_arvalid,
    input  wire        cpu3_dmem_arready, output wire [39:0] cpu3_dmem_araddr,
    input  wire        cpu3_dmem_rvalid,  output wire        cpu3_dmem_rready,
    input  wire [63:0] cpu3_dmem_rdata,   input  wire [1:0]  cpu3_dmem_rresp,
    // ── HART 4 (Monitor) ─────────────────────────────────────────
    output wire [39:0] cpu4_imem_araddr,  output wire cpu4_imem_arvalid,
    input  wire        cpu4_imem_arready, input  wire [63:0] cpu4_imem_rdata,
    input  wire        cpu4_imem_rvalid,  input  wire [1:0]  cpu4_imem_rresp,
    output wire        cpu4_dmem_awvalid, input  wire        cpu4_dmem_awready,
    output wire [39:0] cpu4_dmem_awaddr,  output wire        cpu4_dmem_wvalid,
    input  wire        cpu4_dmem_wready,  output wire [63:0] cpu4_dmem_wdata,
    output wire [7:0]  cpu4_dmem_wstrb,   input  wire        cpu4_dmem_bvalid,
    output wire        cpu4_dmem_bready,  output wire        cpu4_dmem_arvalid,
    input  wire        cpu4_dmem_arready, output wire [39:0] cpu4_dmem_araddr,
    input  wire        cpu4_dmem_rvalid,  output wire        cpu4_dmem_rready,
    input  wire [63:0] cpu4_dmem_rdata,   input  wire [1:0]  cpu4_dmem_rresp,
    // Status
    output wire [4:0]  harts_active
);
    wire [4:0] irq_m_ext;
    wire [4:0] msip_w, mtip_w;

    wire [9:0] plic_irq_targets;
    assign irq_m_ext = plic_irq_targets[4:0];  // lower 5 = M-mode targets

    // PLIC
    plic #(.NUM_SOURCES(186), .NUM_TARGETS(10)) u_plic (
        .clk              (clk),
        .rst_n            (rst_n),
        .interrupt_sources(irq_sources),
        .psel             (1'b0), .penable(1'b0), .pwrite(1'b0),
        .paddr            (24'h0), .pwdata (32'h0), .prdata (),
        .pready           (),
        .irq_targets      (plic_irq_targets)
    );

    // CLINT
    clint #(.NUM_HARTS(5)) u_clint (
        .clk    (clk),   .rst_n  (rst_n),
        .psel   (1'b0),  .penable(1'b0), .pwrite(1'b0),
        .paddr  (16'h0), .pwdata (32'h0), .prdata(), .pready(),
        .msip   (msip_w), .mtip   (mtip_w)
    );

    // 5 CPU cores
    rv_core_top #(.HART_ID(0)) u_hart0 (
        .clk(clk), .rst_n(rst_n), .irq_m_ext(irq_m_ext[0]),
        .imem_araddr(cpu0_imem_araddr), .imem_arvalid(cpu0_imem_arvalid),
        .imem_arready(cpu0_imem_arready), .imem_rdata(cpu0_imem_rdata),
        .imem_rvalid(cpu0_imem_rvalid), .imem_rresp(cpu0_imem_rresp),
        .dmem_awvalid(cpu0_dmem_awvalid), .dmem_awready(cpu0_dmem_awready),
        .dmem_awaddr(cpu0_dmem_awaddr), .dmem_wvalid(cpu0_dmem_wvalid),
        .dmem_wready(cpu0_dmem_wready), .dmem_wdata(cpu0_dmem_wdata),
        .dmem_wstrb(cpu0_dmem_wstrb), .dmem_bvalid(cpu0_dmem_bvalid),
        .dmem_bready(cpu0_dmem_bready), .dmem_arvalid(cpu0_dmem_arvalid),
        .dmem_arready(cpu0_dmem_arready), .dmem_araddr(cpu0_dmem_araddr),
        .dmem_rvalid(cpu0_dmem_rvalid), .dmem_rready(cpu0_dmem_rready),
        .dmem_rdata(cpu0_dmem_rdata), .dmem_rresp(cpu0_dmem_rresp),
        .hart_active(harts_active[0])
    );

    rv_core_top #(.HART_ID(1)) u_hart1 (
        .clk(clk), .rst_n(rst_n), .irq_m_ext(irq_m_ext[1]),
        .imem_araddr(cpu1_imem_araddr), .imem_arvalid(cpu1_imem_arvalid),
        .imem_arready(cpu1_imem_arready), .imem_rdata(cpu1_imem_rdata),
        .imem_rvalid(cpu1_imem_rvalid), .imem_rresp(cpu1_imem_rresp),
        .dmem_awvalid(cpu1_dmem_awvalid), .dmem_awready(cpu1_dmem_awready),
        .dmem_awaddr(cpu1_dmem_awaddr), .dmem_wvalid(cpu1_dmem_wvalid),
        .dmem_wready(cpu1_dmem_wready), .dmem_wdata(cpu1_dmem_wdata),
        .dmem_wstrb(cpu1_dmem_wstrb), .dmem_bvalid(cpu1_dmem_bvalid),
        .dmem_bready(cpu1_dmem_bready), .dmem_arvalid(cpu1_dmem_arvalid),
        .dmem_arready(cpu1_dmem_arready), .dmem_araddr(cpu1_dmem_araddr),
        .dmem_rvalid(cpu1_dmem_rvalid), .dmem_rready(cpu1_dmem_rready),
        .dmem_rdata(cpu1_dmem_rdata), .dmem_rresp(cpu1_dmem_rresp),
        .hart_active(harts_active[1])
    );

    rv_core_top #(.HART_ID(2)) u_hart2 (
        .clk(clk), .rst_n(rst_n), .irq_m_ext(irq_m_ext[2]),
        .imem_araddr(cpu2_imem_araddr), .imem_arvalid(cpu2_imem_arvalid),
        .imem_arready(cpu2_imem_arready), .imem_rdata(cpu2_imem_rdata),
        .imem_rvalid(cpu2_imem_rvalid), .imem_rresp(cpu2_imem_rresp),
        .dmem_awvalid(cpu2_dmem_awvalid), .dmem_awready(cpu2_dmem_awready),
        .dmem_awaddr(cpu2_dmem_awaddr), .dmem_wvalid(cpu2_dmem_wvalid),
        .dmem_wready(cpu2_dmem_wready), .dmem_wdata(cpu2_dmem_wdata),
        .dmem_wstrb(cpu2_dmem_wstrb), .dmem_bvalid(cpu2_dmem_bvalid),
        .dmem_bready(cpu2_dmem_bready), .dmem_arvalid(cpu2_dmem_arvalid),
        .dmem_arready(cpu2_dmem_arready), .dmem_araddr(cpu2_dmem_araddr),
        .dmem_rvalid(cpu2_dmem_rvalid), .dmem_rready(cpu2_dmem_rready),
        .dmem_rdata(cpu2_dmem_rdata), .dmem_rresp(cpu2_dmem_rresp),
        .hart_active(harts_active[2])
    );

    rv_core_top #(.HART_ID(3)) u_hart3 (
        .clk(clk), .rst_n(rst_n), .irq_m_ext(irq_m_ext[3]),
        .imem_araddr(cpu3_imem_araddr), .imem_arvalid(cpu3_imem_arvalid),
        .imem_arready(cpu3_imem_arready), .imem_rdata(cpu3_imem_rdata),
        .imem_rvalid(cpu3_imem_rvalid), .imem_rresp(cpu3_imem_rresp),
        .dmem_awvalid(cpu3_dmem_awvalid), .dmem_awready(cpu3_dmem_awready),
        .dmem_awaddr(cpu3_dmem_awaddr), .dmem_wvalid(cpu3_dmem_wvalid),
        .dmem_wready(cpu3_dmem_wready), .dmem_wdata(cpu3_dmem_wdata),
        .dmem_wstrb(cpu3_dmem_wstrb), .dmem_bvalid(cpu3_dmem_bvalid),
        .dmem_bready(cpu3_dmem_bready), .dmem_arvalid(cpu3_dmem_arvalid),
        .dmem_arready(cpu3_dmem_arready), .dmem_araddr(cpu3_dmem_araddr),
        .dmem_rvalid(cpu3_dmem_rvalid), .dmem_rready(cpu3_dmem_rready),
        .dmem_rdata(cpu3_dmem_rdata), .dmem_rresp(cpu3_dmem_rresp),
        .hart_active(harts_active[3])
    );

    rv_core_top #(.HART_ID(4)) u_hart4 (
        .clk(clk), .rst_n(rst_n), .irq_m_ext(irq_m_ext[4]),
        .imem_araddr(cpu4_imem_araddr), .imem_arvalid(cpu4_imem_arvalid),
        .imem_arready(cpu4_imem_arready), .imem_rdata(cpu4_imem_rdata),
        .imem_rvalid(cpu4_imem_rvalid), .imem_rresp(cpu4_imem_rresp),
        .dmem_awvalid(cpu4_dmem_awvalid), .dmem_awready(cpu4_dmem_awready),
        .dmem_awaddr(cpu4_dmem_awaddr), .dmem_wvalid(cpu4_dmem_wvalid),
        .dmem_wready(cpu4_dmem_wready), .dmem_wdata(cpu4_dmem_wdata),
        .dmem_wstrb(cpu4_dmem_wstrb), .dmem_bvalid(cpu4_dmem_bvalid),
        .dmem_bready(cpu4_dmem_bready), .dmem_arvalid(cpu4_dmem_arvalid),
        .dmem_arready(cpu4_dmem_arready), .dmem_araddr(cpu4_dmem_araddr),
        .dmem_rvalid(cpu4_dmem_rvalid), .dmem_rready(cpu4_dmem_rready),
        .dmem_rdata(cpu4_dmem_rdata), .dmem_rresp(cpu4_dmem_rresp),
        .hart_active(harts_active[4])
    );
endmodule
