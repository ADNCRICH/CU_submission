`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:02:26 AM
// Design Name: 
// Module Name: FourDigitCounter
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


module FourDigitCounter(
        output [15:0] LED,
        input [7:0] SW,
        input set9,
        input set0,
        input clock
    );
    wire [4:0] cout,bout;
    wire [3:0] down;
    wire [3:0] up;
    wire [7:0] SPSW;
    wire SPs9,SPs0;
    wire nFull[3:0],nEmpty[3:0];

    genvar i;
    generate for(i=0;i<8;i=i+1) begin
        SinglePulser SP(SPSW[i],SW[i],clock);
    end endgenerate
    
    SinglePulser SP9(SPs9,set9,clock);
    SinglePulser SP0(SPs0,set0,clock);

    assign down = {SPSW[6],SPSW[4],SPSW[2],SPSW[0]};
    assign up = {SPSW[7],SPSW[5],SPSW[3],SPSW[1]};
    
    assign nFull[0] = ~(LED == 16'b1001100110011001);
    assign nFull[1] = ~(LED[15:4] == 12'b100110011001);
    assign nFull[2] = ~(LED[15:8] == 8'b10011001);
    assign nFull[3] = ~(LED[15:12] == 4'b1001);
    assign nEmpty[0] = ~(LED == 0);
    assign nEmpty[1] = ~(LED[15:4] == 0);
    assign nEmpty[2] = ~(LED[15:8] == 0);
    assign nEmpty[3] = ~(LED[15:12] == 0);
    

    generate for(i=1;i<5;i=i+1) begin
        BCDcounter bc(LED[(i-1)*4+3],LED[(i-1)*4+2],LED[(i-1)*4+1],LED[(i-1)*4],cout[i],bout[i],(cout[i-1] | up[i-1]) & nFull[i-1],(bout[i-1] | down[i-1]) & nEmpty[i-1],SPs9,SPs0,clock);
    end endgenerate
    
endmodule
