`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 09:50:05 PM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider(
        output reg cout,
        input cin
    );
    reg [18:0] counter;
    always @(posedge cin) begin
        case(counter[18])
            1'b0 : cout <= 1;
            default: cout <= 0;
        endcase
        counter <= counter+1;
     end
endmodule
