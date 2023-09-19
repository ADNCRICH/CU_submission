`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/16/2023 10:05:50 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );
    assign {cout,s} = a + b + cin;
    /*
    reg cout,s;
    always @(a or b or cin) begin
        s <= (a^b) ^ cin;
        cout <= (a&b) | ((a^b)&cin);
    end
    */
endmodule
