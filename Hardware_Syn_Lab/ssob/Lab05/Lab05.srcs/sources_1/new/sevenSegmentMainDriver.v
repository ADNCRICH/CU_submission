`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 09:51:17 PM
// Design Name: 
// Module Name: SevenSegmentMainDriver
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


module SevenSegmentMainDriver(
        output [6:0] seg,
        output reg [3:0] an,
        input [15:0] inp,
        input clock
    );
    wire clk;
    reg [3:0] HEX;
    reg [1:0] counter;
    HEXtoSevenSegmentEncoder ss(seg,HEX);
    ClockDivider cd(clk, clock);

    always @(posedge clk) begin
        case (counter[1:0])
            2'b00 : begin
                HEX <= inp[3:0];
                an <= 4'b1110;
            end
            2'b01 : begin
                HEX <= inp[7:4];
                an <= 4'b1101;
            end
            2'b10 : begin
                HEX <= inp[11:8];
                an <= 4'b1011;
            end
            2'b11 : begin
                HEX <= inp[15:12];
                an <= 4'b0111;
            end
        endcase
        counter <= counter+1;
    end
endmodule
