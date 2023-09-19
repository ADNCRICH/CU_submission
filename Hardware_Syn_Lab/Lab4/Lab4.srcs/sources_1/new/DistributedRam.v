`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 11:15:44 AM
// Design Name: 
// Module Name: DistributedRam
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


module DistributedRam#(
    parameter Ram_Width = 8,
    parameter Adr_Bit = 8,
    parameter File = ""
)
(
    output [Ram_Width-1:0] out,
    input [Ram_Width-1:0] in,
    input [Adr_Bit-1:0] adr,
    input write,
    input clock
);

(*ram_style="distributed"*)
reg [Ram_Width-1:0] dRAM [(1<<Adr_Bit)-1:0];

assign out = dRAM[adr];

always@(posedge clock)begin
    if(write == 1)
        dRAM[adr] <= in;
end
endmodule
