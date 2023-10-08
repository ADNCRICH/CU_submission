`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : alu.v
// Title        : ALU.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module alu(S,z,Cout,A,B,Cin,alu_ops);
output reg [31:0] S;
output z;
output reg Cout;
input [31:0] A;
input [31:0] B;
input Cin;
input [2:0] alu_ops;

assign z=~|S;

always @(A, B, alu_ops, Cin)
begin
	case (alu_ops)
	1: {Cout,S}=A-B;
	2: begin S=A|B; Cout=0; end
	3: begin S=A&B; Cout=0; end
	4: begin S=A^B; Cout=0; end
	5: begin S=-A; Cout=0; end
	6: begin S=~A; Cout=0; end
	7: begin S=~B; Cout=0; end
	default: {Cout,S}=A+B+Cin;	
	endcase
end

endmodule
