`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 11:05:11 PM
// Design Name: 
// Module Name: problem1_sim
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


module problem1_sim;
reg clock, up, down, set9, set0;
wire [3:0] out;
wire cout, bout;

problem1 P1(clock, up, down, set9, set0, out, cout, bout);

always
    #10 clock =~ clock;
initial
begin
    #0 {clock, up, down, set9, set0} = 1;
    #20 set0 = 0;
    #405 up = 1;
    #805 {up, down} = 1;
    #1000;
    
end
endmodule
