`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 01:02:29 PM
// Design Name: 
// Module Name: clockDivider
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
    reg [25:0] counter;
    always @(posedge cin) begin
        if(counter <= 50000000) begin
            cout <= 1;
        end else begin
            cout <= 0;
            if(counter == 100000000) begin
                counter = 0;
            end
        end
        counter <= counter+1;
     end
endmodule
