// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — RV64I Execute / ALU Stage
`timescale 1ns/1ps
module rv_execute (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        stall,
    input  wire        flush,
    // From decode
    input  wire [63:0] pc_in,
    input  wire [63:0] rs1_data,
    input  wire [63:0] rs2_data,
    input  wire [63:0] imm,
    input  wire [4:0]  rd_in,
    input  wire [4:0]  rs1_addr,
    input  wire [4:0]  rs2_addr,
    input  wire [2:0]  funct3,
    input  wire [6:0]  opcode,
    input  wire [3:0]  alu_op,
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire        reg_write,
    input  wire        branch,
    input  wire        jal,
    input  wire        jalr,
    input  wire        valid_in,
    // Forwarding from MEM and WB
    input  wire [63:0] fwd_mem_data,
    input  wire        fwd_mem_valid,
    input  wire [4:0]  fwd_mem_rd,
    input  wire [63:0] fwd_wb_data,
    input  wire        fwd_wb_valid,
    input  wire [4:0]  fwd_wb_rd,
    // To MEM stage
    output reg  [63:0] alu_result,
    output reg  [63:0] rs2_out,
    output reg  [4:0]  rd_out,
    output reg  [2:0]  funct3_out,
    output reg  [6:0]  opcode_out,
    output reg         mem_read_out,
    output reg         mem_write_out,
    output reg         reg_write_out,
    output reg         valid_out,
    // Branch resolution (back to fetch)
    output reg         branch_taken,
    output reg  [63:0] branch_target
);
    // ALU op constants (must match rv_decode)
    localparam ALU_ADD  = 4'd0;
    localparam ALU_SUB  = 4'd1;
    localparam ALU_SLT  = 4'd2;
    localparam ALU_SLTU = 4'd3;
    localparam ALU_XOR  = 4'd4;
    localparam ALU_OR   = 4'd5;
    localparam ALU_AND  = 4'd6;
    localparam ALU_SLL  = 4'd7;
    localparam ALU_SRL  = 4'd8;
    localparam ALU_SRA  = 4'd9;
    localparam ALU_LUI  = 4'd10;
    localparam ALU_AUIPC= 4'd11;

    // Forwarding MUXes
    wire [63:0] src1 = (fwd_mem_valid && fwd_mem_rd == rs1_addr && rs1_addr != 5'h0) ? fwd_mem_data :
                       (fwd_wb_valid  && fwd_wb_rd  == rs1_addr && rs1_addr != 5'h0) ? fwd_wb_data  :
                       rs1_data;

    wire [63:0] src2_reg = (fwd_mem_valid && fwd_mem_rd == rs2_addr && rs2_addr != 5'h0) ? fwd_mem_data :
                           (fwd_wb_valid  && fwd_wb_rd  == rs2_addr && rs2_addr != 5'h0) ? fwd_wb_data  :
                           rs2_data;

    // ALU source B: immediate for I/S/B/U/J, register for R-type
    wire use_imm = (opcode == 7'b0010011) || (opcode == 7'b0000011) ||
                   (opcode == 7'b0100011) || (opcode == 7'b1100011) ||
                   (opcode == 7'b1101111) || (opcode == 7'b1100111) ||
                   (opcode == 7'b0110111) || (opcode == 7'b0010111) ||
                   (opcode == 7'b0011011);

    wire [63:0] src2 = use_imm ? imm : src2_reg;

    // ALU computation (combinational)
    reg [63:0] alu_res_comb;
    always @(*) begin
        case (alu_op)
            ALU_ADD:   alu_res_comb = src1 + src2;
            ALU_SUB:   alu_res_comb = src1 - src2;
            ALU_SLT:   alu_res_comb = ($signed(src1) < $signed(src2)) ? 64'd1 : 64'd0;
            ALU_SLTU:  alu_res_comb = (src1 < src2) ? 64'd1 : 64'd0;
            ALU_XOR:   alu_res_comb = src1 ^ src2;
            ALU_OR:    alu_res_comb = src1 | src2;
            ALU_AND:   alu_res_comb = src1 & src2;
            ALU_SLL:   alu_res_comb = src1 << src2[5:0];
            ALU_SRL:   alu_res_comb = src1 >> src2[5:0];
            ALU_SRA:   alu_res_comb = $signed(src1) >>> src2[5:0];
            ALU_LUI:   alu_res_comb = src2;              // LUI: rd = imm
            ALU_AUIPC: alu_res_comb = pc_in + src2;      // AUIPC: rd = pc + imm
            default:   alu_res_comb = src1 + src2;
        endcase
    end

    // Branch decision (combinational)
    reg branch_comb;
    always @(*) begin
        branch_comb = 1'b0;
        if (branch) begin
            case (funct3)
                3'b000: branch_comb = (src1 == src2_reg);                     // BEQ
                3'b001: branch_comb = (src1 != src2_reg);                     // BNE
                3'b100: branch_comb = ($signed(src1) < $signed(src2_reg));    // BLT
                3'b101: branch_comb = ($signed(src1) >= $signed(src2_reg));   // BGE
                3'b110: branch_comb = (src1 < src2_reg);                      // BLTU
                3'b111: branch_comb = (src1 >= src2_reg);                     // BGEU
                default: branch_comb = 1'b0;
            endcase
        end else if (jal) begin
            branch_comb = 1'b1;
        end else if (jalr) begin
            branch_comb = 1'b1;
        end
    end

    wire [63:0] branch_tgt = jalr ? ((src1 + imm) & ~64'd1) : (pc_in + imm);

    // Pipeline register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || flush) begin
            alu_result    <= 64'h0;
            rs2_out       <= 64'h0;
            rd_out        <= 5'h0;
            funct3_out    <= 3'h0;
            opcode_out    <= 7'h0;
            mem_read_out  <= 1'b0;
            mem_write_out <= 1'b0;
            reg_write_out <= 1'b0;
            valid_out     <= 1'b0;
            branch_taken  <= 1'b0;
            branch_target <= 64'h0;
        end else if (!stall) begin
            alu_result    <= (jal || jalr) ? (pc_in + 64'd4) : alu_res_comb;
            rs2_out       <= src2_reg;
            rd_out        <= rd_in;
            funct3_out    <= funct3;
            opcode_out    <= opcode;
            mem_read_out  <= mem_read;
            mem_write_out <= mem_write;
            reg_write_out <= reg_write;
            valid_out     <= valid_in;
            branch_taken  <= branch_comb && valid_in;
            branch_target <= branch_tgt;
        end
    end
endmodule
