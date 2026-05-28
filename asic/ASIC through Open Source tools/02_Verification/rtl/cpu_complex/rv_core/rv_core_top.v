// SPDX-License-Identifier: Apache-2.0
// SMVDU-TITAN-X SoC — RV64I 5-Stage Pipeline Core Top
`timescale 1ns/1ps
module rv_core_top #(
    parameter HART_ID  = 0,
    parameter RESET_PC = 64'h0000_0000_8000_0000
) (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        irq_m_ext,   // External IRQ from PLIC
    // AXI4-Lite Instruction Memory Master (AR/R only)
    output wire [39:0] imem_araddr,
    output wire        imem_arvalid,
    input  wire        imem_arready,
    input  wire [63:0] imem_rdata,
    input  wire        imem_rvalid,
    input  wire [1:0]  imem_rresp,
    // AXI4-Lite Data Memory Master (full channels)
    output wire        dmem_awvalid,
    input  wire        dmem_awready,
    output wire [39:0] dmem_awaddr,
    output wire        dmem_wvalid,
    input  wire        dmem_wready,
    output wire [63:0] dmem_wdata,
    output wire [7:0]  dmem_wstrb,
    input  wire        dmem_bvalid,
    output wire        dmem_bready,
    output wire        dmem_arvalid,
    input  wire        dmem_arready,
    output wire [39:0] dmem_araddr,
    input  wire        dmem_rvalid,
    output wire        dmem_rready,
    input  wire [63:0] dmem_rdata,
    input  wire [1:0]  dmem_rresp,
    // Status
    output wire        hart_active
);
    // Internal wires between stages
    wire        stall, flush_fe, flush_de;
    wire [63:0] branch_target;
    wire        branch_taken;

    // Fetch → Decode
    wire [63:0] fe_pc, fe_instr_pad;
    wire [31:0] fe_instr;
    wire        fe_valid;

    // Decode → Execute
    wire [63:0] de_pc, de_rs1, de_rs2, de_imm;
    wire [4:0]  de_rd, de_rs1a, de_rs2a;
    wire [2:0]  de_f3;
    wire [6:0]  de_f7, de_op;
    wire [3:0]  de_aluop;
    wire        de_memr, de_memw, de_regw, de_branch, de_jal, de_jalr, de_valid;

    // Execute → Memory
    wire [63:0] ex_alures, ex_rs2;
    wire [4:0]  ex_rd;
    wire [2:0]  ex_f3;
    wire [6:0]  ex_op;
    wire        ex_memr, ex_memw, ex_regw, ex_valid;

    // Memory → Writeback
    wire [63:0] mem_result;
    wire [4:0]  mem_rd;
    wire        mem_regw, mem_valid;

    // Forwarding
    wire [63:0] fwd_mem_data, fwd_wb_data;
    wire [4:0]  fwd_mem_rd,   fwd_wb_rd;
    wire        fwd_mem_valid, fwd_wb_valid;

    // Writeback
    wire [63:0] wb_data;
    wire [4:0]  wb_rd;
    wire        wb_we;

    // Hazard: load-use stall
    assign stall    = ex_memr && ((ex_rd == de_rs1a) || (ex_rd == de_rs2a)) && ex_valid;
    assign flush_fe = branch_taken;
    assign flush_de = branch_taken || stall;

    // Instruction memory — adapt 64-bit RDATA to 32-bit instruction
    wire [31:0] imem_instr = imem_rdata[31:0];

    rv_fetch #(.RESET_PC(RESET_PC)) u_fetch (
        .clk           (clk),
        .rst_n         (rst_n),
        .stall         (stall),
        .flush         (flush_fe),
        .branch_taken  (branch_taken),
        .branch_target (branch_target),
        .imem_addr     (fe_instr_pad),   // 64-bit internal, map to 40-bit
        .imem_arvalid  (imem_arvalid),
        .imem_arready  (imem_arready),
        .imem_rdata    (imem_instr),
        .imem_rvalid   (imem_rvalid),
        .imem_rresp    (imem_rresp),
        .pc_out        (fe_pc),
        .instr_out     (fe_instr),
        .valid_out     (fe_valid)
    );
    assign imem_araddr = fe_instr_pad[39:0];

    rv_decode u_decode (
        .clk       (clk),         .rst_n    (rst_n),
        .stall     (stall),       .flush    (flush_de),
        .pc_in     (fe_pc),       .instr_in (fe_instr),    .valid_in (fe_valid),
        .wb_rd     (wb_rd),       .wb_data  (wb_data),     .wb_we    (wb_we),
        .pc_out    (de_pc),       .rs1_data (de_rs1),      .rs2_data (de_rs2),
        .imm       (de_imm),      .rd       (de_rd),
        .rs1_addr  (de_rs1a),     .rs2_addr (de_rs2a),
        .funct3    (de_f3),       .funct7   (de_f7),       .opcode   (de_op),
        .alu_op    (de_aluop),    .mem_read (de_memr),     .mem_write(de_memw),
        .reg_write (de_regw),     .branch   (de_branch),   .jal      (de_jal),
        .jalr      (de_jalr),     .valid_out(de_valid)
    );

    rv_execute u_execute (
        .clk          (clk),        .rst_n        (rst_n),
        .stall        (stall),      .flush        (flush_de),
        .pc_in        (de_pc),      .rs1_data     (de_rs1),    .rs2_data    (de_rs2),
        .imm          (de_imm),     .rd_in        (de_rd),
        .rs1_addr     (de_rs1a),    .rs2_addr     (de_rs2a),
        .funct3       (de_f3),      .opcode       (de_op),     .alu_op      (de_aluop),
        .mem_read     (de_memr),    .mem_write    (de_memw),   .reg_write   (de_regw),
        .branch       (de_branch),  .jal          (de_jal),    .jalr        (de_jalr),
        .valid_in     (de_valid),
        .fwd_mem_data (fwd_mem_data), .fwd_mem_valid(fwd_mem_valid), .fwd_mem_rd(fwd_mem_rd),
        .fwd_wb_data  (fwd_wb_data),  .fwd_wb_valid (fwd_wb_valid),  .fwd_wb_rd (fwd_wb_rd),
        .alu_result   (ex_alures),    .rs2_out      (ex_rs2),
        .rd_out       (ex_rd),        .funct3_out   (ex_f3),        .opcode_out  (ex_op),
        .mem_read_out (ex_memr),      .mem_write_out(ex_memw),      .reg_write_out(ex_regw),
        .valid_out    (ex_valid),
        .branch_taken (branch_taken), .branch_target(branch_target)
    );

    wire mem_stall_unused;
    rv_mem u_mem (
        .clk          (clk),        .rst_n        (rst_n),       .flush      (flush_de),
        .alu_result   (ex_alures),  .rs2_data     (ex_rs2),      .rd_in      (ex_rd),
        .funct3       (ex_f3),      .opcode       (ex_op),
        .mem_read     (ex_memr),    .mem_write    (ex_memw),     .reg_write  (ex_regw),
        .valid_in     (ex_valid),
        .dmem_awvalid (dmem_awvalid), .dmem_awready(dmem_awready), .dmem_awaddr(dmem_awaddr),
        .dmem_wvalid  (dmem_wvalid),  .dmem_wready (dmem_wready),  .dmem_wdata (dmem_wdata),
        .dmem_wstrb   (dmem_wstrb),   .dmem_bvalid (dmem_bvalid),  .dmem_bready(dmem_bready),
        .dmem_arvalid (dmem_arvalid), .dmem_arready(dmem_arready), .dmem_araddr(dmem_araddr),
        .dmem_rvalid  (dmem_rvalid),  .dmem_rready (dmem_rready),  .dmem_rdata (dmem_rdata),
        .dmem_rresp   (dmem_rresp),
        .result       (mem_result), .rd_out       (mem_rd),      .reg_write_out(mem_regw),
        .valid_out    (mem_valid),
        .fwd_mem_data (fwd_mem_data), .fwd_mem_rd  (fwd_mem_rd), .fwd_mem_valid(fwd_mem_valid),
        .mem_stall    (mem_stall_unused)
    );

    rv_writeback u_wb (
        .clk        (clk),       .rst_n     (rst_n),
        .result     (mem_result), .rd_in    (mem_rd),
        .reg_write  (mem_regw),  .valid_in  (mem_valid),
        .wb_data    (wb_data),   .wb_rd     (wb_rd),       .wb_we      (wb_we),
        .fwd_wb_data(fwd_wb_data), .fwd_wb_rd(fwd_wb_rd), .fwd_wb_valid(fwd_wb_valid)
    );

    assign hart_active = 1'b1;
endmodule
