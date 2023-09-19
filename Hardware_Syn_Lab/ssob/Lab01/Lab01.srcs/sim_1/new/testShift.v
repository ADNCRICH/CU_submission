`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 01:39:51 PM
// Design Name: 
// Module Name: testShift
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


module testShift(
    
    );
    wire [1:0] qA,qB;
    wire [9:0] qR;
    reg clock, d;
    shiftA A(qA, clock, d);
    shiftB B(qB, clock, d);
    shiftRegister #(10)R(qR, clock, d);
    
    always
        #10 clock=~clock;
    initial begin
    
        #0  d=0;
        clock=0;
        #1000
        $finish;
    end
    
    always
        #8 d=~d;
endmodule
