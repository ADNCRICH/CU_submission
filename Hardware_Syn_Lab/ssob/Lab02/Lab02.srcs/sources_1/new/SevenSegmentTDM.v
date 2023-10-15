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
        output reg dp,
        input clock
    );
    wire clk;
    reg [15:0] inp;
    reg [3:0] HEX;
    reg [1:0] counter;
    reg [27:0] counter2;
    reg [3:0] inpDp;
    HEXtoSevenSegmentEncoder ss(seg,HEX);
    ClockDivider cd(clk, clock);
    
    initial begin
        inp = 16'b0001001000110100;
        inpDp = 4'b1111;
    end

    always @(posedge clock) begin
        if(counter2 <= 100000000) begin
            inp = 16'b0001100100000010;
            inpDp = 4'b1010;
        end else begin
            inp = 16'b0010000000000011;
            inpDp = 4'b1110;
            if(counter2 == 200000000) begin
                counter2 = 0;
            end
        end
        counter2 <= counter2+1;
    end

    always @(posedge clk) begin
        case (counter[1:0])
            2'b00 : begin
                HEX <= inp[3:0];
                an <= 4'b1110;
                dp <= inpDp[0];
            end
            2'b01 : begin
                HEX <= inp[7:4];
                an <= 4'b1101;
                dp <= inpDp[1];
            end
            2'b10 : begin
                HEX <= inp[11:8];
                an <= 4'b1011;
                dp <= inpDp[2];
            end
            2'b11 : begin
                HEX <= inp[15:12];
                an <= 4'b0111;
                dp <= inpDp[3];
            end
        endcase
        counter <= counter+1;
    end
endmodule
