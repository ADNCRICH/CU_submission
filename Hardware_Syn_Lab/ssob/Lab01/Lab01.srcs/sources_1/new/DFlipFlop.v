`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 10:05:35 PM
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
    always @(nreset) begin
        if (nreset == 0) begin
            q<=0;
        end
    end
    
    always @(posedge clock) begin
        if (nreset == 0) begin
            q<=0;
        end else begin
            q<=d;
        end
    end
endmodule
