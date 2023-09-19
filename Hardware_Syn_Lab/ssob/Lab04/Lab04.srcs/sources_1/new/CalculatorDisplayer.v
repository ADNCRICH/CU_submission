`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2023 10:47:46 AM
// Design Name: 
// Module Name: CalculatorDisplayer
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


module CalculatorDisplayer(
        output [6:0] seg,
        output reg [3:0] an,
        input [7:0] sw,
        input btnU,
        input btnL,
        input btnD,
        input btnR,
        input clock
    );
    wire clk;
    wire [15:0] inp;
    reg [3:0] HEX;
    reg [1:0] counter;
    reg [9:0] address;
    SpecialHEXtoSevenSegmentEncoder ss(seg,HEX);
    ROMM #(16,10,"calROM.mem")DataROM(inp, address, clock);
    ClockDivider cd(clk, clock);
    
    initial address <= 0;
    
    always @(posedge clock) begin
        case({btnU,btnL,btnD,btnR})
            4'b1000:    address <= {sw,2'b00};
            4'b0100:    address <= {sw,2'b01};
            4'b0010:    address <= {sw,2'b10};
            4'b0001:    address <= {sw,2'b11};
        endcase
    end
    
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
