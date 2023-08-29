`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 01:38:15 PM
// Design Name: 
// Module Name: shiftTest
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


module shiftTest;
reg clock, d;
wire [1:0] qA;
wire [1:0] qB;
shiftA SA(qA, clock, d);
shiftB SB(qB, clock, d);
always
    #10 clock=~clock;
initial
begin
    #0;
    clock = 0;
    d = 0;
    #100;
    d = 1;
    #125
    d = 0;
    #200;
end
endmodule
