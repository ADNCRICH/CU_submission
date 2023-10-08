`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 11:15:32 PM
// Design Name: 
// Module Name: singlePulser
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


module singlePulser(
    output wire out,
    input in, clock
    );
    reg state,outt;
    
    initial {state, outt} = 0;
    
    assign out = outt;
    
    always@(posedge clock)begin
        if(state == 0) begin
             if(in == 1)begin
                outt <= 1;
                state <= 1;
             end
             else begin
                outt <= 0;
                state <= 0;
             end
        end
        else if(state == 1) begin
            if(in == 1) begin
                outt <= 0;
                state <= 1;
            end
            else begin
                outt <= 0;
                state <= 0;
            end
        end
    end
    
endmodule
