// SMVDU-TITAN-X — GPIO Peripheral Controller Stub
//
// Simple 32-bit General Purpose Input/Output (GPIO) controller.
//
// SPDX-License-Identifier: Apache-2.0

module titan_x_gpio (
    input  wire        clk,
    input  wire        rst_n,

    // TileLink/APB Register Bus Interface
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [7:0]  paddr,
    input  wire [31:0] pwdata,
    output reg  [31:0] prdata,
    output reg         pready,

    // External GPIO pad boundary
    inout  wire [31:0] gpio_pads,
    output reg  [31:0] gpio_irq
);

    // Register offsets
    localparam REG_DATA_IN   = 8'h00; // Read inputs
    localparam REG_DATA_OUT  = 8'h04; // Write outputs
    localparam REG_DIR       = 8'h08; // 1 = Output, 0 = Input
    localparam REG_INT_EN    = 8'h0C; // Interrupt enable
    localparam REG_INT_TYPE  = 8'h10; // Interrupt type (0=level, 1=edge)

    reg [31:0] reg_data_out;
    reg [31:0] reg_dir;
    reg [31:0] reg_int_en;
    reg [31:0] reg_int_type;

    // Pad driver logic
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: pad_drivers
            assign gpio_pads[i] = reg_dir[i] ? reg_data_out[i] : 1'bz;
        end
    endgenerate

    // APB Bus Access
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            reg_data_out <= 32'b0;
            reg_dir      <= 32'b0;
            reg_int_en   <= 32'b0;
            reg_int_type <= 32'b0;
            prdata       <= 32'b0;
            pready       <= 1'b0;
            gpio_irq     <= 32'b0;
        end else begin
            pready <= psel;
            if (psel && penable) begin
                if (pwrite) begin
                    case (paddr)
                        REG_DATA_OUT: reg_data_out <= pwdata;
                        REG_DIR:      reg_dir      <= pwdata;
                        REG_INT_EN:   reg_int_en   <= pwdata;
                        REG_INT_TYPE: reg_int_type <= pwdata;
                    endcase
                end else begin
                    case (paddr)
                        REG_DATA_IN:  prdata <= gpio_pads;
                        REG_DATA_OUT: prdata <= reg_data_out;
                        REG_DIR:      prdata <= reg_dir;
                        REG_INT_EN:   prdata <= reg_int_en;
                        REG_INT_TYPE: prdata <= reg_int_type;
                        default:      prdata <= 32'h0;
                    endcase
                end
            end
        end
    end

endmodule
