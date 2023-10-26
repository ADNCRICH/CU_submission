`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:06:41 PM
// Design Name: 
// Module Name: vga_gradient
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


module vga_gradient(
        output reg [11:0] rgb_reg,
        input [11:0] sw,
        input btnU,
        input btnD,
        input p_tick,
        input [9:0] x,
        input [9:0] y,
        input clk
    );
        localparam WIDTH = 640;
        localparam HEIGHT = 480;
        wire U,D;
        reg mode = 0;
        reg [11:0] col;
        SinglePulser SPU(U,btnU,clk);
        SinglePulser SPD(D,btnD,clk);
        always @(posedge clk) begin
            if(U)
                mode <= !mode;
            if(D) begin
                col <= sw;
            end
        end
        
        always @(posedge clk) begin
            if(p_tick == 1) begin
            case(mode)
                0: begin
                    rgb_reg[11:8] <= ((WIDTH - x)*col[11:8] + x*sw[11:8]) / WIDTH;
                    rgb_reg[7:4] <= ((WIDTH - x)*col[7:4] + x*sw[7:4]) / WIDTH;
                    rgb_reg[3:0] <= ((WIDTH - x)*col[3:0] + x*sw[3:0]) / WIDTH;
                end
                1: begin
                    rgb_reg[11:8] <= ((HEIGHT - y)*col[11:8] + y*sw[11:8]) / HEIGHT;
                    rgb_reg[7:4] <= ((HEIGHT - y)*col[7:4] + y*sw[7:4]) / HEIGHT;
                    rgb_reg[3:0] <= ((HEIGHT - y)*col[3:0] + y*sw[3:0]) / HEIGHT;
                end
            endcase
            end
        end
endmodule
