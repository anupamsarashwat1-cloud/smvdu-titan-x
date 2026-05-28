// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — L2 Cache Top
// Instantiates: l2_cache_ctrl, l2_tag_array (x1), l2_data_array (contains 2x sram_32x64_180nm)
`timescale 1ns/1ps
module l2_cache_top (
    input  wire        clk,
    input  wire        rst_n,
    // AXI4-Lite slave (from crossbar)
    input  wire        s_arvalid,  output wire        s_arready,
    input  wire [39:0] s_araddr,
    output wire        s_rvalid,   input  wire        s_rready,
    output wire [63:0] s_rdata,    output wire [1:0]  s_rresp,
    input  wire        s_awvalid,  output wire        s_awready,
    input  wire [39:0] s_awaddr,
    input  wire        s_wvalid,   output wire        s_wready,
    input  wire [63:0] s_wdata,    input  wire [7:0]  s_wstrb,
    output wire        s_bvalid,   input  wire        s_bready,
    output wire [1:0]  s_bresp,
    // AXI4 master (to DDR controller)
    output wire        m_arvalid,  input  wire        m_arready,
    output wire [39:0] m_araddr,
    input  wire        m_rvalid,   output wire        m_rready,
    input  wire [63:0] m_rdata,    input  wire [1:0]  m_rresp,
    output wire        m_awvalid,  input  wire        m_awready,
    output wire [39:0] m_awaddr,
    output wire        m_wvalid,   input  wire        m_wready,
    output wire [63:0] m_wdata,    output wire [7:0]  m_wstrb,
    input  wire        m_bvalid,   output wire        m_bready
);
    // Internal wires: controller ↔ tag array
    wire        tag_cs, tag_we, tag_valid_out;
    wire [5:0]  tag_index;
    wire [27:0] tag_in, tag_out;

    // Internal wires: controller ↔ data array
    wire        dat_cs, dat_we, dat_bank, dat_dout_valid;
    wire [3:0]  dat_wmask;
    wire [5:0]  dat_addr;
    wire [31:0] dat_din, dat_dout;

    l2_cache_ctrl u_ctrl (
        .clk(clk), .rst_n(rst_n),
        .s_arvalid(s_arvalid), .s_arready(s_arready), .s_araddr(s_araddr),
        .s_rvalid(s_rvalid),   .s_rready(s_rready),   .s_rdata(s_rdata), .s_rresp(s_rresp),
        .s_awvalid(s_awvalid), .s_awready(s_awready), .s_awaddr(s_awaddr),
        .s_wvalid(s_wvalid),   .s_wready(s_wready),   .s_wdata(s_wdata), .s_wstrb(s_wstrb),
        .s_bvalid(s_bvalid),   .s_bready(s_bready),   .s_bresp(s_bresp),
        .m_arvalid(m_arvalid), .m_arready(m_arready), .m_araddr(m_araddr),
        .m_rvalid(m_rvalid),   .m_rready(m_rready),   .m_rdata(m_rdata), .m_rresp(m_rresp),
        .m_awvalid(m_awvalid), .m_awready(m_awready), .m_awaddr(m_awaddr),
        .m_wvalid(m_wvalid),   .m_wready(m_wready),   .m_wdata(m_wdata), .m_wstrb(m_wstrb),
        .m_bvalid(m_bvalid),   .m_bready(m_bready),
        .tag_cs(tag_cs), .tag_we(tag_we), .tag_index(tag_index),
        .tag_in(tag_in), .tag_out(tag_out), .tag_valid_out(tag_valid_out),
        .dat_cs(dat_cs), .dat_we(dat_we), .dat_bank(dat_bank),
        .dat_wmask(dat_wmask), .dat_addr(dat_addr),
        .dat_din(dat_din), .dat_dout(dat_dout), .dat_dout_valid(dat_dout_valid)
    );

    l2_tag_array #(.NUM_SETS(64), .TAG_W(28)) u_tags (
        .clk(clk), .rst_n(rst_n),
        .cs(tag_cs), .we(tag_we), .index(tag_index),
        .tag_in(tag_in), .tag_out(tag_out), .valid_out(tag_valid_out)
    );

    // l2_data_array contains the 2 sram_32x64_180nm macros
    l2_data_array #(.NUM_BANKS(2), .DATA_W(32), .DEPTH(64)) u_data (
        .clk(clk), .rst_n(rst_n),
        .bank_sel(dat_bank), .cs(dat_cs), .we(dat_we),
        .wmask(dat_wmask), .addr(dat_addr),
        .din(dat_din), .dout(dat_dout), .dout_valid(dat_dout_valid)
    );
endmodule
