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
    reg [30:0] cou;
    
    assign out = clk;
    
    initial clk = 0;
    
    always@(posedge clock) begin
        cou = cou + 1;
        if(cou == 25000000) begin
            clk = 1 - clk;
            cou = 0;
        end
    end
        
endmodule
