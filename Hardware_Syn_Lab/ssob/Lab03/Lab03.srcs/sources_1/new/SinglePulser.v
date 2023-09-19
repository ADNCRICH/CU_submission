`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 11:33:55 PM
// Design Name: 
// Module Name: SinglePulser
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


module SinglePulser(
    output reg q,
    input rawD,
    input clock
    );
    wire d;
    // Lab03-2
    // assign d = rawD;
    
    //Lab03-4
    Debouncer DB(d, rawD, clock);

    reg Pulse;
    
    initial begin
        q<=0;
        Pulse<=0;
    end
    
    always @(posedge clock) begin
        case(d)
            0: begin
                q<=0;
                Pulse<=0;
            end
            1: begin
                q<=~Pulse;
                Pulse<=1;
            end
        endcase
    end
endmodule
