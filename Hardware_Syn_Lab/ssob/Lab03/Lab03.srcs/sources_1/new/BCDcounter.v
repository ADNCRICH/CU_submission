`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 10:20:18 PM
// Design Name: 
// Module Name: BCDcounter
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


module BCDcounter(
    output reg D,
    output reg C,
    output reg B,
    output reg A,
    output reg cout,
    output reg bout,
    input up,
    input down,
    input set9,
    input set0,
    input clock
    );
    reg [3:0] counter;
    
    initial begin
        counter = 4'b0000;
    end
    
    always @(posedge clock) begin
        cout <= 0;
        bout <= 0;
        
        case({up,down})
            2'b10: begin
                case(counter)
                    4'b1001: begin
                        counter = 4'b0000;
                        cout <= 1;
                    end
                    default: counter = counter + 1;
                endcase
            end
            2'b01: begin
                case(counter)
                    4'b0000: begin
                        counter = 4'b1001;
                        bout <= 1;
                    end
                    default: counter = counter - 1;
                endcase
            end
            default: counter = counter;
        endcase
        
        case ({set0, set9})
            2'b10: counter = 0;
            2'b01: counter = 9;
            default: counter = counter;
        endcase
        
        {D, C, B, A} <= counter;
    end
endmodule
