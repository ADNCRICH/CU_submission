`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 11:03:07 PM
// Design Name: 
// Module Name: plusMinusMulDiv
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


module plusMinusMulDiv(
    output [0:6] seg7,
    output reg [3:0] anode,
    input [7:0] sw,
    input BTNU, BTNR, BTND, BTNL, clock
    );
    wire [15:0] numm;
    reg [3:0] num;
    reg couu[19:0];
    reg [1:0] mode;
    reg [19:0] cou;
    wire up, dn, ri, lf;
    
    problem2 SPup(BTNU, up);
    problem2 SPdn(BTNR, ri);
    problem2 SPri(BTND, dn);
    problem2 SPlf(BTNL, lf);
    
    minusEncoder en(num, seg7);
    BlockRom #(16, 10, "fourModeToBin.mem")rom(numm, {mode,sw}, clock);
    
    always@(posedge clock)begin
        cou = cou + 1;
        if(BTNU)
            mode = 0;
        else if(BTNR)
            mode = 1;
        else if(BTND)
            mode = 2;
        else if(BTNL)
            mode = 3;
            
         case(cou[19:18])
            0 : begin
                num = numm[15:12];
                anode = 4'b0111;
            end
            1 : begin
                num = numm[11:8];
                anode = 4'b1011;
            end
            2 : begin
                num = numm[7:4];
                anode = 4'b1101;
            end
            3 : begin
                num = numm[3:0];
                anode = 4'b1110;
            end
        endcase
         
    end
endmodule
