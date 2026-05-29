// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — USB 2.0 OTG ULPI Controller
// Synthesizable RTL — OSU018 180nm CMOS

module usb_ulpi_ctrl (
    // System clock & reset
    input  wire        clk,
    input  wire        rst_n,

    // APB Slave interface
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [11:0] paddr,
    input  wire [31:0] pwdata,
    output reg  [31:0] prdata,
    output wire        pready,

    // ULPI PHY interface
    input  wire        ulpi_clk,   // 60 MHz from PHY
    inout  wire [7:0]  ulpi_data,  // Bidirectional data bus
    input  wire        ulpi_dir,   // PHY drives when 1
    input  wire        ulpi_nxt,
    output wire        ulpi_stp,

    // Outputs
    output wire        usb_clk_out,
    output wire        usb_dir_out
);

    // -------------------------------------------------------------------------
    // Local parameters
    // -------------------------------------------------------------------------
    // USB state machine states
    localparam USB_IDLE          = 4'd0;
    localparam USB_RESET         = 4'd1;
    localparam USB_FS_DETECT     = 4'd2;
    localparam USB_CHIRP_K       = 4'd3;
    localparam USB_CHIRP_KJ      = 4'd4;
    localparam USB_HS_HANDSHAKE  = 4'd5;
    localparam USB_HS_ACTIVE     = 4'd6;
    localparam USB_FS_ACTIVE     = 4'd7;
    localparam USB_SUSPEND       = 4'd8;

    // ULPI TX state machine
    localparam ULPI_TX_IDLE      = 3'd0;
    localparam ULPI_TX_CMD       = 3'd1;
    localparam ULPI_TX_DATA      = 3'd2;
    localparam ULPI_TX_STP       = 3'd3;
    localparam ULPI_TX_WAIT      = 3'd4;

    // EP0 control endpoint state machine
    localparam EP0_IDLE          = 3'd0;
    localparam EP0_SETUP         = 3'd1;
    localparam EP0_DATA_IN       = 3'd2;
    localparam EP0_DATA_OUT      = 3'd3;
    localparam EP0_STATUS_IN     = 3'd4;
    localparam EP0_STATUS_OUT    = 3'd5;
    localparam EP0_STALL         = 3'd6;

    // PIDs
    localparam PID_SOF    = 8'hA5;
    localparam PID_SETUP  = 8'hB4;
    localparam PID_IN     = 8'h96;
    localparam PID_OUT    = 8'h87;
    localparam PID_DATA0  = 8'hC3;
    localparam PID_DATA1  = 8'h4B;
    localparam PID_ACK    = 8'h4B;
    localparam PID_NAK    = 8'h5A;

    // ULPI RX CMD / DATA nibble identifies
    localparam ULPI_RXCMD_NIBBLE = 4'b0100;
    localparam ULPI_RXDAT_NIBBLE = 4'b1111;

    // APB register addresses
    localparam ADDR_CTRL    = 12'h000;
    localparam ADDR_STATUS  = 12'h004;
    localparam ADDR_INT_EN  = 12'h008;
    localparam ADDR_INT_ST  = 12'h00C;
    localparam ADDR_ADDR    = 12'h010;  // USB device address
    localparam ADDR_PHYREG  = 12'h014;  // PHY register addr for write
    localparam ADDR_PHYDAT  = 12'h018;  // PHY register data for write
    localparam ADDR_EP0CTRL = 12'h01C;
    localparam ADDR_FRNUM   = 12'h020;
    localparam ADDR_LINESTAT= 12'h024;

    // -------------------------------------------------------------------------
    // ULPI data bus tristate
    // -------------------------------------------------------------------------
    reg  [7:0] ulpi_data_out;
    reg        ulpi_oe;   // 1 = drive bus (link drives), 0 = PHY drives
    assign ulpi_data = ulpi_oe ? ulpi_data_out : 8'bz;

    // -------------------------------------------------------------------------
    // Pass-through outputs
    // -------------------------------------------------------------------------
    assign usb_clk_out = ulpi_clk;
    assign usb_dir_out = ulpi_dir;

    // -------------------------------------------------------------------------
    // APB ready — single-cycle response
    // -------------------------------------------------------------------------
    assign pready = 1'b1;

    // -------------------------------------------------------------------------
    // Clock-domain crossing: APB (clk) → ULPI (ulpi_clk)
    // Use simple 2-FF synchroniser for control signals.
    // -------------------------------------------------------------------------
    // APB registers (clocked on clk)
    reg [31:0] reg_ctrl;
    reg [31:0] reg_status;
    reg [31:0] reg_int_en;
    reg [31:0] reg_int_st;
    reg [6:0]  reg_usb_addr;
    reg [5:0]  reg_phy_reg_addr;
    reg [7:0]  reg_phy_reg_data;
    reg        phy_reg_wr_req;
    reg [15:0] reg_frame_num;
    reg [7:0]  reg_line_stat;

    // Interrupt bits
    localparam INT_RESET     = 0;
    localparam INT_SOF       = 1;
    localparam INT_SETUP_RCV = 2;
    localparam INT_EP0_DONE  = 3;
    localparam INT_HS_DONE   = 4;

    // -------------------------------------------------------------------------
    // APB write
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_ctrl         <= 32'd0;
            reg_int_en       <= 32'd0;
            reg_int_st       <= 32'd0;
            reg_usb_addr     <= 7'd0;
            reg_phy_reg_addr <= 6'd0;
            reg_phy_reg_data <= 8'd0;
            phy_reg_wr_req   <= 1'b0;
        end else begin
            phy_reg_wr_req <= 1'b0;
            if (psel && penable && pwrite) begin
                case (paddr)
                    ADDR_CTRL:   reg_ctrl       <= pwdata;
                    ADDR_INT_EN: reg_int_en     <= pwdata;
                    ADDR_INT_ST: reg_int_st     <= reg_int_st & ~pwdata; // W1C
                    ADDR_ADDR:   reg_usb_addr   <= pwdata[6:0];
                    ADDR_PHYREG: reg_phy_reg_addr <= pwdata[5:0];
                    ADDR_PHYDAT: begin
                        reg_phy_reg_data <= pwdata[7:0];
                        phy_reg_wr_req   <= 1'b1;
                    end
                    default: ;
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // APB read
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prdata <= 32'd0;
        end else begin
            if (psel && !pwrite) begin
                case (paddr)
                    ADDR_CTRL:    prdata <= reg_ctrl;
                    ADDR_STATUS:  prdata <= reg_status;
                    ADDR_INT_EN:  prdata <= reg_int_en;
                    ADDR_INT_ST:  prdata <= reg_int_st;
                    ADDR_ADDR:    prdata <= {25'd0, reg_usb_addr};
                    ADDR_PHYREG:  prdata <= {26'd0, reg_phy_reg_addr};
                    ADDR_PHYDAT:  prdata <= {24'd0, reg_phy_reg_data};
                    ADDR_FRNUM:   prdata <= {16'd0, reg_frame_num};
                    ADDR_LINESTAT:prdata <= {24'd0, reg_line_stat};
                    default:      prdata <= 32'd0;
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // Synchronise APB→ULPI signals
    // -------------------------------------------------------------------------
    reg phy_reg_wr_req_s1, phy_reg_wr_req_s2;
    reg [5:0] phy_reg_addr_s;
    reg [7:0] phy_reg_data_s;

    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            phy_reg_wr_req_s1 <= 1'b0;
            phy_reg_wr_req_s2 <= 1'b0;
            phy_reg_addr_s    <= 6'd0;
            phy_reg_data_s    <= 8'd0;
        end else begin
            phy_reg_wr_req_s1 <= phy_reg_wr_req;
            phy_reg_wr_req_s2 <= phy_reg_wr_req_s1;
            if (phy_reg_wr_req_s1) begin
                phy_reg_addr_s <= reg_phy_reg_addr;
                phy_reg_data_s <= reg_phy_reg_data;
            end
        end
    end

    wire phy_reg_wr_pulse = phy_reg_wr_req_s1 & ~phy_reg_wr_req_s2;

    // -------------------------------------------------------------------------
    // ULPI TX state machine (runs on ulpi_clk)
    // -------------------------------------------------------------------------
    reg [2:0]  ulpi_tx_state;
    reg [7:0]  ulpi_tx_reg_addr;
    reg [7:0]  ulpi_tx_reg_data;
    reg        ulpi_tx_start;
    reg        ulpi_stp_r;

    assign ulpi_stp = ulpi_stp_r;

    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            ulpi_tx_state    <= ULPI_TX_IDLE;
            ulpi_data_out    <= 8'd0;
            ulpi_oe          <= 1'b0;
            ulpi_stp_r       <= 1'b0;
            ulpi_tx_reg_addr <= 8'd0;
            ulpi_tx_reg_data <= 8'd0;
            ulpi_tx_start    <= 1'b0;
        end else begin
            ulpi_stp_r    <= 1'b0;
            ulpi_tx_start <= 1'b0;

            if (phy_reg_wr_pulse) begin
                ulpi_tx_reg_addr <= {2'b10, phy_reg_addr_s};  // RegWrite cmd
                ulpi_tx_reg_data <= phy_reg_data_s;
                ulpi_tx_start    <= 1'b1;
            end

            case (ulpi_tx_state)
                ULPI_TX_IDLE: begin
                    ulpi_oe <= 1'b0;
                    if (ulpi_tx_start && !ulpi_dir) begin
                        ulpi_tx_state <= ULPI_TX_CMD;
                        ulpi_data_out <= ulpi_tx_reg_addr;
                        ulpi_oe       <= 1'b1;
                    end
                end

                ULPI_TX_CMD: begin
                    // Wait for NXT to acknowledge command byte
                    if (ulpi_nxt) begin
                        ulpi_tx_state <= ULPI_TX_DATA;
                        ulpi_data_out <= ulpi_tx_reg_data;
                    end
                end

                ULPI_TX_DATA: begin
                    if (ulpi_nxt) begin
                        ulpi_tx_state <= ULPI_TX_STP;
                        ulpi_data_out <= 8'd0;
                        ulpi_stp_r    <= 1'b1;
                    end
                end

                ULPI_TX_STP: begin
                    ulpi_stp_r    <= 1'b0;
                    ulpi_oe       <= 1'b0;
                    ulpi_tx_state <= ULPI_TX_WAIT;
                end

                ULPI_TX_WAIT: begin
                    ulpi_tx_state <= ULPI_TX_IDLE;
                end

                default: ulpi_tx_state <= ULPI_TX_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // ULPI RX: decode when PHY drives bus (ulpi_dir=1)
    // -------------------------------------------------------------------------
    reg [7:0]  rx_byte;
    reg        rx_cmd_valid;
    reg        rx_data_valid;
    reg [7:0]  rx_pid;
    reg        rx_pid_valid;
    reg [7:0]  rx_byte_count;

    // Sample ULPI bus
    reg [7:0]  ulpi_data_in_r;
    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            ulpi_data_in_r <= 8'd0;
            rx_cmd_valid   <= 1'b0;
            rx_data_valid  <= 1'b0;
            rx_pid_valid   <= 1'b0;
            rx_pid         <= 8'd0;
            rx_byte_count  <= 8'd0;
        end else begin
            rx_cmd_valid  <= 1'b0;
            rx_data_valid <= 1'b0;
            rx_pid_valid  <= 1'b0;

            if (ulpi_dir) begin
                ulpi_data_in_r <= ulpi_data;  // sample PHY-driven bus
                rx_byte        <= ulpi_data;

                if (ulpi_data[7:4] == ULPI_RXCMD_NIBBLE) begin
                    rx_cmd_valid  <= 1'b1;
                    rx_byte_count <= 8'd0;
                end else if (ulpi_data[7:4] == ULPI_RXDAT_NIBBLE || ulpi_nxt) begin
                    rx_data_valid <= 1'b1;
                    if (rx_byte_count == 8'd0) begin
                        rx_pid       <= ulpi_data;
                        rx_pid_valid <= 1'b1;
                    end
                    rx_byte_count <= rx_byte_count + 8'd1;
                end
            end else begin
                rx_byte_count <= 8'd0;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Token decoder
    // -------------------------------------------------------------------------
    reg token_sof;
    reg token_setup;
    reg token_in;
    reg token_out;
    reg token_data0;
    reg token_data1;
    reg token_ack;
    reg token_nak;

    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            token_sof   <= 1'b0;
            token_setup <= 1'b0;
            token_in    <= 1'b0;
            token_out   <= 1'b0;
            token_data0 <= 1'b0;
            token_data1 <= 1'b0;
            token_ack   <= 1'b0;
            token_nak   <= 1'b0;
        end else begin
            token_sof   <= 1'b0;
            token_setup <= 1'b0;
            token_in    <= 1'b0;
            token_out   <= 1'b0;
            token_data0 <= 1'b0;
            token_data1 <= 1'b0;
            token_ack   <= 1'b0;
            token_nak   <= 1'b0;

            if (rx_pid_valid) begin
                case (rx_pid)
                    PID_SOF:   token_sof   <= 1'b1;
                    PID_SETUP: token_setup <= 1'b1;
                    PID_IN:    token_in    <= 1'b1;
                    PID_OUT:   token_out   <= 1'b1;
                    PID_DATA0: token_data0 <= 1'b1;
                    PID_DATA1: token_data1 <= 1'b1;
                    // PID_ACK == PID_DATA1 by value; handle by context
                    PID_NAK:   token_nak   <= 1'b1;
                    default:   ;
                endcase
            end
        end
    end

    // -------------------------------------------------------------------------
    // USB state machine (runs on ulpi_clk)
    // -------------------------------------------------------------------------
    reg [3:0]  usb_state;
    reg [19:0] usb_timer;       // for reset/chirp timing
    reg [3:0]  chirp_count;

    localparam RESET_DURATION  = 20'd720000;  // 12ms @ 60MHz
    localparam CHIRP_K_DUR     = 20'd60000;   // 1ms
    localparam CHIRP_KJ_DUR    = 20'd12000;   // 200us per KJ pair

    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            usb_state   <= USB_IDLE;
            usb_timer   <= 20'd0;
            chirp_count <= 4'd0;
            reg_status  <= 32'd0;
        end else begin
            case (usb_state)
                USB_IDLE: begin
                    if (reg_ctrl[0]) begin  // EN bit
                        usb_state <= USB_RESET;
                        usb_timer <= RESET_DURATION;
                    end
                end

                USB_RESET: begin
                    reg_status[0] <= 1'b1; // in reset
                    if (usb_timer == 20'd0) begin
                        usb_state     <= USB_FS_DETECT;
                        reg_status[0] <= 1'b0;
                    end else begin
                        usb_timer <= usb_timer - 20'd1;
                    end
                end

                USB_FS_DETECT: begin
                    // Detect SE0 line state from RX CMD line status bits[1:0]
                    if (rx_cmd_valid) begin
                        if (rx_byte[1:0] == 2'b01) begin // J state = FS device
                            usb_state     <= USB_CHIRP_K;
                            usb_timer     <= CHIRP_K_DUR;
                            chirp_count   <= 4'd0;
                        end
                    end
                end

                USB_CHIRP_K: begin
                    // Send chirp K on USB bus
                    if (usb_timer == 20'd0) begin
                        usb_state   <= USB_CHIRP_KJ;
                        usb_timer   <= CHIRP_KJ_DUR;
                        chirp_count <= 4'd0;
                    end else begin
                        usb_timer <= usb_timer - 20'd1;
                    end
                end

                USB_CHIRP_KJ: begin
                    if (usb_timer == 20'd0) begin
                        chirp_count <= chirp_count + 4'd1;
                        usb_timer   <= CHIRP_KJ_DUR;
                        if (chirp_count >= 4'd5) begin
                            usb_state <= USB_HS_HANDSHAKE;
                        end
                    end else begin
                        usb_timer <= usb_timer - 20'd1;
                    end
                end

                USB_HS_HANDSHAKE: begin
                    // Chirp response from device
                    usb_state      <= USB_HS_ACTIVE;
                    reg_status[1]  <= 1'b1; // HS active
                end

                USB_HS_ACTIVE: begin
                    if (token_sof) begin
                        reg_frame_num <= reg_frame_num + 16'd1;
                    end
                    if (!reg_ctrl[0]) begin
                        usb_state     <= USB_IDLE;
                        reg_status[1] <= 1'b0;
                    end
                end

                USB_FS_ACTIVE: begin
                    if (token_sof) begin
                        reg_frame_num <= reg_frame_num + 16'd1;
                    end
                end

                USB_SUSPEND: begin
                    if (reg_ctrl[1]) begin  // Wake
                        usb_state <= USB_HS_ACTIVE;
                    end
                end

                default: usb_state <= USB_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Endpoint 0 (Control) State Machine
    // -------------------------------------------------------------------------
    reg [2:0]  ep0_state;
    reg [7:0]  ep0_setup_buf [0:7];  // 8-byte SETUP buffer
    reg [2:0]  ep0_setup_idx;
    reg        ep0_data_toggle;
    reg [3:0]  ep0_xfer_len;

    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            ep0_state       <= EP0_IDLE;
            ep0_setup_idx   <= 3'd0;
            ep0_data_toggle <= 1'b0;
            ep0_xfer_len    <= 4'd0;
            ep0_setup_buf[0] <= 8'd0;
            ep0_setup_buf[1] <= 8'd0;
            ep0_setup_buf[2] <= 8'd0;
            ep0_setup_buf[3] <= 8'd0;
            ep0_setup_buf[4] <= 8'd0;
            ep0_setup_buf[5] <= 8'd0;
            ep0_setup_buf[6] <= 8'd0;
            ep0_setup_buf[7] <= 8'd0;
        end else begin
            case (ep0_state)
                EP0_IDLE: begin
                    if (token_setup) begin
                        ep0_state     <= EP0_SETUP;
                        ep0_setup_idx <= 3'd0;
                    end
                end

                EP0_SETUP: begin
                    // Collect 8 bytes of SETUP data
                    if (rx_data_valid && rx_byte_count > 8'd0) begin
                        ep0_setup_buf[ep0_setup_idx] <= rx_byte;
                        ep0_setup_idx <= ep0_setup_idx + 3'd1;
                        if (ep0_setup_idx == 3'd7) begin
                            ep0_state       <= EP0_DATA_IN;
                            ep0_data_toggle <= 1'b1;
                        end
                    end
                    if (token_nak) begin
                        ep0_state <= EP0_IDLE;
                    end
                end

                EP0_DATA_IN: begin
                    // Transmit data phase
                    if (token_in) begin
                        ep0_state <= EP0_STATUS_OUT;
                    end
                end

                EP0_DATA_OUT: begin
                    if (rx_data_valid) begin
                        ep0_state <= EP0_STATUS_IN;
                    end
                end

                EP0_STATUS_IN: begin
                    // Zero-length IN packet
                    if (token_in) begin
                        ep0_state       <= EP0_IDLE;
                        ep0_data_toggle <= 1'b0;
                    end
                end

                EP0_STATUS_OUT: begin
                    // Zero-length OUT packet
                    if (token_out) begin
                        ep0_state       <= EP0_IDLE;
                        ep0_data_toggle <= 1'b0;
                    end
                end

                EP0_STALL: begin
                    // Send STALL, wait for new SETUP
                    if (token_setup) begin
                        ep0_state     <= EP0_SETUP;
                        ep0_setup_idx <= 3'd0;
                    end
                end

                default: ep0_state <= EP0_IDLE;
            endcase
        end
    end

    // -------------------------------------------------------------------------
    // Line status capture
    // -------------------------------------------------------------------------
    always @(posedge ulpi_clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_line_stat <= 8'd0;
        end else begin
            if (rx_cmd_valid) begin
                reg_line_stat <= rx_byte;
            end
        end
    end

    // -------------------------------------------------------------------------
    // Interrupt generation (clk domain)
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_int_st <= 32'd0;
        end else begin
            // W1C already handled in APB write block
            // Set interrupt bits from USB events (synchronised)
            if (reg_status[0]) reg_int_st[INT_RESET] <= reg_int_en[INT_RESET];
        end
    end

endmodule