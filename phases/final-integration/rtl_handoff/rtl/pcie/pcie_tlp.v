// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — PCIe Transaction Layer Packet Handler
// File: pcie/pcie_tlp.v
// AXI4: ADDR=40b, DATA=64b, ID=4b

module pcie_tlp (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         link_up,

    // -------------------------------------------------------------------------
    // AXI4 Slave Interface (from crossbar)
    // -------------------------------------------------------------------------
    // Write address channel
    input  wire         s_axi_awvalid,
    output reg          s_axi_awready,
    input  wire [39:0]  s_axi_awaddr,
    input  wire [3:0]   s_axi_awid,
    input  wire [7:0]   s_axi_awlen,
    input  wire [2:0]   s_axi_awsize,
    input  wire [1:0]   s_axi_awburst,
    // Write data channel
    input  wire         s_axi_wvalid,
    output reg          s_axi_wready,
    input  wire [63:0]  s_axi_wdata,
    input  wire [7:0]   s_axi_wstrb,
    input  wire         s_axi_wlast,
    // Write response channel
    output reg          s_axi_bvalid,
    input  wire         s_axi_bready,
    output reg  [3:0]   s_axi_bid,
    output reg  [1:0]   s_axi_bresp,
    // Read address channel
    input  wire         s_axi_arvalid,
    output reg          s_axi_arready,
    input  wire [39:0]  s_axi_araddr,
    input  wire [3:0]   s_axi_arid,
    input  wire [7:0]   s_axi_arlen,
    input  wire [2:0]   s_axi_arsize,
    input  wire [1:0]   s_axi_arburst,
    // Read data channel
    output reg          s_axi_rvalid,
    input  wire         s_axi_rready,
    output reg  [63:0]  s_axi_rdata,
    output reg  [3:0]   s_axi_rid,
    output reg  [1:0]   s_axi_rresp,
    output reg          s_axi_rlast,

    // -------------------------------------------------------------------------
    // DLL TX Interface
    // -------------------------------------------------------------------------
    output reg          tlp_valid,
    output reg  [31:0]  tlp_data,
    output reg          tlp_sof,
    output reg          tlp_eof,
    input  wire         tlp_ready,

    // -------------------------------------------------------------------------
    // DLL RX Interface
    // -------------------------------------------------------------------------
    input  wire         rx_tlp_valid,
    input  wire [31:0]  rx_tlp_data,
    input  wire         rx_tlp_sof,
    input  wire         rx_tlp_eof
);

    // -------------------------------------------------------------------------
    // TLP type constants
    // -------------------------------------------------------------------------
    // 7-bit format+type field (fmt[1:0], type[4:0])
    localparam [6:0] FMT_MEM_RD  = 7'b000_00000; // MRd32
    localparam [6:0] FMT_MEM_WR  = 7'b100_00000; // MWr32
    localparam [6:0] FMT_CPLD    = 7'b100_10100; // CplD

    // Requester ID (Bus=0, Dev=0, Func=0)
    localparam [15:0] REQUESTER_ID = 16'h0000;

    // -------------------------------------------------------------------------
    // TX State machine
    // -------------------------------------------------------------------------
    localparam [2:0] TX_IDLE      = 3'd0;
    localparam [2:0] TX_BUILD_HDR = 3'd1;
    localparam [2:0] TX_SEND_HDR  = 3'd2;
    localparam [2:0] TX_SEND_DATA = 3'd3;
    localparam [2:0] TX_WAIT_CPL  = 3'd4;

    reg [2:0]  tx_state;
    reg [7:0]  tx_tag;        // 8-bit TLP tag
    reg [39:0] tx_addr;
    reg [3:0]  tx_id;
    reg [7:0]  tx_len;        // burst length in DW
    reg [63:0] tx_wdata;
    reg [7:0]  tx_wstrb;
    reg        tx_is_write;
    reg [2:0]  tx_hdr_cnt;   // header word counter (0..2 for 3DW header)
    reg [7:0]  tx_data_cnt;
    reg [31:0] tx_hdr [0:2]; // built header words

    // -------------------------------------------------------------------------
    // RX State machine — parse incoming TLPs
    // -------------------------------------------------------------------------
    localparam [1:0] RX_IDLE    = 2'd0;
    localparam [1:0] RX_HDR     = 2'd1;
    localparam [1:0] RX_DATA    = 2'd2;

    reg [1:0]  rx_state;
    reg [31:0] rx_hdr0, rx_hdr1, rx_hdr2;
    reg [1:0]  rx_hdr_cnt;
    reg [6:0]  rx_fmt_type;
    reg [9:0]  rx_length;
    reg [15:0] rx_completer_id;
    reg [11:0] rx_byte_count;
    reg [63:0] rx_cpl_data;
    reg        rx_cpl_valid;
    reg [7:0]  rx_cpl_tag;

    // -------------------------------------------------------------------------
    // Pending read tag FIFO (depth 1 for simplicity)
    // -------------------------------------------------------------------------
    reg        pend_valid;
    reg [7:0]  pend_tag;
    reg [3:0]  pend_id;
    reg [7:0]  pend_len;

    // -------------------------------------------------------------------------
    // TX Path
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_state       <= TX_IDLE;
            tx_tag         <= 8'd0;
            tlp_valid      <= 1'b0;
            tlp_data       <= 32'd0;
            tlp_sof        <= 1'b0;
            tlp_eof        <= 1'b0;
            s_axi_awready  <= 1'b0;
            s_axi_wready   <= 1'b0;
            s_axi_arready  <= 1'b0;
            s_axi_bvalid   <= 1'b0;
            s_axi_bid      <= 4'd0;
            s_axi_bresp    <= 2'b00;
            pend_valid     <= 1'b0;
            pend_tag       <= 8'd0;
            pend_id        <= 4'd0;
            pend_len       <= 8'd0;
            tx_hdr_cnt     <= 3'd0;
            tx_data_cnt    <= 8'd0;
            tx_is_write    <= 1'b0;
            tx_addr        <= 40'd0;
            tx_id          <= 4'd0;
            tx_len         <= 8'd0;
            tx_wdata       <= 64'd0;
            tx_wstrb       <= 8'd0;
        end else begin
            tlp_valid    <= 1'b0;
            tlp_sof      <= 1'b0;
            tlp_eof      <= 1'b0;
            s_axi_awready<= 1'b0;
            s_axi_wready <= 1'b0;
            s_axi_arready<= 1'b0;

            case (tx_state)
                TX_IDLE: begin
                    if (!link_up) begin
                        // Stay idle
                    end else if (s_axi_awvalid && s_axi_wvalid) begin
                        // Capture write address + data
                        s_axi_awready <= 1'b1;
                        s_axi_wready  <= 1'b1;
                        tx_addr       <= s_axi_awaddr;
                        tx_id         <= s_axi_awid;
                        tx_len        <= s_axi_awlen;
                        tx_wdata      <= s_axi_wdata;
                        tx_wstrb      <= s_axi_wstrb;
                        tx_is_write   <= 1'b1;
                        tx_state      <= TX_BUILD_HDR;
                    end else if (s_axi_arvalid) begin
                        s_axi_arready <= 1'b1;
                        tx_addr       <= s_axi_araddr;
                        tx_id         <= s_axi_arid;
                        tx_len        <= s_axi_arlen;
                        tx_is_write   <= 1'b0;
                        tx_state      <= TX_BUILD_HDR;
                    end
                end

                TX_BUILD_HDR: begin
                    // 3DW header (32-bit address)
                    // DW0: [31:25]=fmt+type, [24]=T9, [23]=TC, [22:20]=attr,
                    //      [19]=T8, [18]=attr2, [17]=0, [16]=EP, [15:10]=length[9:0]
                    // Simplified: upper address bits ignored (use [31:0] of addr)
                    if (tx_is_write) begin
                        // MWr with 2-DW data payload
                        tx_hdr[0] <= {FMT_MEM_WR, 1'b0, 3'd0, 3'd0, 1'b0,
                                      1'b0, 1'b0, 1'b0, 10'd2}; // length=2DW
                        tx_hdr[1] <= {REQUESTER_ID, tx_tag, 4'hF, 4'hF};
                        tx_hdr[2] <= tx_addr[31:0];
                    end else begin
                        tx_hdr[0] <= {FMT_MEM_RD, 1'b0, 3'd0, 3'd0, 1'b0,
                                      1'b0, 1'b0, 1'b0, 10'd2};
                        tx_hdr[1] <= {REQUESTER_ID, tx_tag, 4'hF, 4'hF};
                        tx_hdr[2] <= tx_addr[31:0];
                    end
                    tx_hdr_cnt <= 3'd0;
                    tx_state   <= TX_SEND_HDR;
                end

                TX_SEND_HDR: begin
                    if (tlp_ready) begin
                        tlp_valid <= 1'b1;
                        tlp_data  <= tx_hdr[tx_hdr_cnt];
                        tlp_sof   <= (tx_hdr_cnt == 3'd0);
                        if (tx_hdr_cnt == 3'd2) begin
                            tlp_eof <= tx_is_write ? 1'b0 : 1'b1;
                            if (!tx_is_write) begin
                                // MRd: done after header
                                tx_state   <= TX_WAIT_CPL;
                                // Register pending read
                                pend_valid <= 1'b1;
                                pend_tag   <= tx_tag;
                                pend_id    <= tx_id;
                                pend_len   <= tx_len;
                                tx_tag     <= tx_tag + 8'd1;
                            end else begin
                                tx_data_cnt <= 8'd0;
                                tx_state    <= TX_SEND_DATA;
                            end
                        end
                        tx_hdr_cnt <= tx_hdr_cnt + 3'd1;
                    end
                end

                TX_SEND_DATA: begin
                    if (tlp_ready) begin
                        tlp_valid <= 1'b1;
                        tlp_eof   <= (tx_data_cnt == 8'd1); // 2DW payload
                        // Send 64-bit data as two 32-bit DWs
                        if (tx_data_cnt == 8'd0)
                            tlp_data <= tx_wdata[31:0];
                        else
                            tlp_data <= tx_wdata[63:32];
                        tx_data_cnt <= tx_data_cnt + 8'd1;
                        if (tx_data_cnt == 8'd1) begin
                            // Send write response
                            s_axi_bvalid <= 1'b1;
                            s_axi_bid    <= tx_id;
                            s_axi_bresp  <= 2'b00; // OKAY
                            tx_tag       <= tx_tag + 8'd1;
                            tx_state     <= TX_IDLE;
                        end
                    end
                    // Deassert bvalid when accepted
                    if (s_axi_bvalid && s_axi_bready)
                        s_axi_bvalid <= 1'b0;
                end

                TX_WAIT_CPL: begin
                    // Wait for completion to arrive from RX path
                    if (rx_cpl_valid && (rx_cpl_tag == pend_tag)) begin
                        pend_valid <= 1'b0;
                        tx_state   <= TX_IDLE;
                    end
                    if (s_axi_bvalid && s_axi_bready)
                        s_axi_bvalid <= 1'b0;
                end

                default: tx_state <= TX_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // RX Path — parse incoming CplD TLPs and drive AXI4 R channel
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_state      <= RX_IDLE;
            rx_hdr_cnt    <= 2'd0;
            rx_hdr0       <= 32'd0;
            rx_hdr1       <= 32'd0;
            rx_hdr2       <= 32'd0;
            rx_fmt_type   <= 7'd0;
            rx_cpl_valid  <= 1'b0;
            rx_cpl_tag    <= 8'd0;
            rx_cpl_data   <= 64'd0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= 64'd0;
            s_axi_rid     <= 4'd0;
            s_axi_rresp   <= 2'b00;
            s_axi_rlast   <= 1'b0;
        end else begin
            rx_cpl_valid <= 1'b0;

            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
                s_axi_rlast  <= 1'b0;
            end

            case (rx_state)
                RX_IDLE: begin
                    if (rx_tlp_valid && rx_tlp_sof) begin
                        rx_hdr0    <= rx_tlp_data;
                        rx_hdr_cnt <= 2'd1;
                        rx_state   <= RX_HDR;
                        rx_fmt_type<= rx_tlp_data[31:25];
                    end
                end

                RX_HDR: begin
                    if (rx_tlp_valid) begin
                        case (rx_hdr_cnt)
                            2'd1: rx_hdr1 <= rx_tlp_data;
                            2'd2: begin
                                rx_hdr2     <= rx_tlp_data;
                                rx_cpl_tag  <= rx_hdr1[15:8]; // tag from CplD hdr
                                // Check if it's a CplD
                                if (rx_fmt_type == FMT_CPLD)
                                    rx_state <= RX_DATA;
                                else if (rx_tlp_eof)
                                    rx_state <= RX_IDLE;
                            end
                            default: ;
                        endcase
                        rx_hdr_cnt <= rx_hdr_cnt + 2'd1;
                    end
                end

                RX_DATA: begin
                    if (rx_tlp_valid) begin
                        // Collect 64-bit data from two 32-bit DWs
                        if (!rx_cpl_valid) begin
                            rx_cpl_data[31:0] <= rx_tlp_data;
                        end else begin
                            rx_cpl_data[63:32] <= rx_tlp_data;
                        end
                        if (rx_tlp_eof) begin
                            // Present to AXI4 R channel
                            rx_cpl_valid <= 1'b1;
                            s_axi_rvalid <= 1'b1;
                            s_axi_rdata  <= {rx_tlp_data, rx_cpl_data[31:0]};
                            s_axi_rid    <= pend_id;
                            s_axi_rresp  <= 2'b00;
                            s_axi_rlast  <= 1'b1;
                            rx_state     <= RX_IDLE;
                        end
                    end
                end

                default: rx_state <= RX_IDLE;
            endcase
        end
    end

endmodule
