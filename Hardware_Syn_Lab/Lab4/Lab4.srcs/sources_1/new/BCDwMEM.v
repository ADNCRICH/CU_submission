`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2023 08:08:53 PM
// Design Name: 
// Module Name: BCDwMEM
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


module BCDwMEM(
    output [0:6] seg7,
    output reg [3:0] anode,
    input [4:0] sw,
    input clock
    );
reg [20:0] cou;
reg [3:0] num;
wire [7:0] numm;
Encoder en(num, seg7);
BlockRom #(8, 5, "tensToBinary.mem")rom(numm, sw, clock);

always@(posedge clock)begin
    cou = cou+1;
    case(cou[19:18])
        0|1 : begin
            anode = 4'b0011;
            num = 0;
        end
        2 : begin 
            anode = 4'b1101;
            num = numm[7:4];
        end
        3 : begin
            anode = 4'b1110;
            num = numm[3:0];
        end
     endcase
end
endmodule
