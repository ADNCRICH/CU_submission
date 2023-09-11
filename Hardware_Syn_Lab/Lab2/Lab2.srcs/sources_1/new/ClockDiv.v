`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 10:21:45 AM
// Design Name: 
// Module Name: ClockDiv
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


module ClockDiv(
    input wire clock,
    output reg clk
    );
    reg [1:0] cou;
    
    always@(posedge clock)
    begin
        cou <= cou + 1;
        case(cou)
            2'b00 : clk <= ~clk;
        endcase
    end
    
    
endmodule
