`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 11:39:56 AM
// Design Name: 
// Module Name: BlockRom
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


module BlockRom#(
    parameter Rom_Width = 8,
    parameter Adr_Bit = 5,
    parameter File = ""
)
(
    output reg [Rom_Width-1:0] out,
    input [Adr_Bit-1:0] adr,
    input clock
);
    (*rom_style="block"*)
    reg [Rom_Width-1:0] Rom [(1<<Adr_Bit)-1:0];
    
    initial $readmemb(File, Rom);
    
    always@(posedge clock)begin
        out = Rom[adr];
    end
endmodule
