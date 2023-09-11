`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 02:15:41 AM
// Design Name: 
// Module Name: problem3
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


module problem3(
    input wire up, down, btnu, btnc, sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7,clock,
    output wire [0:6] out,
    output reg [3:0] anode
    );

reg [3:0] a [0:3];
reg [3:0] num;
reg [3:0] cou;
reg [22:0] couu;
reg cout [0:3];
reg bout [0:3];
wire clk;
ClockDiv Clo(clock, clk);
problem1 C0(clk, sw0, sw1, btnu, btnc, a[0], cout[0], bout[0]);
problem1 C1(clk, sw2, sw3, btnu, btnc, a[1], cout[1], bout[1]);
problem1 C2(clk, sw4, sw5, btnu, btnc, a[2], cout[2], bout[2]);
problem1 C3(clk, sw6, sw7, btnu, btnc, a[3], cout[3], bout[3]);
Encoder e(num, out);
always @(posedge clock)
    begin
      couu = couu + 1;
      
      case(couu)
          //23'b00111111111111111111111 : begin
          1 << 21 : begin
            
          end
      endcase
    end

endmodule
