`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2023 09:28:30 PM
// Design Name: 
// Module Name: Main
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


module Main(
    output wire [0:6] out,
    output reg [3:0] anode,
    output reg dot,
    input clock
    );
    reg [28:0] count;
    reg [18:0] cou;
    reg [3:0] num;
    Encoder(num, out);
    reg [15:0] d [0:1];
    reg state;
    reg [1:0] dd [0:1];
    initial begin
        d[0] = 16'b0000000100100101;
        dd[0] = 2'b00;
        d[1] = 16'b0010000000000011;
        dd[1] = 2'b10;
    end
    
    always@(posedge clock) begin
        count <= count + 1;
        cou <= cou + 1;
        if(count == 100000000) begin
            count = 0;
            state = state + 1;
        end
        case(cou[18:17])
            0: begin num = d[state][15:12]; anode = 4'b0111; dot = 1; end
            1: begin num = d[state][11:8]; anode = 4'b1011; dot = dd[state][1]; end
            2: begin num = d[state][7:4]; anode = 4'b1101; dot = 1; end
            3: begin num = d[state][3:0]; anode = 4'b1110; dot = dd[state][0]; end
        endcase
        
    end
    
endmodule
