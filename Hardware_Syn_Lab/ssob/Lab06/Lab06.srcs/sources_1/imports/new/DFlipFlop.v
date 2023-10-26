`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 10:24:07 PM
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


module DFlipFlop(
    output reg q,
    input clock,
    input nreset,
    input d
    );
    
    initial begin
        q<=0;
    end
    
    always @(posedge clock or negedge nreset) begin
        if (nreset == 0) begin
            q<=0;
        end else begin
            q<=d;
        end
    end
endmodule
