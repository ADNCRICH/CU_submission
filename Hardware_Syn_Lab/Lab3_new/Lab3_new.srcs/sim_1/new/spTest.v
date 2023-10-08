`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 11:23:49 PM
// Design Name: 
// Module Name: spTest
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


module spTest();
reg in, clock;
wire out;
singlePulser P2(out, in, clock);
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
