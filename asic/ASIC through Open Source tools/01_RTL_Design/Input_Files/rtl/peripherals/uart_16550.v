// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — UART 16550-compatible
// Baud rate generator, Tx FIFO, Rx FIFO, interrupt output
`timescale 1ns/1ps
module uart_16550 (
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
    // Serial IO
    output wire        txd,
    input  wire        rxd,
    // Interrupt
    output wire        irq
);
    assign pready = 1'b1;

    // Registers
    reg [15:0] baud_div;    // divisor latch
    reg [7:0]  ier;         // interrupt enable
    reg [7:0]  lcr;         // line control
    reg [7:0]  mcr;         // modem control
    reg [7:0]  lsr;         // line status
    reg [7:0]  msr;         // modem status

    // TX/RX FIFOs
    reg [7:0]  tx_fifo [0:15];
    reg [3:0]  tx_wr, tx_rd;
    reg [4:0]  tx_cnt;
    reg [7:0]  rx_fifo [0:15];
    reg [3:0]  rx_wr, rx_rd;
    reg [4:0]  rx_cnt;

    wire tx_full  = (tx_cnt == 5'd16);
    wire tx_empty = (tx_cnt == 5'd0);
    wire rx_empty = (rx_cnt == 5'd0);

    // Baud rate counter
    reg [15:0] baud_cnt;
    wire baud_tick = (baud_cnt == 16'h0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) baud_cnt <= 16'h0;
        else if (baud_cnt == baud_div) baud_cnt <= 16'h0;
        else baud_cnt <= baud_cnt + 16'h1;
    end

    // Transmitter state machine
    reg [3:0]  tx_bit;
    reg [9:0]  tx_shift;  // start + 8 data + stop
    reg        tx_busy;
    reg        txd_r;
    assign txd = txd_r;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_bit   <= 4'h0;
            tx_shift <= 10'h3FF;
            tx_busy  <= 1'b0;
            txd_r    <= 1'b1;
            tx_wr    <= 4'h0;  tx_rd <= 4'h0;  tx_cnt <= 5'h0;
        end else begin
            if (!tx_empty && !tx_busy) begin
                tx_shift <= {1'b1, tx_fifo[tx_rd], 1'b0}; // stop, data, start
                tx_rd    <= tx_rd + 4'h1;
                tx_cnt   <= tx_cnt - 5'h1;
                tx_bit   <= 4'd10;
                tx_busy  <= 1'b1;
            end
            if (tx_busy && baud_tick) begin
                txd_r    <= tx_shift[0];
                tx_shift <= {1'b1, tx_shift[9:1]};
                tx_bit   <= tx_bit - 4'h1;
                if (tx_bit == 4'h1) tx_busy <= 1'b0;
            end
        end
    end

    // Receiver state machine (oversampled at 16x)
    reg [3:0] rx_bit;
    reg [7:0] rx_shift;
    reg       rx_busy;
    reg [3:0] rx_sample_cnt;
    reg       rxd_sync;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_bit        <= 4'h0;
            rx_shift      <= 8'h0;
            rx_busy       <= 1'b0;
            rx_sample_cnt <= 4'h0;
            rxd_sync      <= 1'b1;
            rx_wr         <= 4'h0;  rx_rd <= 4'h0;  rx_cnt <= 5'h0;
        end else begin
            rxd_sync <= rxd;
            if (!rx_busy && !rxd_sync) begin  // Start bit detected
                rx_busy       <= 1'b1;
                rx_bit        <= 4'd8;
                rx_sample_cnt <= 4'h7; // wait 0.5 bit
            end
            if (rx_busy && baud_tick) begin
                if (rx_sample_cnt == 4'h0) begin
                    rx_sample_cnt <= 4'hF;
                    rx_shift      <= {rxd_sync, rx_shift[7:1]};
                    rx_bit        <= rx_bit - 4'h1;
                    if (rx_bit == 4'h1) begin
                        if (rx_cnt < 5'd16) begin
                            rx_fifo[rx_wr] <= rx_shift;
                            rx_wr          <= rx_wr + 4'h1;
                            rx_cnt         <= rx_cnt + 5'h1;
                        end
                        rx_busy <= 1'b0;
                    end
                end else begin
                    rx_sample_cnt <= rx_sample_cnt - 4'h1;
                end
            end
        end
    end

    // LSR
    always @(*) begin
        lsr = 8'h0;
        lsr[0] = !rx_empty;   // DR: data ready
        lsr[5] = !tx_busy;    // THRE: TX holding register empty
        lsr[6] = !tx_busy && tx_empty; // TEMT: transmitter empty
    end

    assign irq = (ier[0] && lsr[0]) ||  // RDA interrupt
                 (ier[1] && lsr[5]);     // THRE interrupt

    // APB register access
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_div <= 16'd868; // 100MHz / 115200 baud
            ier  <= 8'h0;
            lcr  <= 8'h03;  // 8N1
            mcr  <= 8'h0;
            prdata <= 32'h0;
        end else if (psel && penable) begin
            if (pwrite) begin
                case (paddr)
                    4'h0: if (!lcr[7]) begin // THR
                        if (!tx_full) begin
                            tx_fifo[tx_wr] <= pwdata[7:0];
                            tx_wr  <= tx_wr + 4'h1;
                            tx_cnt <= tx_cnt + 5'h1;
                        end
                    end else begin // DLL
                        baud_div[7:0] <= pwdata[7:0];
                    end
                    4'h1: if (!lcr[7]) ier <= pwdata[7:0];
                          else baud_div[15:8] <= pwdata[7:0]; // DLM
                    4'h3: lcr <= pwdata[7:0];
                    4'h4: mcr <= pwdata[7:0];
                    default: ;
                endcase
            end else begin
                case (paddr)
                    4'h0: if (!lcr[7]) begin
                        if (!rx_empty) begin
                            prdata <= {24'h0, rx_fifo[rx_rd]};
                            rx_rd  <= rx_rd + 4'h1;
                            rx_cnt <= rx_cnt - 5'h1;
                        end else prdata <= 32'h0;
                    end else prdata <= {24'h0, baud_div[7:0]};
                    4'h1: if (!lcr[7]) prdata <= {24'h0, ier};
                          else prdata <= {24'h0, baud_div[15:8]};
                    4'h2: prdata <= 32'hC1;  // IIR: FIFO enabled, no interrupt
                    4'h3: prdata <= {24'h0, lcr};
                    4'h4: prdata <= {24'h0, mcr};
                    4'h5: prdata <= {24'h0, lsr};
                    4'h6: prdata <= {24'h0, msr};
                    default: prdata <= 32'h0;
                endcase
            end
        end
    end
endmodule
