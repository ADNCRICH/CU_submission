`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 10:19:29 PM
// Design Name: 
// Module Name: clkDiv
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


module clkDiv(
    input wire clock,
    output wire out
    );
    reg clk;
    reg [16:0] cou;
    
    assign out = clk;
    
    always@(posedge clock) begin
        clk = cou[16];
        cou = cou + 1;
    end
        
endmodule
