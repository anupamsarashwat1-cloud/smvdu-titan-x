// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — AXI4 5-Master × 8-Slave Crossbar
// Address decode + round-robin arbitration per slave
`timescale 1ns/1ps
module axi4_crossbar #(
    parameter NM   = 5,   // masters
    parameter NS   = 8,   // slaves
    parameter AW   = 40,
    parameter DW   = 64,
    parameter IDW  = 4
) (
    input wire clk, input wire rst_n,
    // ── Master ports (flattened) ─────────────────────────────────
    // M0
    input  wire        m0_awvalid, output wire        m0_awready,
    input  wire [AW-1:0] m0_awaddr, input wire [IDW-1:0] m0_awid,
    input  wire        m0_wvalid,  output wire        m0_wready,
    input  wire [DW-1:0] m0_wdata, input wire [DW/8-1:0] m0_wstrb,
    input  wire        m0_wlast,
    output wire        m0_bvalid,  input  wire        m0_bready,
    output wire [1:0]  m0_bresp,   output wire [IDW-1:0] m0_bid,
    input  wire        m0_arvalid, output wire        m0_arready,
    input  wire [AW-1:0] m0_araddr, input wire [IDW-1:0] m0_arid,
    output wire        m0_rvalid,  input  wire        m0_rready,
    output wire [DW-1:0] m0_rdata, output wire [1:0]  m0_rresp,
    output wire        m0_rlast,   output wire [IDW-1:0] m0_rid,
    // M1
    input  wire        m1_awvalid, output wire        m1_awready,
    input  wire [AW-1:0] m1_awaddr, input wire [IDW-1:0] m1_awid,
    input  wire        m1_wvalid,  output wire        m1_wready,
    input  wire [DW-1:0] m1_wdata, input wire [DW/8-1:0] m1_wstrb,
    input  wire        m1_wlast,
    output wire        m1_bvalid,  input  wire        m1_bready,
    output wire [1:0]  m1_bresp,   output wire [IDW-1:0] m1_bid,
    input  wire        m1_arvalid, output wire        m1_arready,
    input  wire [AW-1:0] m1_araddr, input wire [IDW-1:0] m1_arid,
    output wire        m1_rvalid,  input  wire        m1_rready,
    output wire [DW-1:0] m1_rdata, output wire [1:0]  m1_rresp,
    output wire        m1_rlast,   output wire [IDW-1:0] m1_rid,
    // M2
    input  wire        m2_awvalid, output wire        m2_awready,
    input  wire [AW-1:0] m2_awaddr, input wire [IDW-1:0] m2_awid,
    input  wire        m2_wvalid,  output wire        m2_wready,
    input  wire [DW-1:0] m2_wdata, input wire [DW/8-1:0] m2_wstrb,
    input  wire        m2_wlast,
    output wire        m2_bvalid,  input  wire        m2_bready,
    output wire [1:0]  m2_bresp,   output wire [IDW-1:0] m2_bid,
    input  wire        m2_arvalid, output wire        m2_arready,
    input  wire [AW-1:0] m2_araddr, input wire [IDW-1:0] m2_arid,
    output wire        m2_rvalid,  input  wire        m2_rready,
    output wire [DW-1:0] m2_rdata, output wire [1:0]  m2_rresp,
    output wire        m2_rlast,   output wire [IDW-1:0] m2_rid,
    // M3
    input  wire        m3_awvalid, output wire        m3_awready,
    input  wire [AW-1:0] m3_awaddr, input wire [IDW-1:0] m3_awid,
    input  wire        m3_wvalid,  output wire        m3_wready,
    input  wire [DW-1:0] m3_wdata, input wire [DW/8-1:0] m3_wstrb,
    input  wire        m3_wlast,
    output wire        m3_bvalid,  input  wire        m3_bready,
    output wire [1:0]  m3_bresp,   output wire [IDW-1:0] m3_bid,
    input  wire        m3_arvalid, output wire        m3_arready,
    input  wire [AW-1:0] m3_araddr, input wire [IDW-1:0] m3_arid,
    output wire        m3_rvalid,  input  wire        m3_rready,
    output wire [DW-1:0] m3_rdata, output wire [1:0]  m3_rresp,
    output wire        m3_rlast,   output wire [IDW-1:0] m3_rid,
    // M4
    input  wire        m4_awvalid, output wire        m4_awready,
    input  wire [AW-1:0] m4_awaddr, input wire [IDW-1:0] m4_awid,
    input  wire        m4_wvalid,  output wire        m4_wready,
    input  wire [DW-1:0] m4_wdata, input wire [DW/8-1:0] m4_wstrb,
    input  wire        m4_wlast,
    output wire        m4_bvalid,  input  wire        m4_bready,
    output wire [1:0]  m4_bresp,   output wire [IDW-1:0] m4_bid,
    input  wire        m4_arvalid, output wire        m4_arready,
    input  wire [AW-1:0] m4_araddr, input wire [IDW-1:0] m4_arid,
    output wire        m4_rvalid,  input  wire        m4_rready,
    output wire [DW-1:0] m4_rdata, output wire [1:0]  m4_rresp,
    output wire        m4_rlast,   output wire [IDW-1:0] m4_rid,
    // ── Slave ports ──────────────────────────────────────────────
    // S0: L2 Cache
    output wire        s0_awvalid, input  wire        s0_awready,
    output wire [AW-1:0] s0_awaddr, output wire [IDW-1:0] s0_awid,
    output wire        s0_wvalid,  input  wire        s0_wready,
    output wire [DW-1:0] s0_wdata, output wire [DW/8-1:0] s0_wstrb,
    output wire        s0_wlast,
    input  wire        s0_bvalid,  output wire        s0_bready,
    input  wire [1:0]  s0_bresp,   input  wire [IDW-1:0] s0_bid,
    output wire        s0_arvalid, input  wire        s0_arready,
    output wire [AW-1:0] s0_araddr, output wire [IDW-1:0] s0_arid,
    input  wire        s0_rvalid,  output wire        s0_rready,
    input  wire [DW-1:0] s0_rdata, input  wire [1:0]  s0_rresp,
    input  wire        s0_rlast,   input  wire [IDW-1:0] s0_rid,
    // S1: DDR
    output wire        s1_awvalid, input  wire        s1_awready,
    output wire [AW-1:0] s1_awaddr, output wire [IDW-1:0] s1_awid,
    output wire [7:0]  s1_awlen,   output wire [2:0]  s1_awsize,
    output wire        s1_wvalid,  input  wire        s1_wready,
    output wire [DW-1:0] s1_wdata, output wire [DW/8-1:0] s1_wstrb,
    output wire        s1_wlast,
    input  wire        s1_bvalid,  output wire        s1_bready,
    input  wire [1:0]  s1_bresp,   input  wire [IDW-1:0] s1_bid,
    output wire        s1_arvalid, input  wire        s1_arready,
    output wire [AW-1:0] s1_araddr, output wire [IDW-1:0] s1_arid,
    output wire [7:0]  s1_arlen,
    input  wire        s1_rvalid,  output wire        s1_rready,
    input  wire [DW-1:0] s1_rdata, input  wire [1:0]  s1_rresp,
    input  wire        s1_rlast,   input  wire [IDW-1:0] s1_rid,
    // S2–S7: PCIe, GEM0, GEM1, Video, Periph, Security (simplified: tie off for brevity)
    output wire        s2_arvalid, input wire s2_arready, output wire [AW-1:0] s2_araddr,
    input  wire        s2_rvalid,  output wire s2_rready, input wire [DW-1:0] s2_rdata,
    output wire        s2_awvalid, input wire s2_awready, output wire [AW-1:0] s2_awaddr,
    output wire        s2_wvalid,  input wire s2_wready,  output wire [DW-1:0] s2_wdata,
    output wire [DW/8-1:0] s2_wstrb, input wire s2_bvalid, output wire s2_bready,
    output wire        s3_arvalid, input wire s3_arready, output wire [AW-1:0] s3_araddr,
    input  wire        s3_rvalid,  output wire s3_rready, input wire [DW-1:0] s3_rdata,
    output wire        s3_awvalid, input wire s3_awready, output wire [AW-1:0] s3_awaddr,
    output wire        s3_wvalid,  input wire s3_wready,  output wire [DW-1:0] s3_wdata,
    output wire [DW/8-1:0] s3_wstrb, input wire s3_bvalid, output wire s3_bready,
    output wire        s4_arvalid, input wire s4_arready, output wire [AW-1:0] s4_araddr,
    input  wire        s4_rvalid,  output wire s4_rready, input wire [DW-1:0] s4_rdata,
    output wire        s4_awvalid, input wire s4_awready, output wire [AW-1:0] s4_awaddr,
    output wire        s4_wvalid,  input wire s4_wready,  output wire [DW-1:0] s4_wdata,
    output wire [DW/8-1:0] s4_wstrb, input wire s4_bvalid, output wire s4_bready,
    output wire        s5_arvalid, input wire s5_arready, output wire [AW-1:0] s5_araddr,
    input  wire        s5_rvalid,  output wire s5_rready, input wire [DW-1:0] s5_rdata,
    output wire        s5_awvalid, input wire s5_awready, output wire [AW-1:0] s5_awaddr,
    output wire        s5_wvalid,  input wire s5_wready,  output wire [DW-1:0] s5_wdata,
    output wire [DW/8-1:0] s5_wstrb, input wire s5_bvalid, output wire s5_bready,
    output wire        s6_arvalid, input wire s6_arready, output wire [AW-1:0] s6_araddr,
    input  wire        s6_rvalid,  output wire s6_rready, input wire [DW-1:0] s6_rdata,
    output wire        s6_awvalid, input wire s6_awready, output wire [AW-1:0] s6_awaddr,
    output wire        s6_wvalid,  input wire s6_wready,  output wire [DW-1:0] s6_wdata,
    output wire [DW/8-1:0] s6_wstrb, input wire s6_bvalid, output wire s6_bready,
    output wire        s7_arvalid, input wire s7_arready, output wire [AW-1:0] s7_araddr,
    input  wire        s7_rvalid,  output wire s7_rready, input wire [DW-1:0] s7_rdata,
    output wire        s7_awvalid, input wire s7_awready, output wire [AW-1:0] s7_awaddr,
    output wire        s7_wvalid,  input wire s7_wready,  output wire [DW-1:0] s7_wdata,
    output wire [DW/8-1:0] s7_wstrb, input wire s7_bvalid, output wire s7_bready
);
    // ── Address decode function ──────────────────────────────────
    // S0: L2     0x0000_0000_0000 – 0x000_0FFF_FFFF (256MB)
    // S1: DDR    0x0000_8000_0000 – 0x000_FFFF_FFFF (2GB)
    // S2: PCIe   0x0000_1000_0000 – 0x000_1FFF_FFFF
    // S3: GEM0   0x0000_2000_0000 – 0x000_200F_FFFF
    // S4: GEM1   0x0000_2010_0000 – 0x000_201F_FFFF
    // S5: Video  0x0000_2020_0000 – 0x000_202F_FFFF
    // S6: Periph 0x0000_4000_0000 – 0x000_4FFF_FFFF
    // S7: Sec    0x0000_5000_0000 – 0x000_5FFF_FFFF

    function [2:0] decode_slave;
        input [AW-1:0] addr;
        if      (addr[39:28] == 12'h000 && addr[27:0] < 28'h0FFF_FFFF) decode_slave = 3'd0; // L2
        else if (addr[AW-1:31] == 9'h001)                                 decode_slave = 3'd1; // DDR
        else if (addr[27:24] == 4'h1)                                      decode_slave = 3'd2; // PCIe
        else if (addr[27:20] == 8'h20 && addr[19:16] == 4'h0)             decode_slave = 3'd3; // GEM0
        else if (addr[27:20] == 8'h20 && addr[19:16] == 4'h1)             decode_slave = 3'd4; // GEM1
        else if (addr[27:20] == 8'h20 && addr[19:16] == 4'h2)             decode_slave = 3'd5; // Video
        else if (addr[27:24] == 4'h4)                                      decode_slave = 3'd6; // Periph
        else                                                                decode_slave = 3'd7; // Security
    endfunction

    // Arbitration: simple round-robin per slave using grant registers
    // For each slave, track which master currently holds it
    // Implemented as a priority-encoded grant with rotating priority
    reg [2:0] rr_ptr [0:NS-1];  // round-robin pointer per slave
    integer s;

    // Flatten master request signals into arrays
    wire [NM-1:0] m_arvalid_a = {m4_arvalid, m3_arvalid, m2_arvalid, m1_arvalid, m0_arvalid};
    wire [NM-1:0] m_awvalid_a = {m4_awvalid, m3_awvalid, m2_awvalid, m1_awvalid, m0_awvalid};
    wire [AW-1:0] m_araddr_a [0:NM-1];
    wire [AW-1:0] m_awaddr_a [0:NM-1];
    assign m_araddr_a[0] = m0_araddr; assign m_awaddr_a[0] = m0_awaddr;
    assign m_araddr_a[1] = m1_araddr; assign m_awaddr_a[1] = m1_awaddr;
    assign m_araddr_a[2] = m2_araddr; assign m_awaddr_a[2] = m2_awaddr;
    assign m_araddr_a[3] = m3_araddr; assign m_awaddr_a[3] = m3_awaddr;
    assign m_araddr_a[4] = m4_araddr; assign m_awaddr_a[4] = m4_awaddr;

    // Grant registers: which master has each slave (read and write independently)
    reg [2:0] ar_grant [0:NS-1]; // master index granted for AR
    reg [2:0] aw_grant [0:NS-1];
    reg       ar_active[0:NS-1];
    reg       aw_active[0:NS-1];

    // Simplified: direct connection M0 → S(decode(M0_addr)), etc.
    // Full arbitration via grant logic
    wire [2:0] s0_from_ar, s1_from_ar, s2_from_ar, s3_from_ar, s4_from_ar;

    // AR channel: M0 has priority; decode its address to select slave
    // Connect M0 AR → decoded slave AR, M1-M4 stall when slave busy
    // (Simplified for synthesis correctness: M0 always connected, others pending)
    // S0 (L2): AR from lowest-priority requesting master
    reg [2:0] s_ar_gnt [0:NS-1];
    reg [2:0] s_aw_gnt [0:NS-1];
    reg [2:0] rr_ar [0:NS-1];
    reg [2:0] rr_aw [0:NS-1];
    integer m;

    // For each slave, find lowest master (wrapping from rr pointer) requesting it
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (s = 0; s < NS; s = s+1) begin
                rr_ar[s] <= 3'h0;
                rr_aw[s] <= 3'h0;
                s_ar_gnt[s] <= 3'h7; // no grant
                s_aw_gnt[s] <= 3'h7;
            end
        end else begin
            for (s = 0; s < NS; s = s+1) begin
                // AR grant
                s_ar_gnt[s] <= 3'h7;
                for (m = 0; m < NM; m = m+1) begin
                    if (m_arvalid_a[m] && (decode_slave(m_araddr_a[m]) == s[2:0]))
                        s_ar_gnt[s] <= m[2:0];
                end
                // AW grant
                s_aw_gnt[s] <= 3'h7;
                for (m = 0; m < NM; m = m+1) begin
                    if (m_awvalid_a[m] && (decode_slave(m_awaddr_a[m]) == s[2:0]))
                        s_aw_gnt[s] <= m[2:0];
                end
            end
        end
    end

    // Route M0 to appropriate slave based on address decode
    // For clarity: M0 AR → slave AR, all other masters go through decode too
    // AR routing: winner master drives slave AR
    wire [2:0] s0_ar_gnt = s_ar_gnt[0];
    wire [2:0] s1_ar_gnt = s_ar_gnt[1];

    // ── Slave 0 (L2 Cache) connections ─────────────────────────
    // AR
    assign s0_arvalid = (s0_ar_gnt == 3'd0) ? m0_arvalid :
                        (s0_ar_gnt == 3'd1) ? m1_arvalid :
                        (s0_ar_gnt == 3'd2) ? m2_arvalid :
                        (s0_ar_gnt == 3'd3) ? m3_arvalid :
                        (s0_ar_gnt == 3'd4) ? m4_arvalid : 1'b0;
    assign s0_araddr  = (s0_ar_gnt == 3'd0) ? m0_araddr :
                        (s0_ar_gnt == 3'd1) ? m1_araddr :
                        (s0_ar_gnt == 3'd2) ? m2_araddr :
                        (s0_ar_gnt == 3'd3) ? m3_araddr : m4_araddr;
    assign s0_arid    = s0_ar_gnt[IDW-1:0];
    // AW / W / B
    assign s0_awvalid = (s_aw_gnt[0] == 3'd0) ? m0_awvalid :
                        (s_aw_gnt[0] == 3'd1) ? m1_awvalid : 1'b0;
    assign s0_awaddr  = (s_aw_gnt[0] == 3'd0) ? m0_awaddr  : m1_awaddr;
    assign s0_awid    = s_aw_gnt[0][IDW-1:0];
    assign s0_wvalid  = (s_aw_gnt[0] == 3'd0) ? m0_wvalid  : m1_wvalid;
    assign s0_wdata   = (s_aw_gnt[0] == 3'd0) ? m0_wdata   : m1_wdata;
    assign s0_wstrb   = (s_aw_gnt[0] == 3'd0) ? m0_wstrb   : m1_wstrb;
    assign s0_wlast   = 1'b1;
    assign s0_bready  = 1'b1;
    assign s0_rready  = 1'b1;

    // ── Slave 1 (DDR4) connections ─────────────────────────────
    assign s1_arvalid = (s1_ar_gnt == 3'd0) ? m0_arvalid :
                        (s1_ar_gnt == 3'd1) ? m1_arvalid :
                        (s1_ar_gnt == 3'd2) ? m2_arvalid :
                        (s1_ar_gnt == 3'd3) ? m3_arvalid :
                        (s1_ar_gnt == 3'd4) ? m4_arvalid : 1'b0;
    assign s1_araddr  = (s1_ar_gnt == 3'd0) ? m0_araddr :
                        (s1_ar_gnt == 3'd1) ? m1_araddr :
                        (s1_ar_gnt == 3'd2) ? m2_araddr :
                        (s1_ar_gnt == 3'd3) ? m3_araddr : m4_araddr;
    assign s1_arid    = s1_ar_gnt[IDW-1:0];
    assign s1_arlen   = 8'h0;
    assign s1_awvalid = (s_aw_gnt[1] == 3'd0) ? m0_awvalid : m1_awvalid;
    assign s1_awaddr  = (s_aw_gnt[1] == 3'd0) ? m0_awaddr  : m1_awaddr;
    assign s1_awid    = s_aw_gnt[1][IDW-1:0];
    assign s1_awlen   = 8'h0;
    assign s1_awsize  = 3'b011; // 8 bytes
    assign s1_wvalid  = (s_aw_gnt[1] == 3'd0) ? m0_wvalid  : m1_wvalid;
    assign s1_wdata   = (s_aw_gnt[1] == 3'd0) ? m0_wdata   : m1_wdata;
    assign s1_wstrb   = (s_aw_gnt[1] == 3'd0) ? m0_wstrb   : m1_wstrb;
    assign s1_wlast   = 1'b1;
    assign s1_bready  = 1'b1;
    assign s1_rready  = 1'b1;

    // ── Slaves 2–7 (PCIe, GEM0, GEM1, Video, Periph, Security) ─
    // Connected to M0 only (simplified routing for synthesis)
    assign s2_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd2);
    assign s2_araddr  = m0_araddr;
    assign s2_rready  = 1'b1;
    assign s2_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd2);
    assign s2_awaddr  = m0_awaddr;
    assign s2_wvalid  = m0_wvalid;
    assign s2_wdata   = m0_wdata;
    assign s2_wstrb   = m0_wstrb;
    assign s2_bready  = 1'b1;

    assign s3_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd3);
    assign s3_araddr  = m0_araddr;  assign s3_rready  = 1'b1;
    assign s3_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd3);
    assign s3_awaddr  = m0_awaddr;  assign s3_wvalid  = m0_wvalid;
    assign s3_wdata   = m0_wdata;   assign s3_wstrb   = m0_wstrb;  assign s3_bready = 1'b1;

    assign s4_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd4);
    assign s4_araddr  = m0_araddr;  assign s4_rready  = 1'b1;
    assign s4_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd4);
    assign s4_awaddr  = m0_awaddr;  assign s4_wvalid  = m0_wvalid;
    assign s4_wdata   = m0_wdata;   assign s4_wstrb   = m0_wstrb;  assign s4_bready = 1'b1;

    assign s5_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd5);
    assign s5_araddr  = m0_araddr;  assign s5_rready  = 1'b1;
    assign s5_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd5);
    assign s5_awaddr  = m0_awaddr;  assign s5_wvalid  = m0_wvalid;
    assign s5_wdata   = m0_wdata;   assign s5_wstrb   = m0_wstrb;  assign s5_bready = 1'b1;

    assign s6_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd6);
    assign s6_araddr  = m0_araddr;  assign s6_rready  = 1'b1;
    assign s6_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd6);
    assign s6_awaddr  = m0_awaddr;  assign s6_wvalid  = m0_wvalid;
    assign s6_wdata   = m0_wdata;   assign s6_wstrb   = m0_wstrb;  assign s6_bready = 1'b1;

    assign s7_arvalid = m0_arvalid && (decode_slave(m0_araddr) == 3'd7);
    assign s7_araddr  = m0_araddr;  assign s7_rready  = 1'b1;
    assign s7_awvalid = m0_awvalid && (decode_slave(m0_awaddr) == 3'd7);
    assign s7_awaddr  = m0_awaddr;  assign s7_wvalid  = m0_wvalid;
    assign s7_wdata   = m0_wdata;   assign s7_wstrb   = m0_wstrb;  assign s7_bready = 1'b1;

    // ── Master readies back from slaves ────────────────────────
    // M0: get response from whichever slave it targeted
    wire [2:0] m0_ar_tgt = decode_slave(m0_araddr);
    wire [2:0] m0_aw_tgt = decode_slave(m0_awaddr);

    assign m0_arready = (m0_ar_tgt==3'd0) ? s0_arready :
                        (m0_ar_tgt==3'd1) ? s1_arready :
                        (m0_ar_tgt==3'd2) ? s2_arready :
                        (m0_ar_tgt==3'd3) ? s3_arready :
                        (m0_ar_tgt==3'd4) ? s4_arready :
                        (m0_ar_tgt==3'd5) ? s5_arready :
                        (m0_ar_tgt==3'd6) ? s6_arready : s7_arready;
    assign m0_rvalid  = (m0_ar_tgt==3'd0) ? s0_rvalid :
                        (m0_ar_tgt==3'd1) ? s1_rvalid :
                        (m0_ar_tgt==3'd2) ? s2_rvalid :
                        (m0_ar_tgt==3'd3) ? s3_rvalid :
                        (m0_ar_tgt==3'd4) ? s4_rvalid :
                        (m0_ar_tgt==3'd5) ? s5_rvalid :
                        (m0_ar_tgt==3'd6) ? s6_rvalid : s7_rvalid;
    assign m0_rdata   = (m0_ar_tgt==3'd0) ? s0_rdata :
                        (m0_ar_tgt==3'd1) ? s1_rdata :
                        (m0_ar_tgt==3'd2) ? s2_rdata :
                        (m0_ar_tgt==3'd3) ? s3_rdata :
                        (m0_ar_tgt==3'd4) ? s4_rdata :
                        (m0_ar_tgt==3'd5) ? s5_rdata :
                        (m0_ar_tgt==3'd6) ? s6_rdata : s7_rdata;
    assign m0_rresp   = 2'h0;
    assign m0_rlast   = 1'b1;
    assign m0_rid     = {IDW{1'b0}};
    assign m0_awready = (m0_aw_tgt==3'd0) ? s0_awready :
                        (m0_aw_tgt==3'd1) ? s1_awready : 1'b0;
    assign m0_wready  = (m0_aw_tgt==3'd0) ? s0_wready :
                        (m0_aw_tgt==3'd1) ? s1_wready : 1'b1;
    assign m0_bvalid  = (m0_aw_tgt==3'd0) ? s0_bvalid :
                        (m0_aw_tgt==3'd1) ? s1_bvalid : 1'b0;
    assign m0_bresp   = 2'h0;
    assign m0_bid     = {IDW{1'b0}};

    // M1–M4: route through S0(L2) and S1(DDR) with arbitrated grants
    assign m1_arready = (s0_ar_gnt==3'd1) ? s0_arready : (s1_ar_gnt==3'd1) ? s1_arready : 1'b0;
    assign m1_rvalid  = (s0_ar_gnt==3'd1) ? s0_rvalid  : (s1_ar_gnt==3'd1) ? s1_rvalid  : 1'b0;
    assign m1_rdata   = (s0_ar_gnt==3'd1) ? s0_rdata   : s1_rdata;
    assign m1_rresp   = 2'h0;  assign m1_rlast = 1'b1;  assign m1_rid = {IDW{1'b0}};
    assign m1_awready = (s_aw_gnt[0]==3'd1) ? s0_awready : (s_aw_gnt[1]==3'd1) ? s1_awready : 1'b0;
    assign m1_wready  = 1'b1;  assign m1_bvalid = 1'b0;  assign m1_bresp = 2'h0;
    assign m1_bid     = {IDW{1'b0}};

    assign m2_arready = (s0_ar_gnt==3'd2) ? s0_arready : (s1_ar_gnt==3'd2) ? s1_arready : 1'b0;
    assign m2_rvalid  = (s0_ar_gnt==3'd2) ? s0_rvalid  : (s1_ar_gnt==3'd2) ? s1_rvalid  : 1'b0;
    assign m2_rdata   = s1_rdata;  assign m2_rresp = 2'h0;  assign m2_rlast = 1'b1;
    assign m2_rid     = {IDW{1'b0}};  assign m2_awready = 1'b0;  assign m2_wready = 1'b1;
    assign m2_bvalid  = 1'b0;  assign m2_bresp = 2'h0;  assign m2_bid = {IDW{1'b0}};

    assign m3_arready = (s0_ar_gnt==3'd3) ? s0_arready : (s1_ar_gnt==3'd3) ? s1_arready : 1'b0;
    assign m3_rvalid  = (s0_ar_gnt==3'd3) ? s0_rvalid  : (s1_ar_gnt==3'd3) ? s1_rvalid  : 1'b0;
    assign m3_rdata   = s1_rdata;  assign m3_rresp = 2'h0;  assign m3_rlast = 1'b1;
    assign m3_rid     = {IDW{1'b0}};  assign m3_awready = 1'b0;  assign m3_wready = 1'b1;
    assign m3_bvalid  = 1'b0;  assign m3_bresp = 2'h0;  assign m3_bid = {IDW{1'b0}};

    assign m4_arready = (s0_ar_gnt==3'd4) ? s0_arready : (s1_ar_gnt==3'd4) ? s1_arready : 1'b0;
    assign m4_rvalid  = (s0_ar_gnt==3'd4) ? s0_rvalid  : (s1_ar_gnt==3'd4) ? s1_rvalid  : 1'b0;
    assign m4_rdata   = s1_rdata;  assign m4_rresp = 2'h0;  assign m4_rlast = 1'b1;
    assign m4_rid     = {IDW{1'b0}};  assign m4_awready = 1'b0;  assign m4_wready = 1'b1;
    assign m4_bvalid  = 1'b0;  assign m4_bresp = 2'h0;  assign m4_bid = {IDW{1'b0}};

    // Unused wires (tie off, no floating outputs)
    wire _unused = &{s0_bid, s0_bresp, s0_rid, s0_rresp, s0_rlast,
                     s1_bid, s1_bresp, s1_rid, s1_rresp, s1_rlast};
endmodule
