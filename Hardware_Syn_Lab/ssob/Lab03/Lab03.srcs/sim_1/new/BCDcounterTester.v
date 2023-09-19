`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 09:41:43 AM
// Design Name: 
// Module Name: BCDcounterTester
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


module BCDcounterTester(

    );
    reg up,down,set9,set0,clock;
    wire D,C,B,A,cout,bout;
    BCDcounter counter(D,C,B,A,cout,bout,up,down,set9,set0,clock);
    always begin
        #5;
        clock = ~clock;
    end
    
    initial begin
        #0;
        {up,down,set9,set0,clock} = 5'b00000;
        #12;
        set9 = 1;
        #10;
        set0 = 1;
        #10;
        set9 = 0;
        #10;
        set0 = 0;
        up = 1;
        down = 1;
        #30;
        down = 0;
        #120;
        up = 0;
        down = 1;
        #120;
        $finish;
    end
endmodule
