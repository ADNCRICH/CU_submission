`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 01:57:55 PM
// Design Name: 
// Module Name: shiftRegister
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


module shiftRegister
#(
    parameter N=2
)
(
    output reg [N-1:0] q,
    input clock,
    input d
    );
    always @(posedge clock) begin
        q[0]<=d;
        q[N-1:1]<=q[N-2:0];
    end
endmodule
