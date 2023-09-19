`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 02:25:24 PM
// Design Name: 
// Module Name: StackTest
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


module StackTest();
    wire [15:0] out;
    reg [7:0] sw;
    reg push;
    reg pop;
    reg reset;
    reg clock;
    Stack st(out,sw,push,pop,reset,clock);
    
    always begin
        #5
        clock = ~clock;
    end
    
    initial begin
        #0
        clock = 0;
        pop = 0;
        push = 0;
        reset = 0;
        sw = 0;
        #10
        sw[0] = 1;
        #30;
        push = 1;
        #50;
        push = 0;
        #10
        pop = 1;
        #50;
        $finish;
    end
endmodule
