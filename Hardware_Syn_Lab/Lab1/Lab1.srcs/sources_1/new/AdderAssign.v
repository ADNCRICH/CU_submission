`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 12:32:24 PM
// Design Name: 
// Module Name: AdderAssign
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


module AdderAssign(cout, s, a, b, cin);
output cout;
output s;
input a;
input b;
input cin;
assign {cout,s} = a + b + cin;
endmodule
