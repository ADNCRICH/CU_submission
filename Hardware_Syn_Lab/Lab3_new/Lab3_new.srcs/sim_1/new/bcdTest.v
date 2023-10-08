`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 11:05:58 PM
// Design Name: 
// Module Name: bcdTest
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


module bcdTest();
reg clock, up, down, set9, set0;
wire [3:0] out;
wire cout, bout;

BCDcounter B1(out, cout, bout, up, down, set9, set0, clock);

always
    #5 clock =~ clock;
initial
begin
    #0 {clock, up, down, set9, set0} = 1;
    #20 set0 = 0;
    #42 up = 1;
    #250 set0 = 1;
    #30 set0 = 0;
    #30 set9 = 1;
    #30 set9 = 0;
    #30 {up, down} = 1;
    #250 set9 = 1;
    #30 set9 = 0;
    #30 set0 = 1;
    #30 set0 = 0;
    #50 up = 1;
    #1000;$finish;
    
end
endmodule
