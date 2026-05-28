// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — 16550-Compatible UART with 16-deep TX/RX FIFOs
// Synthesizable RTL — SCL 180nm CMOS

module uart #(
    parameter DATA_BITS = 8
) (
    input  wire       clk,
    input  wire       rst_n,

    // APB Slave interface (8-bit data)
    input  wire       psel,
    input  wire       penable,
    input  wire       pwrite,
    input  wire [2:0] paddr,
    input  wire [7:0] pwdata,
    output reg  [7:0] prdata,
    output wire       pready,

    // Serial I/O
    output wire       uart_tx,
    input  wire       uart_rx,

    // Interrupt
    output wire       irq
);

    // -------------------------------------------------------------------------
    // Local parameters
    // -------------------------------------------------------------------------
    // APB register addresses
    localparam REG_RBR_THR = 3'd0; // RBR (read) / THR (write) / DLL (DLAB=1)
    localparam REG_IER     = 3'd1; // IER / DLM (DLAB=1)
    localparam REG_IIR_FCR = 3'd2; // IIR (read) / FCR (write)
    localparam REG_LCR     = 3'd3; // Line Control Register
    localparam REG_MCR     = 3'd4; // Modem Control Register
    localparam REG_LSR     = 3'd5; // Line Status Register
    localparam REG_MSR     = 3'd6; // Modem Status Register
    localparam REG_SCR     = 3'd7; // Scratch Register

    // TX/RX state
    localparam TX_IDLE  = 2'd0;
    localparam TX_START = 2'd1;
    localparam TX_DATA  = 2'd2;
    localparam TX_STOP  = 2'd3;

    localparam RX_IDLE  = 2'd0;
    localparam RX_START = 2'd1;
    localparam RX_DATA  = 2'd2;
    localparam RX_STOP  = 2'd3;

    // -------------------------------------------------------------------------
    // Internal registers
    // -------------------------------------------------------------------------
    reg [7:0] reg_ier;   // Interrupt Enable Register
    reg [7:0] reg_fcr;   // FIFO Control Register
    reg [7:0] reg_lcr;   // Line Control Register
    reg [7:0] reg_mcr;   // Modem Control Register
    reg [7:0] reg_msr;   // Modem Status Register
    reg [7:0] reg_scr;   // Scratch Register
    reg [7:0] reg_iir;   // Interrupt Identification Register

    // Divisor latch
    reg [7:0] reg_dll;   // Divisor Latch Low
    reg [7:0] reg_dlm;   // Divisor Latch High

    wire dlab = reg_lcr[7]; // Divisor Latch Access Bit

    // -------------------------------------------------------------------------
    // TX FIFO (16-deep, 8-bit)
    // -------------------------------------------------------------------------
    reg [7:0]  tx_fifo [0:15];
    reg [3:0]  tx_wr_ptr, tx_rd_ptr;
    reg [4:0]  tx_count;
    wire       tx_fifo_empty = (tx_count == 5'd0);
    wire       tx_fifo_full  = (tx_count == 5'd16);

    // TX FIFO push (from APB write to THR)
    reg        tx_push;
    reg [7:0]  tx_push_data;

    // TX FIFO pop (from TX shift register loading)
    reg        tx_pop;
    reg [7:0]  tx_fifo_data_out;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_wr_ptr <= 4'd0;
            tx_rd_ptr <= 4'd0;
            tx_count  <= 5'd0;
        end else begin
            if (tx_push && !tx_fifo_full) begin
                tx_fifo[tx_wr_ptr] <= tx_push_data;
                tx_wr_ptr          <= tx_wr_ptr + 4'd1;
            end
            if (tx_pop && !tx_fifo_empty) begin
                tx_fifo_data_out <= tx_fifo[tx_rd_ptr];
                tx_rd_ptr        <= tx_rd_ptr + 4'd1;
            end
            // Update count
            case ({tx_push && !tx_fifo_full, tx_pop && !tx_fifo_empty})
                2'b10:   tx_count <= tx_count + 5'd1;
                2'b01:   tx_count <= tx_count - 5'd1;
                default: tx_count <= tx_count;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // RX FIFO (16-deep, 8-bit)
    // -------------------------------------------------------------------------
    reg [7:0]  rx_fifo [0:15];
    reg [3:0]  rx_wr_ptr, rx_rd_ptr;
    reg [4:0]  rx_count;
    wire       rx_fifo_empty = (rx_count == 5'd0);
    wire       rx_fifo_full  = (rx_count == 5'd16);

    reg        rx_push;
    reg [7:0]  rx_push_data;
    reg        rx_pop;
    reg [7:0]  rx_fifo_data_out;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_wr_ptr <= 4'd0;
            rx_rd_ptr <= 4'd0;
            rx_count  <= 5'd0;
        end else begin
            if (rx_push && !rx_fifo_full) begin
                rx_fifo[rx_wr_ptr] <= rx_push_data;
                rx_wr_ptr          <= rx_wr_ptr + 4'd1;
            end
            if (rx_pop && !rx_fifo_empty) begin
                rx_fifo_data_out <= rx_fifo[rx_rd_ptr];
                rx_rd_ptr        <= rx_rd_ptr + 4'd1;
            end
            case ({rx_push && !rx_fifo_full, rx_pop && !rx_fifo_empty})
                2'b10:   rx_count <= rx_count + 5'd1;
                2'b01:   rx_count <= rx_count - 5'd1;
                default: rx_count <= rx_count;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Baud rate generator — 16x oversampling
    // -------------------------------------------------------------------------
    reg [15:0] baud_divisor;
    reg [15:0] baud_cnt;
    reg        baud_tick;    // 16x baud tick

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            baud_divisor <= 16'd0;
            baud_cnt     <= 16'd0;
            baud_tick    <= 1'b0;
        end else begin
            baud_divisor <= {reg_dlm, reg_dll};
            baud_tick    <= 1'b0;
            if (baud_divisor != 16'd0) begin
                if (baud_cnt == 16'd0) begin
                    baud_cnt  <= baud_divisor - 16'd1;
                    baud_tick <= 1'b1;
                end else begin
                    baud_cnt <= baud_cnt - 16'd1;
                end
            end
        end
    end

    // -------------------------------------------------------------------------
    // TX shift register and state machine
    // -------------------------------------------------------------------------
    reg [1:0]  tx_state;
    reg [7:0]  tx_shift;
    reg [3:0]  tx_bit_cnt;
    reg [3:0]  tx_baud_cnt;   // 16 ticks per bit
    reg        tx_reg;        // drives uart_tx

    assign uart_tx = tx_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_state    <= TX_IDLE;
            tx_shift    <= 8'hFF;
            tx_bit_cnt  <= 4'd0;
            tx_baud_cnt <= 4'd0;
            tx_reg      <= 1'b1;
            tx_pop      <= 1'b0;
        end else begin
            tx_pop <= 1'b0;

            case (tx_state)
                TX_IDLE: begin
                    tx_reg <= 1'b1;
                    if (!tx_fifo_empty) begin
                        tx_pop      <= 1'b1;
                        tx_state    <= TX_START;
                        tx_baud_cnt <= 4'd0;
                    end
                end

                TX_START: begin
                    // Load shift register one cycle after pop
                    tx_shift <= tx_fifo_data_out;
                    tx_reg   <= 1'b0; // start bit
                    if (baud_tick) begin
                        if (tx_baud_cnt == 4'd15) begin
                            tx_state    <= TX_DATA;
                            tx_bit_cnt  <= 4'd0;
                            tx_baud_cnt <= 4'd0;
                        end else begin
                            tx_baud_cnt <= tx_baud_cnt + 4'd1;
                        end
                    end
                end

                TX_DATA: begin
                    tx_reg <= tx_shift[0];
                    if (baud_tick) begin
                        if (tx_baud_cnt == 4'd15) begin
                            tx_shift    <= {1'b1, tx_shift[7:1]};
                            tx_baud_cnt <= 4'd0;
                            if (tx_bit_cnt == 4'd7) begin
                                tx_state <= TX_STOP;
                            end else begin
                                tx_bit_cnt <= tx_bit_cnt + 4'd1;
                            end
                        end else begin
                            tx_baud_cnt <= tx_baud_cnt + 4'd1;
                        end
                    end
                end

                TX_STOP: begin
                    tx_reg <= 1'b1; // stop bit
                    if (baud_tick) begin
                        if (tx_baud_cnt == 4'd15) begin
                            tx_baud_cnt <= 4'd0;
                            tx_state    <= TX_IDLE;
                        end else begin
                            tx_baud_cnt <= tx_baud_cnt + 4'd1;
                        end
                    end
                end

                default: tx_state <= TX_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // RX shift register and state machine
    // -------------------------------------------------------------------------
    reg [1:0]  rx_state;
    reg [7:0]  rx_shift;
    reg [3:0]  rx_bit_cnt;
    reg [3:0]  rx_baud_cnt;
    reg        uart_rx_r1, uart_rx_r2;  // synchroniser
    reg        rx_fe_det;               // falling-edge detect

    // 2-FF synchroniser for async uart_rx
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            uart_rx_r1 <= 1'b1;
            uart_rx_r2 <= 1'b1;
        end else begin
            uart_rx_r1 <= uart_rx;
            uart_rx_r2 <= uart_rx_r1;
        end
    end

    wire rx_start_det = (uart_rx_r2 == 1'b0); // line low = start bit

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_state    <= RX_IDLE;
            rx_shift    <= 8'd0;
            rx_bit_cnt  <= 4'd0;
            rx_baud_cnt <= 4'd0;
            rx_push     <= 1'b0;
            rx_push_data<= 8'd0;
        end else begin
            rx_push <= 1'b0;

            case (rx_state)
                RX_IDLE: begin
                    if (rx_start_det) begin
                        rx_state    <= RX_START;
                        rx_baud_cnt <= 4'd0;
                    end
                end

                RX_START: begin
                    // Sample at 8x (mid-point of start bit)
                    if (baud_tick) begin
                        if (rx_baud_cnt == 4'd7) begin
                            if (uart_rx_r2 == 1'b0) begin
                                // Valid start bit
                                rx_state    <= RX_DATA;
                                rx_bit_cnt  <= 4'd0;
                                rx_baud_cnt <= 4'd0;
                            end else begin
                                rx_state <= RX_IDLE; // False start
                            end
                        end else begin
                            rx_baud_cnt <= rx_baud_cnt + 4'd1;
                        end
                    end
                end

                RX_DATA: begin
                    if (baud_tick) begin
                        if (rx_baud_cnt == 4'd15) begin
                            rx_shift    <= {uart_rx_r2, rx_shift[7:1]};
                            rx_baud_cnt <= 4'd0;
                            if (rx_bit_cnt == 4'd7) begin
                                rx_state <= RX_STOP;
                            end else begin
                                rx_bit_cnt <= rx_bit_cnt + 4'd1;
                            end
                        end else begin
                            rx_baud_cnt <= rx_baud_cnt + 4'd1;
                        end
                    end
                end

                RX_STOP: begin
                    if (baud_tick) begin
                        if (rx_baud_cnt == 4'd15) begin
                            rx_baud_cnt  <= 4'd0;
                            rx_state     <= RX_IDLE;
                            rx_push      <= 1'b1;
                            rx_push_data <= rx_shift;
                        end else begin
                            rx_baud_cnt <= rx_baud_cnt + 4'd1;
                        end
                    end
                end

                default: rx_state <= RX_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Line Status Register
    // -------------------------------------------------------------------------
    wire [7:0] lsr_val;
    assign lsr_val[0] = ~rx_fifo_empty;        // Data Ready
    assign lsr_val[1] = 1'b0;                  // Overrun Error (simplified)
    assign lsr_val[2] = 1'b0;                  // Parity Error
    assign lsr_val[3] = 1'b0;                  // Framing Error
    assign lsr_val[4] = 1'b0;                  // Break Interrupt
    assign lsr_val[5] = tx_fifo_empty;         // THR Empty
    assign lsr_val[6] = tx_fifo_empty && (tx_state == TX_IDLE); // Transmitter Idle
    assign lsr_val[7] = 1'b0;                  // Error in RX FIFO

    // -------------------------------------------------------------------------
    // IIR generation
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_iir <= 8'h01; // No interrupt pending
        end else begin
            if (!rx_fifo_empty && reg_ier[0]) begin
                reg_iir <= 8'h04; // RX data available (priority 2)
            end else if (tx_fifo_empty && reg_ier[1]) begin
                reg_iir <= 8'h02; // TX holding register empty (priority 3)
            end else begin
                reg_iir <= 8'h01; // No interrupt
            end
        end
    end

    // -------------------------------------------------------------------------
    // Interrupt output
    // -------------------------------------------------------------------------
    assign irq = (~reg_iir[0]); // Active when bit0=0

    // -------------------------------------------------------------------------
    // APB ready
    // -------------------------------------------------------------------------
    assign pready = 1'b1;

    // -------------------------------------------------------------------------
    // APB write
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_ier <= 8'd0;
            reg_fcr <= 8'd0;
            reg_lcr <= 8'd0;
            reg_mcr <= 8'd0;
            reg_msr <= 8'd0;
            reg_scr <= 8'd0;
            reg_dll <= 8'd0;
            reg_dlm <= 8'd0;
            tx_push <= 1'b0;
            tx_push_data <= 8'd0;
        end else begin
            tx_push <= 1'b0;
            if (psel && penable && pwrite) begin
                case (paddr)
                    REG_RBR_THR: begin
                        if (dlab) begin
                            reg_dll <= pwdata;
                        end else begin
                            tx_push      <= 1'b1;
                            tx_push_data <= pwdata;
                        end
                    end
                    REG_IER: begin
                        if (dlab) begin
                            reg_dlm <= pwdata;
                        end else begin
                            reg_ier <= pwdata;
                        end
                    end
                    REG_IIR_FCR: reg_fcr <= pwdata;
                    REG_LCR:     reg_lcr <= pwdata;
                    REG_MCR:     reg_mcr <= pwdata;
                    REG_SCR:     reg_scr <= pwdata;
                    default: ;
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // APB read + RX FIFO pop
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prdata <= 8'd0;
            rx_pop <= 1'b0;
        end else begin
            rx_pop <= 1'b0;
            if (psel && !pwrite) begin
                case (paddr)
                    REG_RBR_THR: begin
                        if (dlab) begin
                            prdata <= reg_dll;
                        end else begin
                            prdata <= rx_fifo_data_out;
                            rx_pop <= 1'b1;
                        end
                    end
                    REG_IER:     prdata <= dlab ? reg_dlm : reg_ier;
                    REG_IIR_FCR: prdata <= reg_iir;
                    REG_LCR:     prdata <= reg_lcr;
                    REG_MCR:     prdata <= reg_mcr;
                    REG_LSR:     prdata <= lsr_val;
                    REG_MSR:     prdata <= reg_msr;
                    REG_SCR:     prdata <= reg_scr;
                    default:     prdata <= 8'd0;
                endcase
            end
        end
    end

endmodule
