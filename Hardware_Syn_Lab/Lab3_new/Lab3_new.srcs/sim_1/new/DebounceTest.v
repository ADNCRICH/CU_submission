`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 11:10:28 PM
// Design Name: 
// Module Name: DebounceTest
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


module DebounceTest();
reg in, clock;
wire out;
Debounce P2(clock, in, out);
always
    #5 clock = ~clock;
initial
begin
    #0 {in, clock} = 0;
    #17 in = 1;
    #300 in = 0;
    #15 in = 1;
    #5 in = 0;
    #20;
end
endmodule
