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
    output reg [0:6] out7, 
    output reg [3:0] cad
    );
    
    always @(S1)
    begin
      case (S1)
          4'b0001 : out7 = 7'b1111001;   // 1
          4'b0010 : out7 = 7'b0100100;   // 2
          4'b0011 : out7 = 7'b0110000;   // 3
          4'b0100 : out7 = 7'b0011001;   // 4
          4'b0101 : out7 = 7'b0010010;   // 5
          4'b0110 : out7 = 7'b0000010;   // 6
          4'b0111 : out7 = 7'b1111000;   // 7
          4'b1000 : out7 = 7'b0000000;   // 8
          4'b1001 : out7 = 7'b0010000;   // 9
          4'b1010 : out7 = 7'b0001000;   // A
          4'b1011 : out7 = 7'b0000011;   // b
          4'b1100 : out7 = 7'b1000110;   // C
          4'b1101 : out7 = 7'b0100001;   // d
          4'b1110 : out7 = 7'b0000110;   // E
          4'b1111 : out7 = 7'b0001110;   // F
          default : out7 = 7'b1000000;   // 0
      endcase
      cad = 4'b0111;
     
   end
endmodule
