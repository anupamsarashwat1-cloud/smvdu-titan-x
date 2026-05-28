// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — PCIe PIPE PHY Interface
// File: pcie/pcie_phy_if.v
// LFSR polynomial: x^16 + x^15 + x^13 + x^4 + 1

module pcie_phy_if #(
    parameter NUM_LANES = 4
) (
    input  wire                    clk,
    input  wire                    rst_n,
    // TX from LTSSM/DLL
    input  wire [NUM_LANES*8-1:0]  tx_data,
    input  wire [NUM_LANES-1:0]    tx_valid,
    input  wire [NUM_LANES-1:0]    tx_elec_idle,
    // RX to LTSSM/DLL
    output reg  [NUM_LANES*8-1:0]  rx_data,
    output reg  [NUM_LANES-1:0]    rx_valid,
    output wire [NUM_LANES-1:0]    rx_elec_idle,
    // Physical differential I/O
    output wire [NUM_LANES-1:0]    pcie_tx_p,
    output wire [NUM_LANES-1:0]    pcie_tx_n,
    input  wire [NUM_LANES-1:0]    pcie_rx_p,
    input  wire [NUM_LANES-1:0]    pcie_rx_n
);

    // -------------------------------------------------------------------------
    // Per-lane LFSR state registers (16-bit)
    // Polynomial: x^16+x^15+x^13+x^4+1 → feedback at bits 15,14,12,3
    // -------------------------------------------------------------------------
    reg [15:0] tx_lfsr [0:NUM_LANES-1];
    reg [15:0] rx_lfsr [0:NUM_LANES-1];

    // -------------------------------------------------------------------------
    // Scrambled TX data and raw RX data
    // -------------------------------------------------------------------------
    reg [NUM_LANES*8-1:0] tx_scrambled;
    reg [NUM_LANES*8-1:0] rx_raw;

    // -------------------------------------------------------------------------
    // RX electrical idle detection: if both p and n are low → idle
    // -------------------------------------------------------------------------
    genvar gi;
    generate
        for (gi = 0; gi < NUM_LANES; gi = gi+1) begin : rx_idle_gen
            assign rx_elec_idle[gi] = (~pcie_rx_p[gi] & ~pcie_rx_n[gi]);
        end
    endgenerate

    // -------------------------------------------------------------------------
    // TX differential output
    // When tx_elec_idle: drive Z on both (tri-state for simulation)
    // Otherwise: tx_p = tx_valid bit (serial data representation),
    //            tx_n = complement
    // -------------------------------------------------------------------------
    generate
        for (gi = 0; gi < NUM_LANES; gi = gi+1) begin : tx_diff_gen
            assign pcie_tx_p[gi] = tx_elec_idle[gi] ? 1'bz : tx_valid[gi];
            assign pcie_tx_n[gi] = tx_elec_idle[gi] ? 1'bz : ~tx_valid[gi];
        end
    endgenerate

    // -------------------------------------------------------------------------
    // LFSR feedback function (inline)
    // new_bit = lfsr[15] ^ lfsr[14] ^ lfsr[12] ^ lfsr[3]
    // Shift left, insert new_bit at position 0
    // -------------------------------------------------------------------------
    function [15:0] lfsr_next;
        input [15:0] lfsr_in;
        reg         fb;
        begin
            fb       = lfsr_in[15] ^ lfsr_in[14] ^ lfsr_in[12] ^ lfsr_in[3];
            lfsr_next = {lfsr_in[14:0], fb};
        end
    endfunction

    // -------------------------------------------------------------------------
    // Scramble 8 bits using 8 LFSR steps
    // -------------------------------------------------------------------------
    function [7:0] scramble_byte;
        input [7:0]  data_in;
        input [15:0] lfsr_in;
        integer      k;
        begin
            scramble_byte = data_in ^ lfsr_in[7:0];
        end
    endfunction

    // -------------------------------------------------------------------------
    // TX LFSR update and scrambling
    // -------------------------------------------------------------------------
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < NUM_LANES; i = i+1) begin
                tx_lfsr[i]             <= 16'hFFFF;
                tx_scrambled[i*8 +: 8] <= 8'h00;
            end
        end else begin
            for (i = 0; i < NUM_LANES; i = i+1) begin
                if (tx_valid[i] && !tx_elec_idle[i]) begin
                    // XOR data byte with low 8 bits of LFSR
                    tx_scrambled[i*8 +: 8] <= tx_data[i*8 +: 8] ^ tx_lfsr[i][7:0];
                    // Advance LFSR by 8 steps (pipelined approximation: advance once)
                    tx_lfsr[i]             <= lfsr_next(lfsr_next(lfsr_next(lfsr_next(
                                             lfsr_next(lfsr_next(lfsr_next(lfsr_next(
                                             tx_lfsr[i]))))))));
                end else begin
                    tx_scrambled[i*8 +: 8] <= tx_data[i*8 +: 8];
                end
            end
        end
    end

    // -------------------------------------------------------------------------
    // RX lane sampling: capture differential pair, deserialise to byte
    // Simplified model: sample pcie_rx_p, de-scramble with RX LFSR
    // -------------------------------------------------------------------------
    reg [NUM_LANES-1:0] rx_p_sync;
    reg [7:0]           rx_sr   [0:NUM_LANES-1]; // shift register
    reg [3:0]           rx_bcnt [0:NUM_LANES-1]; // bit counter
    reg [NUM_LANES-1:0] rx_byte_rdy;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < NUM_LANES; i = i+1) begin
                rx_p_sync[i]   <= 1'b0;
                rx_sr[i]       <= 8'h00;
                rx_bcnt[i]     <= 4'd0;
                rx_byte_rdy[i] <= 1'b0;
                rx_lfsr[i]     <= 16'hFFFF;
            end
        end else begin
            for (i = 0; i < NUM_LANES; i = i+1) begin
                rx_p_sync[i] <= pcie_rx_p[i] ^ pcie_rx_n[i]; // differential decode
                rx_byte_rdy[i] <= 1'b0;

                if (!rx_elec_idle[i]) begin
                    // Shift in bit MSB first
                    rx_sr[i]   <= {rx_sr[i][6:0], rx_p_sync[i]};
                    rx_bcnt[i] <= rx_bcnt[i] + 4'd1;
                    if (rx_bcnt[i] == 4'd7) begin
                        rx_byte_rdy[i] <= 1'b1;
                        rx_bcnt[i]     <= 4'd0;
                    end
                end else begin
                    rx_bcnt[i] <= 4'd0;
                end
            end
        end
    end

    // -------------------------------------------------------------------------
    // De-scramble RX bytes and present to DLL
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_data  <= {(NUM_LANES*8){1'b0}};
            rx_valid <= {NUM_LANES{1'b0}};
            for (i = 0; i < NUM_LANES; i = i+1)
                rx_lfsr[i] <= 16'hFFFF;
        end else begin
            for (i = 0; i < NUM_LANES; i = i+1) begin
                if (rx_byte_rdy[i]) begin
                    // De-scramble: XOR with same LFSR state
                    rx_data[i*8 +: 8] <= rx_sr[i] ^ rx_lfsr[i][7:0];
                    rx_lfsr[i]        <= lfsr_next(lfsr_next(lfsr_next(lfsr_next(
                                         lfsr_next(lfsr_next(lfsr_next(lfsr_next(
                                         rx_lfsr[i]))))))));
                    rx_valid[i]       <= 1'b1;
                end else begin
                    rx_valid[i] <= 1'b0;
                end
            end
        end
    end

endmodule
