`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 01:34:40 PM
// Design Name: 
// Module Name: shiftA
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


module shiftA(
    output reg [1:0] q,
    input clock,
    input d
    );
    always @(posedge clock) begin
        q[0]=d;
        q[1]=q[0];
    end
    
endmodule
