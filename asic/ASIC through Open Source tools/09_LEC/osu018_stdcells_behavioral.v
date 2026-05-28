// Clean Behavioral Verilog Models for OSU 180nm Standard Cells (for Formal LEC)
// Target PDK: CMOS 180nm (osu018)

module INVX1 (A, Y);
  input A;
  output Y;
  assign Y = ~A;
endmodule

module AND2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A & B;
endmodule

module NAND2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A & B);
endmodule

module NAND3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~(A & B & C);
endmodule

module NOR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A | B);
endmodule

module NOR3X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~(A | B | C);
endmodule

module OR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = A | B;
endmodule

module XNOR2X1 (A, B, Y);
  input A, B;
  output Y;
  assign Y = ~(A ^ B);
endmodule

module MUX2X1 (A, B, S, Y);
  input A, B, S;
  output Y;
  assign Y = S ? B : A;
endmodule

module AOI21X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~((A & B) | C);
endmodule

module AOI22X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = ~((A & B) | (C & D));
endmodule

module OAI21X1 (A, B, C, Y);
  input A, B, C;
  output Y;
  assign Y = ~((A | B) & C);
endmodule

module OAI22X1 (A, B, C, D, Y);
  input A, B, C, D;
  output Y;
  assign Y = ~((A | B) & (C | D));
endmodule

module DFFPOSX1 (CLK, D, Q);
  input CLK, D;
  output reg Q;
  always @(posedge CLK) begin
    Q <= D;
  end
endmodule

module DFFSR (CLK, D, R, S, Q);
  input CLK, D, R, S;
  output reg Q;
  always @(posedge CLK or negedge R or negedge S) begin
    if (!R)
      Q <= 1'b0;
    else if (!S)
      Q <= 1'b1;
    else
      Q <= D;
  end
endmodule
