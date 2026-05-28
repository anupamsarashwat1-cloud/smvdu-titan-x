// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — PCIe Data Link Layer
// File: pcie/pcie_dll.v
// Implements: TX sequencing, 4-entry replay buffer, DLLP ACK/NAK, CRC-32, DL states

module pcie_dll (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         link_up,

    // TLP interface from Transaction Layer
    input  wire         tlp_valid,
    input  wire [31:0]  tlp_data,
    input  wire         tlp_sof,
    input  wire         tlp_eof,
    output wire         tlp_ready,

    // Physical TX to LTSSM (serialised 32-bit words)
    output reg          phy_tx_valid,
    output reg  [31:0]  phy_tx_data,

    // Physical RX from LTSSM
    input  wire         phy_rx_valid,
    input  wire [31:0]  phy_rx_data,

    // DLL status
    output reg          ack_valid,
    output reg          nak_valid,
    output reg  [11:0]  seq_num
);

    // -------------------------------------------------------------------------
    // DL State machine
    // -------------------------------------------------------------------------
    localparam [1:0] DL_INACTIVE = 2'd0;
    localparam [1:0] DL_INIT     = 2'd1;
    localparam [1:0] DL_ACTIVE   = 2'd2;

    reg [1:0] dl_state;

    // -------------------------------------------------------------------------
    // TX sequencer
    // -------------------------------------------------------------------------
    reg [11:0] tx_seq_num;     // next sequence number to assign
    reg [11:0] ack_seq_ptr;    // last ACKed sequence number

    // -------------------------------------------------------------------------
    // Replay buffer: 4 entries, each 128 bytes = 32 × 32-bit words
    // Stored as packed: [ENTRY][WORD] => 4 × 32 × 32-bit = 4096 bits
    // -------------------------------------------------------------------------
    localparam REPLAY_DEPTH    = 4;
    localparam REPLAY_WORDS    = 32;       // 128 bytes / 4
    localparam REPLAY_PTR_W    = 2;        // log2(4)
    localparam REPLAY_WORD_W   = 5;        // log2(32)

    reg [31:0] replay_buf [0:REPLAY_DEPTH-1][0:REPLAY_WORDS-1];
    reg [11:0] replay_seq [0:REPLAY_DEPTH-1]; // sequence num for each entry
    reg [4:0]  replay_len [0:REPLAY_DEPTH-1]; // word count for each entry
    reg [1:0]  replay_wr_ptr;
    reg [1:0]  replay_rd_ptr;
    reg        replay_valid [0:REPLAY_DEPTH-1];

    // -------------------------------------------------------------------------
    // TX state machine
    // -------------------------------------------------------------------------
    localparam [2:0] TX_IDLE    = 3'd0;
    localparam [2:0] TX_SEQ_HDR = 3'd1;
    localparam [2:0] TX_TLP_FWD = 3'd2;
    localparam [2:0] TX_LCRC    = 3'd3;
    localparam [2:0] TX_DLLP    = 3'd4;
    localparam [2:0] TX_REPLAY  = 3'd5;

    reg [2:0]  tx_state;
    reg [4:0]  tx_word_cnt;
    reg [31:0] lcrc_accum;
    reg [1:0]  replay_active;      // index of entry being replayed
    reg        replay_request;
    reg [11:0] nak_seq_received;

    // -------------------------------------------------------------------------
    // TLP ready: accept from TL when in IDLE and DL_ACTIVE
    // -------------------------------------------------------------------------
    assign tlp_ready = (dl_state == DL_ACTIVE) && (tx_state == TX_IDLE);

    // -------------------------------------------------------------------------
    // CRC-32 — standard IEEE 802.3 polynomial 0xEDB88320 (reflected)
    // Iterative per-bit version (synthesis-friendly)
    // -------------------------------------------------------------------------
    function [31:0] crc32_byte;
        input [31:0] crc_in;
        input [7:0]  data_in;
        reg [31:0]   crc;
        integer      j;
        begin
            crc = crc_in ^ {24'h0, data_in};
            for (j = 0; j < 8; j = j+1) begin
                if (crc[0])
                    crc = (crc >> 1) ^ 32'hEDB88320;
                else
                    crc = crc >> 1;
            end
            crc32_byte = crc;
        end
    endfunction

    // -------------------------------------------------------------------------
    // CRC-32 over 32-bit word (4 bytes, LSB first)
    // -------------------------------------------------------------------------
    function [31:0] crc32_word;
        input [31:0] crc_in;
        input [31:0] data_in;
        reg [31:0]   c;
        begin
            c = crc32_byte(crc_in,    data_in[7:0]);
            c = crc32_byte(c,         data_in[15:8]);
            c = crc32_byte(c,         data_in[23:16]);
            c = crc32_byte(c,         data_in[31:24]);
            crc32_word = c;
        end
    endfunction

    // -------------------------------------------------------------------------
    // DL state transitions
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            dl_state <= DL_INACTIVE;
        else begin
            case (dl_state)
                DL_INACTIVE: if (link_up)   dl_state <= DL_INIT;
                DL_INIT:     if (link_up)   dl_state <= DL_ACTIVE;
                             // In real PCIe: send FC DLLPs; here simplified
                DL_ACTIVE:   if (!link_up)  dl_state <= DL_INACTIVE;
                default:                    dl_state <= DL_INACTIVE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // RX DLLP parser — detect ACK or NAK DLLPs
    // DLLP format word: [31:24]=type, [23:12]=reserved, [11:0]=seq_num
    // ACK type = 8'h00, NAK type = 8'h10
    // -------------------------------------------------------------------------
    wire rx_is_ack  = phy_rx_valid && (phy_rx_data[31:24] == 8'h00);
    wire rx_is_nak  = phy_rx_valid && (phy_rx_data[31:24] == 8'h10);
    wire [11:0] rx_dllp_seq = phy_rx_data[11:0];

    // -------------------------------------------------------------------------
    // TX state machine
    // -------------------------------------------------------------------------
    integer i, j;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_state        <= TX_IDLE;
            tx_word_cnt     <= 5'd0;
            tx_seq_num      <= 12'd0;
            ack_seq_ptr     <= 12'd0;
            lcrc_accum      <= 32'hFFFFFFFF;
            phy_tx_valid    <= 1'b0;
            phy_tx_data     <= 32'd0;
            ack_valid       <= 1'b0;
            nak_valid       <= 1'b0;
            seq_num         <= 12'd0;
            replay_wr_ptr   <= 2'd0;
            replay_rd_ptr   <= 2'd0;
            replay_request  <= 1'b0;
            nak_seq_received<= 12'd0;
            replay_active   <= 2'd0;
            for (i = 0; i < REPLAY_DEPTH; i = i+1) begin
                replay_valid[i] <= 1'b0;
                replay_seq[i]   <= 12'd0;
                replay_len[i]   <= 5'd0;
            end
        end else begin
            ack_valid    <= 1'b0;
            nak_valid    <= 1'b0;
            phy_tx_valid <= 1'b0;

            // ---- Handle incoming ACK/NAK ----
            if (rx_is_ack && dl_state == DL_ACTIVE) begin
                ack_valid   <= 1'b1;
                seq_num     <= rx_dllp_seq;
                ack_seq_ptr <= rx_dllp_seq;
                // Free replay buffer entries up to acked seq
                for (i = 0; i < REPLAY_DEPTH; i = i+1) begin
                    if (replay_valid[i] &&
                        (replay_seq[i] <= rx_dllp_seq))
                        replay_valid[i] <= 1'b0;
                end
            end

            if (rx_is_nak && dl_state == DL_ACTIVE) begin
                nak_valid        <= 1'b1;
                seq_num          <= rx_dllp_seq;
                nak_seq_received <= rx_dllp_seq;
                replay_request   <= 1'b1;
                // Find replay entry
                for (i = 0; i < REPLAY_DEPTH; i = i+1) begin
                    if (replay_valid[i] && (replay_seq[i] == rx_dllp_seq))
                        replay_active <= i[1:0];
                end
            end

            case (tx_state)
                TX_IDLE: begin
                    if (dl_state != DL_ACTIVE) begin
                        tx_state <= TX_IDLE;
                    end else if (replay_request) begin
                        // Initiate replay
                        replay_request <= 1'b0;
                        tx_word_cnt    <= 5'd0;
                        tx_state       <= TX_REPLAY;
                    end else if (tlp_valid && tlp_sof) begin
                        // Sequence header: [31:28]=4'h0, [27:16]=seq, [15:0]=lower
                        phy_tx_data  <= {4'h0, tx_seq_num, 16'h0000};
                        phy_tx_valid <= 1'b1;
                        lcrc_accum   <= 32'hFFFFFFFF;
                        lcrc_accum   <= crc32_word(32'hFFFFFFFF,
                                                   {4'h0, tx_seq_num, 16'h0000});
                        // Store in replay buffer
                        replay_seq[replay_wr_ptr]   <= tx_seq_num;
                        replay_valid[replay_wr_ptr] <= 1'b1;
                        replay_len[replay_wr_ptr]   <= 5'd0;
                        replay_buf[replay_wr_ptr][0] <= {4'h0, tx_seq_num, 16'h0000};
                        tx_word_cnt <= 5'd1;
                        tx_state    <= TX_TLP_FWD;
                    end
                end

                TX_TLP_FWD: begin
                    if (tlp_valid) begin
                        phy_tx_data  <= tlp_data;
                        phy_tx_valid <= 1'b1;
                        lcrc_accum   <= crc32_word(lcrc_accum, tlp_data);
                        // Store in replay buffer
                        if (tx_word_cnt < REPLAY_WORDS) begin
                            replay_buf[replay_wr_ptr][tx_word_cnt] <= tlp_data;
                            replay_len[replay_wr_ptr]              <= tx_word_cnt;
                        end
                        tx_word_cnt <= tx_word_cnt + 5'd1;

                        if (tlp_eof) begin
                            tx_state <= TX_LCRC;
                        end
                    end
                end

                TX_LCRC: begin
                    // Append inverted LCRC
                    phy_tx_data  <= ~lcrc_accum;
                    phy_tx_valid <= 1'b1;
                    tx_seq_num   <= tx_seq_num + 12'd1;
                    replay_wr_ptr<= replay_wr_ptr + 2'd1;
                    tx_state     <= TX_IDLE;
                end

                TX_REPLAY: begin
                    // Retransmit stored TLP words
                    phy_tx_data  <= replay_buf[replay_active][tx_word_cnt];
                    phy_tx_valid <= 1'b1;
                    tx_word_cnt  <= tx_word_cnt + 5'd1;
                    if (tx_word_cnt >= replay_len[replay_active])
                        tx_state <= TX_IDLE;
                end

                default: tx_state <= TX_IDLE;
            endcase

            // ---- Generate ACK DLLP for received TLP ----
            // ACK DLLP: type=8'h00, [11:0]=seq
            if (phy_rx_valid && dl_state == DL_ACTIVE && !rx_is_ack && !rx_is_nak) begin
                // Echo ACK for received data
                // (In real PCIe this is delayed; simplified here)
                if (tx_state == TX_IDLE) begin
                    phy_tx_data  <= {8'h00, 12'd0, phy_rx_data[11:0]};
                    phy_tx_valid <= 1'b1;
                end
            end
        end
    end

endmodule
