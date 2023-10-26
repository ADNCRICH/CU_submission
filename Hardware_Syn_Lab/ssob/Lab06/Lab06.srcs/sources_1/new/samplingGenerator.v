`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:28:09 PM
// Design Name: 
// Module Name: samplingGenerator
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


module samplingGenerator(
        output reg dataOut,
        input dataIn
    );
    reg [29:0]  counter;
    
    initial begin
        dataOut = 0;
        counter = 0;
    end
    
    always @(posedge dataIn) begin
        counter <= counter + 1;
        if(counter == 651) begin
            dataOut <= ~dataOut;
            counter <= 0;
        end
    end
endmodule
