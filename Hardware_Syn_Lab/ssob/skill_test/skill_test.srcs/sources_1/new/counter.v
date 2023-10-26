`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 01:02:29 PM
// Design Name: 
// Module Name: counter
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


module counter(
        output reg [7:0] led,
        input clock
    );

    wire clk;
    ClockDivider cDiv(clk,clock);
    
    reg [3:0] counter;
    initial begin
        counter = 0;
        led[7] = 0;
    end
    always @(posedge clk) begin
        led[7] <= ~led[7];
        case(counter)
            4'b0000: led[3:0] = 4'b0000;    // 0
            4'b0001: led[3:0] = 4'b0001;    // 1
            4'b0010: led[3:0] = 4'b0010;    // 2
            4'b0011: led[3:0] = 4'b0011;    // 3
            4'b0100: led[3:0] = 4'b0100;    // 4
            4'b0101: led[3:0] = 4'b1011;    // 5
            4'b0110: led[3:0] = 4'b1100;    // 6
            4'b0111: led[3:0] = 4'b1101;    // 7
            4'b1000: led[3:0] = 4'b1110;    // 8
            4'b1001: led[3:0] = 4'b1111;    // 9
        endcase
        counter <= counter+1;
        if(counter == 9) begin
            counter <= 0;
        end
    end
endmodule
