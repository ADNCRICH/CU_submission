`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 09:51:17 PM
// Design Name: 
// Module Name: SevenSegmentTDM
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


module SevenSegmentTDM(
        output [0:6] LED,
        output reg [3:0] activating,
        input [7:0] sw,
        input set9,
        input set0,
        input clock
    );
    wire clk;
    reg [3:0] HEX;
    reg [1:0] counter;
    wire [15:0] inp;

    FourDigitCounter(inp,sw,set9,set0,clock);
    HEXtoSevenSegmentEncoder ss(LED,HEX);
    ClockDivider cd(clk, clock);
    
    always @(posedge clk) begin
        case (counter[1:0])
            2'b00 : begin
                HEX <= inp[3:0];
                activating <= 4'b1110;
            end
            2'b01 : begin
                HEX <= inp[7:4];
                activating <= 4'b1101;
            end
            2'b10 : begin
                HEX <= inp[11:8];
                activating <= 4'b1011;
            end
            2'b11 : begin
                HEX <= inp[15:12];
                activating <= 4'b0111;
            end
        endcase
        counter <= counter+1;
    end
endmodule
