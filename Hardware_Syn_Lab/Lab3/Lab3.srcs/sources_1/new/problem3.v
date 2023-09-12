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
    input wire btnu, btnc, sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7,clock,
    output wire [0:6] out,
    output reg [3:0] anode
    );

wire [3:0] a [0:3];
reg [3:0] num;
reg [3:0] cou;
reg [22:0] couu;
wire [0:3] cout;
wire [0:3] bout;
wire clk;
wire [0:3] up;
wire [0:3] down;
reg [0:3] upp;
reg [0:3] downn;
wire [0:7] sw;
ClockDiv Clo(clock, clk);
problem1 C0(clk, upp[0], downn[0], btnu, btnc, a[0], cout[0], bout[0]);
problem1 C1(clk, upp[1], downn[1], btnu, btnc, a[1], cout[1], bout[1]);
problem1 C2(clk, upp[2], downn[2], btnu, btnc, a[2], cout[2], bout[2]);
problem1 C3(clk, upp[3], downn[3], btnu, btnc, a[3], cout[3], bout[3]);
problem2 P00(sw[0], clk, up[0]);
problem2 P10(sw[2], clk, up[1]);
problem2 P20(sw[4], clk, up[2]);
problem2 P30(sw[6], clk, up[3]);
problem2 P01(sw[1], clk, down[0]);
problem2 P11(sw[3], clk, down[1]);
problem2 P21(sw[5], clk, down[2]);
problem2 P31(sw[7], clk, down[3]);
Debounce D0(clk, sw0, sw[0]);
Debounce D1(clk, sw1, sw[1]);
Debounce D2(clk, sw2, sw[2]);
Debounce D3(clk, sw3, sw[3]);
Debounce D4(clk, sw4, sw[4]);
Debounce D5(clk, sw5, sw[5]);
Debounce D6(clk, sw6, sw[6]);
Debounce D7(clk, sw7, sw[7]);
Encoder e(num, out);
always @(posedge clock)
    begin
      upp[0:2] = up[0:2] | cout[1:3];
      upp[3] = up[3];
      downn[0:2] = down[0:2] | bout[1:3];
      downn[3] = down[3];
      
      upp[0] = ((a[0] == 9)? 0 : upp[0]);
      upp[1] = ((a[0] == 9 && a[1] == 9)? 0 : upp[1]);
      upp[2] = ((a[0] == 9 && a[1] == 9 && a[2] == 9)? 0 : upp[2]);
      upp[3] = ((a[0] == 9 && a[1] == 9 && a[2] == 9 && a[3] == 9)? 0 : upp[3]);
      
      downn[0] = ((a[0] == 0)? 0 : downn[0]);
      downn[1] = ((a[0] == 0 && a[1] == 0)? 0 : downn[1]);
      downn[2] = ((a[0] == 0 && a[1] == 0 && a[2] == 0)? 0 : downn[2]);
      downn[3] = ((a[0] == 0 && a[1] == 0 && a[2] == 0 && a[3] == 0)? 0 : downn[3]);
      
        couu = couu + 1;
        case(couu[19:18])
          2'b00 : begin
              anode = 4'b0111;
              num = a[0];
          end
          2'b01 : begin
              anode = 4'b1011;
              num = a[1];
          end
          2'b10 : begin
              anode = 4'b1101;
              num = a[2];
          end
          2'b11 : begin
              anode = 4'b1110;
              num = a[3];
          end
        endcase
    end
endmodule
