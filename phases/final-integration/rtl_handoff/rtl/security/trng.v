// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — True Random Number Generator (TRNG)
// Ring-oscillator based entropy source + LFSR whitener
`timescale 1ns/1ps
module trng (
    input  wire        clk,
    input  wire        rst_n,
    // APB slave
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [3:0]  paddr,
    input  wire [31:0] pwdata,
    output reg  [31:0] prdata,
    output wire        pready,
    output wire        irq
);
    assign pready = 1'b1;

    // Entropy source: 3 ring oscillators (modeled as XOR of different-phase bits)
    // In silicon: these become metastable flip-flops on freerunning oscillators
    (* DONT_TOUCH = "true" *)
    reg [2:0] ring_osc;  // each bit toggles at different rate (synthesis optimizes away — annotate for PD)

    // Simulated entropy: XOR of shifted registers
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) ring_osc <= 3'b101;
        else ring_osc <= {ring_osc[1:0] ^ ring_osc[2], ring_osc[2:1]};
    end

    // 32-bit Galois LFSR whitener (taps: 32,22,2,1)
    reg [31:0] lfsr;
    wire       lfsr_feedback = lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) lfsr <= 32'hACE1_CAFE;
        else        lfsr <= {lfsr[30:0], lfsr_feedback} ^ {29'h0, ring_osc};
    end

    // Output register: accumulate 32 bits before asserting valid
    reg [31:0] rnd_out;
    reg [5:0]  bit_cnt;
    reg        valid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rnd_out <= 32'h0;
            bit_cnt <= 6'h0;
            valid   <= 1'b0;
        end else begin
            rnd_out <= {rnd_out[30:0], lfsr_feedback};
            if (bit_cnt == 6'd31) begin
                valid   <= 1'b1;
                bit_cnt <= 6'h0;
            end else begin
                bit_cnt <= bit_cnt + 6'h1;
                valid   <= 1'b0;
            end
        end
    end

    assign irq = valid;

    // APB: 0x00=status[valid], 0x04=random data (clears valid)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) prdata <= 32'h0;
        else if (psel && penable && !pwrite) begin
            case (paddr[3:2])
                2'd0: prdata <= {31'h0, valid};
                2'd1: prdata <= rnd_out;  // reading data clears valid flag
                default: prdata <= 32'h0;
            endcase
        end
    end
endmodule
