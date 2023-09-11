`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 01:52:31 AM
// Design Name: 
// Module Name: problem2_sim
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


module problem2_sim;
reg in, clock;
wire out;
problem2 P2(in, clock, out);
always
    #5 clock = ~clock;
initial
begin
    #0 {in, clock} = 0;
    #17 in = 1;
    #100 in = 0;
    #15 in = 1;
    #5 in = 0;
    #20;
end
endmodule
