`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 10:26:44 PM
// Design Name: 
// Module Name: HexToSeven
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


module HexToSeven(
    input wire [3:0] S1,
    input wire clock,
    output wire [0:6] out7, 
    output reg [3:0] cad
    );
    reg [3:0] cou;
    reg [3:0] cou3;
    reg [3:0] cou2;
    reg [3:0] cou1;
    reg [3:0] cou0;
    reg [22:0] couu;
    reg [1:0] num;
    Encoder e(cou,out7);
    clkDiv c(clock, clk);
    always @(posedge clock)
    begin
      couu = couu + 1;
      
      case(couu)
          23'b00111111111111111111111 : begin
              cou3 = (S1[3] == 1)? cou3 + 1 : cou3;
          end
          
          23'b01111111111111111111111 : begin
              cou2 = (S1[2] == 1)? cou2 + 1 : cou2;
          end
          
          23'b10111111111111111111111 : begin
              cou1 = (S1[1] == 1)? cou1 + 1 : cou1;
          end
          
          23'b11111111111111111111111 : begin
              cou0 = (S1[0] == 1)? cou0 + 1 : cou0;
          end
      endcase      
  end
      always@(posedge clk) begin
      num = num + 1;
      case(num)
          2'b00 : begin
              cad = 4'b0111;
              cou = cou3;
          end
          2'b01 : begin
              cad = 4'b1011;
              cou = cou2;
          end
          2'b10 : begin
              cad = 4'b1101;
              cou = cou1;
          end
          2'b11 : begin
              cad = 4'b1110;
              cou = cou0;
          end
       endcase
   end
endmodule
