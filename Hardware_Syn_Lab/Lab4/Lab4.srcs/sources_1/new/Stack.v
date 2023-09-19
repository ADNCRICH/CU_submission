`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 12:11:49 PM
// Design Name: 
// Module Name: Stack
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


module Stack(
        output [15:0] out,
        input [7:0] sw,
        input push, pop, reset, clock
    );
    wire pushW, popW, resetW;
    wire [7:0] dRam;
    reg [7:0] cou;
    reg [7:0] inRam;
    reg [7:0] disp;
    reg write;
    
    problem2 pushSP(push, clock, pushW);
    problem2 popSP(pop, clock, popW);
    problem2 resetSP(reset, clock, resetW);
    
    DistributedRam dr(dRam, inRam, cou, write, clock);
    
    assign out = {disp, cou};
    
    initial {disp,cou} = 0;
 
    always@(posedge clock)begin
        write = 0;
        case({pushW, popW, resetW})
            4 : begin
                if(cou < 255)begin
                    write = 1;
                    inRam = sw;
                    cou = cou + 1;
                end
            end
            2 : begin
                if(cou > 0)begin
                    disp = dRam;
                    cou = cou - 1;
                end
            end
            1 : begin
                cou = 0;
                disp = 0;
            end
        endcase
    end
        
endmodule
