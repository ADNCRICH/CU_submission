`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 09:24:59 PM
// Design Name: 
// Module Name: alu_tester
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


module alu_tester(

    );
    wire z,Cout;
    reg Cin;
    wire [31:0] S;
    reg [31:0] A,B;
    reg [2:0] alu_ops;
    alu ALU(S,z,Cout,A,B,Cin,alu_ops);
    
    initial begin
        #0;
        A=18;
        B=10;
        Cin=1;
        alu_ops=0;
        #10;
        alu_ops=1;
        #10;
        alu_ops=2;
        #10;
        alu_ops=3;
        #10;
        alu_ops=4;
        #10;
        alu_ops=5;
        #10;
        alu_ops=6;
        #10;
        alu_ops=7;
        #10;
        $finish;
    end
endmodule
