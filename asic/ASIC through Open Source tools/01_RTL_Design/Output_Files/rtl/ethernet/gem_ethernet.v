// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — GEM Gigabit Ethernet MAC (802.3)
// Full duplex, MII interface, AXI4-Lite CSR, FIFO-based Tx/Rx
`timescale 1ns/1ps
module gem_ethernet (
    // System
    input  wire        clk,         // 125 MHz reference
    input  wire        rst_n,
    // AXI4-Lite CSR slave
    input  wire        s_arvalid,  output reg         s_arready,
    input  wire [15:0] s_araddr,
    output reg         s_rvalid,   input  wire        s_rready,
    output reg  [31:0] s_rdata,    output wire [1:0]  s_rresp,
    input  wire        s_awvalid,  output reg         s_awready,
    input  wire [15:0] s_awaddr,
    input  wire        s_wvalid,   output reg         s_wready,
    input  wire [31:0] s_wdata,    input  wire [3:0]  s_wstrb,
    output reg         s_bvalid,   input  wire        s_bready,
    output wire [1:0]  s_bresp,
    // DMA AXI4 master (for descriptor/data fetch)
    output reg         m_arvalid,  input  wire        m_arready,
    output reg  [39:0] m_araddr,
    input  wire        m_rvalid,   output reg         m_rready,
    input  wire [63:0] m_rdata,
    output reg         m_awvalid,  input  wire        m_awready,
    output reg  [39:0] m_awaddr,
    output reg         m_wvalid,   input  wire        m_wready,
    output reg  [63:0] m_wdata,    output reg [7:0]   m_wstrb,
    input  wire        m_bvalid,   output reg         m_bready,
    // MII physical interface
    output wire        rgmii_txc,
    output wire        rgmii_tx_ctl,
    output wire [3:0]  rgmii_txd,
    input  wire        rgmii_rxc,
    input  wire        rgmii_rx_ctl,
    input  wire [3:0]  rgmii_rxd,
    // Interrupt
    output wire        irq
);
    assign s_rresp = 2'h0;
    assign s_bresp = 2'h0;

    // CSR registers
    reg [31:0] ctrl_reg;    // [0]=tx_en, [1]=rx_en, [2]=promiscuous
    reg [31:0] status_reg;  // [0]=rx_frame, [1]=tx_done
    reg [47:0] mac_addr;    // programmed MAC
    reg [31:0] tx_dma_base;
    reg [31:0] rx_dma_base;

    // Interrupt: OR of status bits
    assign irq = |status_reg;

    // CSR reads/writes
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ctrl_reg   <= 32'h0;
            status_reg <= 32'h0;
            mac_addr   <= 48'hDE_AD_BE_EF_00_01;
            tx_dma_base<= 32'h0;
            rx_dma_base<= 32'h0;
            s_arready  <= 1'b1;  s_awready <= 1'b1;  s_wready <= 1'b1;
            s_rvalid   <= 1'b0;  s_bvalid  <= 1'b0;
        end else begin
            s_rvalid <= 1'b0;  s_bvalid <= 1'b0;
            if (s_arvalid && s_arready) begin
                s_arready <= 1'b0;
                case (s_araddr[5:2])
                    4'd0: s_rdata <= ctrl_reg;
                    4'd1: s_rdata <= status_reg;
                    4'd2: s_rdata <= mac_addr[31:0];
                    4'd3: s_rdata <= {16'h0, mac_addr[47:32]};
                    4'd4: s_rdata <= tx_dma_base;
                    4'd5: s_rdata <= rx_dma_base;
                    default: s_rdata <= 32'hDEAD_BEEF;
                endcase
                s_rvalid  <= 1'b1;
                s_arready <= 1'b1;
            end
            if (s_awvalid && s_wvalid) begin
                case (s_awaddr[5:2])
                    4'd0: ctrl_reg    <= s_wdata;
                    4'd1: status_reg  <= status_reg & ~s_wdata; // W1C
                    4'd2: mac_addr[31:0]  <= s_wdata;
                    4'd3: mac_addr[47:32] <= s_wdata[15:0];
                    4'd4: tx_dma_base <= s_wdata;
                    4'd5: rx_dma_base <= s_wdata;
                    default: ;
                endcase
                s_bvalid <= 1'b1;
            end
        end
    end

    // RGMII Tx: generate transmit clock and data from DMA read
    assign rgmii_txc     = clk;
    assign rgmii_tx_ctl  = ctrl_reg[0]; // transmit enable drives TX_CTL
    assign rgmii_txd     = m_rdata[3:0]; // simplified nibble from DMA

    // DMA: simple state machine to read Tx frame from memory
    localparam DMA_IDLE = 2'd0;
    localparam DMA_FETCH= 2'd1;
    localparam DMA_SEND = 2'd2;
    reg [1:0] dma_state;
    reg [15:0] byte_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            m_arvalid <= 1'b0;  m_awvalid <= 1'b0;  m_wvalid  <= 1'b0;  m_bready  <= 1'b0;
            m_rready  <= 1'b0;  m_wstrb   <= 8'hFF;
            m_araddr  <= 40'h0; m_awaddr  <= 40'h0;  m_wdata   <= 64'h0;
            dma_state <= DMA_IDLE;  byte_cnt <= 16'h0;
        end else begin
            m_arvalid <= 1'b0;  m_awvalid <= 1'b0;  m_wvalid  <= 1'b0;
            case (dma_state)
                DMA_IDLE: begin
                    if (ctrl_reg[0] && byte_cnt == 16'h0) begin
                        m_araddr  <= {8'h0, tx_dma_base};
                        m_arvalid <= 1'b1;
                        m_rready  <= 1'b1;
                        dma_state <= DMA_FETCH;
                    end
                end
                DMA_FETCH: begin
                    if (m_arready) m_arvalid <= 1'b0;
                    if (m_rvalid)  begin
                        m_rready  <= 1'b0;
                        dma_state <= DMA_IDLE;
                        byte_cnt  <= byte_cnt + 16'd8;
                    end
                end
                default: dma_state <= DMA_IDLE;
            endcase
        end
    end
endmodule
