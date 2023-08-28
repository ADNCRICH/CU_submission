`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 12:37:45 PM
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop(q,clock,nreset,d);

output q;
input clock,nreset,d;
reg q;

always @(clock)
begin
    if(clock == 1 && nreset == 1)
        q = d;
end

always @(nreset)
begin
    if(nreset == 0)
        q = 0;
end

endmodule

