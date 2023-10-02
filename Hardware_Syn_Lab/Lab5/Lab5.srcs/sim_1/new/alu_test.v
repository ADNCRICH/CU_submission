`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 10:09:35 PM
// Design Name: 
// Module Name: alu_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_test();
wire [31:0] S;
wire z, Cout;
reg [31:0] A;
reg [31:0] B;
reg Cin;
reg [2:0] ops;

alu aluTest(S, z, Cout, A, B, Cin, ops);
initial begin
    #0
    {A, B, Cin, ops} = 0;
    #20
    A = 20;
    B = 51;
    #20
    ops = 1;
    #20
    ops = 2;
    #20
    ops = 3;
    #20;
    ops = 4;
    #20;
    ops = 5;
    #20;
    ops = 6;
    #20;
    ops = 7;
    #20;
    
    $finish;
end
endmodule
