`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 04:02:07 PM
// Design Name: 
// Module Name: DistributedRAM
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


module DistributedRAM
#(
    parameter RAM_WIDTH = 8,
    parameter RAM_ADDR_BITS = 8,
    parameter INIT_FILE = ""
)
(
    output [RAM_WIDTH-1:0] outData,
    input [RAM_WIDTH-1:0] inData,
    input [RAM_ADDR_BITS-1:0] address,
    input writeEN,
    input clock
    );
    
    (* ram_style="distributed" *)
    reg [RAM_WIDTH-1:0] DataRAM [(2**RAM_ADDR_BITS)-1:0];



    always @(posedge clock) begin
        if (writeEN)
            DataRAM[address] <= inData;
    end
    
    assign outData = DataRAM[address];
endmodule
