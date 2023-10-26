`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 02:10:51 PM
// Design Name: 
// Module Name: Test
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


module Test(
    input wire en,load,clock,
    input wire [3:0] A,
    output wire [3:0] led
    );
    reg [30:0] cout;
    assign led = cout[30:27];
    always @(posedge clock) begin
        if(load == 1) begin
            cout[30:27] <= A;
        end else if(en == 1) begin
            cout <= cout + 1;
        end
    end
endmodule
