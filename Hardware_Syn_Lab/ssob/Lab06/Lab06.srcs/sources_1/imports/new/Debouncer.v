`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 10:36:50 PM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer(
    output reg Q,
    input D,
    input clock
    );
    wire [2:0] inSignal;
    genvar i;
    assign inSignal[0] = D;
    generate for(i=0;i<2;i=i+1) begin
        DFlipFlop df(inSignal[i+1],clock,1,inSignal[i]);
    end endgenerate
    reg [19:0] counter;
    initial begin
        counter <= 0;
    end
    
    always @(posedge clock) begin
        counter <= counter+1;
        if(counter == 0) begin
            Q <= inSignal[2];
        end
    end
    
endmodule
