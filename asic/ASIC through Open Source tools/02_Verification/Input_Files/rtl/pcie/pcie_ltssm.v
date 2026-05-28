// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — PCIe Gen2 Link Training and Status State Machine
// File: pcie/pcie_ltssm.v

module pcie_ltssm #(
    parameter NUM_LANES = 4
) (
    input  wire                      clk,
    input  wire                      rst_n,
    // Lane receiver inputs
    input  wire [NUM_LANES-1:0]      rx_valid,
    input  wire [NUM_LANES*8-1:0]    rx_data,      // packed: lane N at bits [N*8+7:N*8]
    input  wire                      refclk_present,
    // Status outputs
    output reg  [4:0]                ltssm_state,
    output reg                       link_up,
    output reg  [1:0]                speed,         // 01=Gen1 10=Gen2
    output reg  [NUM_LANES-1:0]      lane_active,
    // TX to PHY
    output reg  [NUM_LANES*8-1:0]    tx_data,
    output reg  [NUM_LANES-1:0]      tx_valid
);

    // -------------------------------------------------------------------------
    // State encoding
    // -------------------------------------------------------------------------
    localparam [4:0] DETECT_QUIET          = 5'd0;
    localparam [4:0] DETECT_ACTIVE         = 5'd1;
    localparam [4:0] POLLING_ACTIVE        = 5'd2;
    localparam [4:0] POLLING_COMPLIANCE    = 5'd3;
    localparam [4:0] POLLING_SPEED         = 5'd4;
    localparam [4:0] POLLING_CONFIG        = 5'd5;
    localparam [4:0] CONFIG_LINKWIDTH_START= 5'd6;
    localparam [4:0] CONFIG_LINKWIDTH_ACCEPT=5'd7;
    localparam [4:0] CONFIG_LANENUM        = 5'd8;
    localparam [4:0] CONFIG_COMPLETE       = 5'd9;
    localparam [4:0] CONFIG_IDLE           = 5'd10;
    localparam [4:0] L0                    = 5'd11;

    // -------------------------------------------------------------------------
    // Timer thresholds (cycles @ 100 MHz assumption; adjust for actual clk)
    // 12 ms = 1,200,000 cycles ; 24 ms = 2,400,000 cycles
    // -------------------------------------------------------------------------
    localparam DETECT_TIMEOUT   = 24'd1200000;
    localparam POLLING_TIMEOUT  = 24'd2400000;
    localparam CONFIG_TIMEOUT   = 24'd2400000;

    // -------------------------------------------------------------------------
    // Ordered-set symbol constants (representative bytes)
    // -------------------------------------------------------------------------
    // TS1 ordered set identifier byte
    localparam [7:0] TS1_ID  = 8'h1E;
    // TS2 ordered set identifier byte
    localparam [7:0] TS2_ID  = 8'h2D;
    // IDLE symbol
    localparam [7:0] IDL_SYM = 8'h00;
    // EIOS symbol
    localparam [7:0] EIOS_SYM= 8'hFE;
    // COM symbol (K28.5)
    localparam [7:0] COM_SYM = 8'hBC;

    // -------------------------------------------------------------------------
    // Internal registers
    // -------------------------------------------------------------------------
    reg [4:0]  state, next_state;
    reg [23:0] timer;
    reg [7:0]  ts2_count;      // TS2 reception counter
    reg [7:0]  idle_count;     // IDLE reception counter
    reg [7:0]  ts1_sent;       // TS1 TX counter
    reg [7:0]  ts2_sent;       // TS2 TX counter
    reg        speed_neg_done; // speed negotiation flag
    reg [1:0]  cfg_lane_cnt;
    reg        compliance_entry;

    // Detect whether all lanes have valid receiver lock
    wire all_lanes_valid = &rx_valid;

    // Detect TS2 on lane 0 (simplified: check for TS2_ID after COM)
    wire rx_ts2_detected = (rx_valid[0] &&
                            (rx_data[7:0] == TS2_ID));
    wire rx_ts1_detected = (rx_valid[0] &&
                            (rx_data[7:0] == TS1_ID));
    wire rx_idle_detected= (rx_valid[0] &&
                            (rx_data[7:0] == IDL_SYM));

    // -------------------------------------------------------------------------
    // State register
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= DETECT_QUIET;
        else
            state <= next_state;
    end

    // -------------------------------------------------------------------------
    // Timer
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer <= 24'd0;
        end else if (state != next_state) begin
            timer <= 24'd0;
        end else begin
            if (timer != 24'hFFFFFF)
                timer <= timer + 24'd1;
        end
    end

    // -------------------------------------------------------------------------
    // TS1/TS2/IDLE reception counters
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ts2_count  <= 8'd0;
            idle_count <= 8'd0;
            ts1_sent   <= 8'd0;
            ts2_sent   <= 8'd0;
        end else if (state != next_state) begin
            ts2_count  <= 8'd0;
            idle_count <= 8'd0;
            ts1_sent   <= 8'd0;
            ts2_sent   <= 8'd0;
        end else begin
            if (rx_ts2_detected && (ts2_count != 8'hFF))
                ts2_count <= ts2_count + 8'd1;
            if (rx_idle_detected && (idle_count != 8'hFF))
                idle_count <= idle_count + 8'd1;
        end
    end

    // -------------------------------------------------------------------------
    // TX sent counters (increment each cycle we drive TX valid)
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ts1_sent <= 8'd0;
            ts2_sent <= 8'd0;
        end else if (state != next_state) begin
            ts1_sent <= 8'd0;
            ts2_sent <= 8'd0;
        end else begin
            if ((state == POLLING_ACTIVE) && (&tx_valid))
                ts1_sent <= (ts1_sent == 8'hFF) ? ts1_sent : ts1_sent + 8'd1;
            if ((state == POLLING_CONFIG || state == CONFIG_COMPLETE) && (&tx_valid))
                ts2_sent <= (ts2_sent == 8'hFF) ? ts2_sent : ts2_sent + 8'd1;
        end
    end

    // -------------------------------------------------------------------------
    // Speed negotiation / config lane registers
    // -------------------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            speed_neg_done <= 1'b0;
            cfg_lane_cnt   <= 2'd0;
            compliance_entry <= 1'b0;
        end else begin
            if (state == POLLING_SPEED)
                speed_neg_done <= 1'b1;
            if (state == CONFIG_LANENUM)
                cfg_lane_cnt <= 2'd(NUM_LANES-1);
            if (state == POLLING_ACTIVE && timer > 24'd100 && !all_lanes_valid)
                compliance_entry <= 1'b1;
            else if (state == DETECT_QUIET)
                compliance_entry <= 1'b0;
        end
    end

    // -------------------------------------------------------------------------
    // Next-state logic (combinational)
    // -------------------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            DETECT_QUIET: begin
                if (refclk_present)
                    next_state = DETECT_ACTIVE;
            end

            DETECT_ACTIVE: begin
                if (all_lanes_valid)
                    next_state = POLLING_ACTIVE;
                else if (timer >= DETECT_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            POLLING_ACTIVE: begin
                if (compliance_entry)
                    next_state = POLLING_COMPLIANCE;
                else if (ts2_count >= 8'd8)
                    next_state = POLLING_SPEED;
                else if (timer >= POLLING_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            POLLING_COMPLIANCE: begin
                // Stay in compliance until reset or link re-detected
                if (!all_lanes_valid && timer >= POLLING_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            POLLING_SPEED: begin
                // Speed negotiation: one-cycle handshake for simulation purposes
                next_state = POLLING_CONFIG;
            end

            POLLING_CONFIG: begin
                if (ts2_count >= 8'd8)
                    next_state = CONFIG_LINKWIDTH_START;
                else if (timer >= POLLING_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            CONFIG_LINKWIDTH_START: begin
                next_state = CONFIG_LINKWIDTH_ACCEPT;
            end

            CONFIG_LINKWIDTH_ACCEPT: begin
                next_state = CONFIG_LANENUM;
            end

            CONFIG_LANENUM: begin
                next_state = CONFIG_COMPLETE;
            end

            CONFIG_COMPLETE: begin
                if (ts2_count >= 8'd8)
                    next_state = CONFIG_IDLE;
                else if (timer >= CONFIG_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            CONFIG_IDLE: begin
                if (idle_count >= 8'd8)
                    next_state = L0;
                else if (timer >= CONFIG_TIMEOUT)
                    next_state = DETECT_QUIET;
            end

            L0: begin
                // Stay in L0; go back to DETECT_QUIET on loss of signal
                if (!all_lanes_valid)
                    next_state = DETECT_QUIET;
            end

            default: next_state = DETECT_QUIET;
        endcase
    end

    // -------------------------------------------------------------------------
    // Output logic (registered)
    // -------------------------------------------------------------------------
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ltssm_state  <= DETECT_QUIET;
            link_up      <= 1'b0;
            speed        <= 2'b01;  // default Gen1
            lane_active  <= {NUM_LANES{1'b0}};
            tx_data      <= {(NUM_LANES*8){1'b0}};
            tx_valid     <= {NUM_LANES{1'b0}};
        end else begin
            ltssm_state <= state;
            link_up     <= (state == L0) ? 1'b1 : 1'b0;

            case (state)
                DETECT_QUIET: begin
                    lane_active <= {NUM_LANES{1'b0}};
                    tx_valid    <= {NUM_LANES{1'b0}};
                    tx_data     <= {(NUM_LANES*8){1'b0}};
                end

                DETECT_ACTIVE: begin
                    // Drive EIOS on all lanes
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= EIOS_SYM;
                        tx_valid[i]       <= 1'b1;
                    end
                    lane_active <= {NUM_LANES{1'b0}};
                end

                POLLING_ACTIVE, POLLING_CONFIG: begin
                    // Drive TS1 ordered sets
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= TS1_ID;
                        tx_valid[i]       <= 1'b1;
                    end
                    lane_active <= rx_valid;
                end

                POLLING_COMPLIANCE: begin
                    // Compliance pattern
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= 8'hAA; // compliance pattern
                        tx_valid[i]       <= 1'b1;
                    end
                end

                POLLING_SPEED: begin
                    speed <= 2'b10; // Negotiate Gen2
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= TS2_ID;
                        tx_valid[i]       <= 1'b1;
                    end
                end

                CONFIG_LINKWIDTH_START,
                CONFIG_LINKWIDTH_ACCEPT,
                CONFIG_LANENUM,
                CONFIG_COMPLETE: begin
                    // Drive TS2 ordered sets
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= TS2_ID;
                        tx_valid[i]       <= 1'b1;
                    end
                    lane_active <= {NUM_LANES{1'b1}};
                end

                CONFIG_IDLE: begin
                    // Drive IDL symbols
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= IDL_SYM;
                        tx_valid[i]       <= 1'b1;
                    end
                    lane_active <= {NUM_LANES{1'b1}};
                end

                L0: begin
                    // Pass-through mode: forward RX data to TX (loopback model)
                    // In real design TX data comes from DLL
                    for (i = 0; i < NUM_LANES; i = i+1) begin
                        tx_data[i*8 +: 8] <= rx_data[i*8 +: 8];
                        tx_valid[i]       <= rx_valid[i];
                    end
                    lane_active <= {NUM_LANES{1'b1}};
                    link_up     <= 1'b1;
                end

                default: begin
                    tx_valid    <= {NUM_LANES{1'b0}};
                    tx_data     <= {(NUM_LANES*8){1'b0}};
                    lane_active <= {NUM_LANES{1'b0}};
                end
            endcase
        end
    end

endmodule
