`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:48:53 PM
// Design Name: 
// Module Name: problem1
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


module problem1(
    input wire clock, up, down, set9, set0,
    output reg [3:0] out,
    output reg cout, bout
    );
    
always@(posedge clock)begin
    out = ((up && !down)? out + 1 : (!up && down)? out - 1 : out);
    out = (out == 10)? 0:out;
    out = (out == 15)? 9:out;
    out = ((set0 && !set9)? 0:(!set0 && set9)? 9 : out);
end
endmodule
