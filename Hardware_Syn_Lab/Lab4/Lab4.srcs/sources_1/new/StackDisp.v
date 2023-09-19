`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 12:58:29 PM
// Design Name: 
// Module Name: StackDisp
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


module StackDisp(
    output [0:6] seg7,
    output reg [3:0] anode,
    input [7:0] sw,
    input BTNU, BTNC, BTND, clock 
);
reg [21:0] cou;
wire [15:0] num;
reg [3:0] num7;
wire clk;

Encoder en(num7, seg7);
Stack st(num, sw, BTNU, BNTC, BTND, clock);
ClockDiv cd(clock, clk);

always@(posedge clock)begin
    case(cou[19:18])
          2'b00 : begin
              anode <= 4'b0111;
              num7 <= num[15:12];
          end
          2'b01 : begin
              anode <= 4'b1011;
              num7 <= num[11:8];
          end
          2'b10 : begin
              anode <= 4'b1101;
              num7 <= num[7:4];
          end
          2'b11 : begin
              anode <= 4'b1110;
              num7 <= num[3:0];
          end
        endcase
    cou = cou + 1;
end
endmodule
