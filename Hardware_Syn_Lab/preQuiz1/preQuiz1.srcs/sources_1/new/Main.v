`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 09:28:30 PM
// Design Name: 
// Module Name: Main
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


module Main(
    output reg [3:0] led,
    output reg l7,
    input clock
    );
    reg [3:0] d0;
    reg [3:0] d1;
    reg [3:0] d2;
    reg [3:0] d3;
    reg [3:0] d4;
    reg [3:0] d5;
    reg [3:0] d6;
    reg [3:0] d7;
    reg [3:0] d8;
    reg [3:0] d9;
    reg [3:0] state;
    initial begin
        d0 = 4'b0000;
        d1 = 4'b0001;
        d2 = 4'b0010;
        d3 = 4'b0011;
        d4 = 4'b0100;
        d5 = 4'b1011;
        d6 = 4'b1100;
        d7 = 4'b1101;
        d8 = 4'b1110;
        d9 = 4'b1111;
    end
    wire clk;
    clkDiv cd(clock, clk);
    always@(posedge clk) begin
        if(state == 0)
            led = d0;
            if(state == 1)
            led = d1;
            if(state == 2)
            led = d2;
            if(state == 3)
            led = d3;
            if(state == 4)
            led = d4;
            if(state == 5)
            led = d5;
            if(state == 6)
            led = d6;
            if(state == 7)
            led = d7;
            if(state == 8)
            led = d8;
            if(state == 9)
            led = d9;
        l7 = 1 - l7;
        state = state + 1;
        if(state == 10)
            state = 0;
    end
    
endmodule
