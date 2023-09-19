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
        output [6:0] seg,
        output reg [3:0] an,
        input [7:0] sw,
        input btnU,
        input btnC,
        input btnD,
        input clock
    );
    wire clk;
    wire [15:0] inp;
    reg [3:0] HEX;
    reg [1:0] counter;
    HEXtoSevenSegmentEncoder ss(seg,HEX);
    Stack st(inp,sw,btnU,btnC,btnD,clock);
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
