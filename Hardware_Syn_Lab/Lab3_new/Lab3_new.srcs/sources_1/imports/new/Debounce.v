`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 03:20:13 PM
// Design Name: 
// Module Name: Debounce
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


module Debounce(
    input wire clock, d,
    output wire out
    );
reg q1,q2,q3,q4;
assign out = (d & q1 & q2 & q3 & q4);
always @(posedge clock)
begin
        q1 <= d;
        q2 <= q1;
        q3 <= q2;
        q4 <= q3;
end
endmodule
