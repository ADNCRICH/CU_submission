`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 01:39:53 AM
// Design Name: 
// Module Name: problem2
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


module problem2(
    input wire in,clock,
    output wire outt
    );
    //reg [2:0] state;
    reg [2:0] state;
    reg out;
    initial state = 0;
    assign outt = out;
    always@(posedge clock)begin
        /*state = ((state >=1 && state < 4)? state + 1 : state);
        case(state)
            0 : {state,out} = ((in)? 3 : 0);
            4 : {state,out} = ((in)? 8 : 0);*/
        case(state)
            0 : {state, out} = ((in)? 3 : 0);
            1 : {state, out} = ((in)? 2 : 0);
            //2 : {state, out} = ((in)? 4 : 0);
        endcase
    end
endmodule
