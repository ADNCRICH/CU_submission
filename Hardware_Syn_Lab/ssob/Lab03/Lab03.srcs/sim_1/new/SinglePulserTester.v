`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 11:38:02 PM
// Design Name: 
// Module Name: SinglePulserTester
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


module SinglePulserTester(

    );
    reg clock, d;
    SinglePulser SP(q, d, clock);
    always
        #10 clock=~clock;
    initial begin
        #0
        d=0;
        clock=0;
        #5
        d=1;
        #1;
        d=0;
        #1
        d=1;
        #1;
        d=0;
        #1;
        d=1;
        #2;
        d=0;
        #1;
        d=1;
        #1;
        d=0;
        #20;
        d=1;
        #100
        $finish;
    end
endmodule
