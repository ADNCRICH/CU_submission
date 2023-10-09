`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 11:35:39 PM
// Design Name: 
// Module Name: fourCounter
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


module fourCounter(
    output wire [0:6] out,
    output reg [3:0] anode,
    input [0:7] sw,
    input btnu, btnc, clock
    );
    reg [3:0] num;
    encoder e(num, out);
    wire [3:0] a [0:3];
    wire [0:3] cout;
    wire [0:3] bout;
    wire [0:3] up;
    wire [0:3] down;
    wire set9, set0;
    reg [0:3] upp;
    reg [0:3] downn;
    wire [0:3] dup;
    wire [0:3] ddown;
    Debounce de1(clock, sw[1], dup[0]);
    Debounce de2(clock, sw[3], dup[1]);
    Debounce de3(clock, sw[5], dup[2]);
    Debounce de4(clock, sw[7], dup[3]);
    Debounce de5(clock, sw[0], ddown[0]);
    Debounce de6(clock, sw[2], ddown[1]);
    Debounce de7(clock, sw[4], ddown[2]);
    Debounce de8(clock, sw[6], ddown[3]);
    singlePulser s0(up[0], dup[0], clock);
    singlePulser s1(up[1], dup[1], clock);
    singlePulser s2(up[2], dup[2], clock);
    singlePulser s3(up[3], dup[3], clock);
    singlePulser s4(down[0], ddown[0], clock);
    singlePulser s5(down[1], ddown[1], clock);
    singlePulser s6(down[2], ddown[2], clock);
    singlePulser s7(down[3], ddown[3], clock);
    singlePulser s8(set9, btnu, clock);
    singlePulser s9(set0, btnc, clock);
    clkDiv cd(clock, clk);
    BCDcounter c0(a[0], cout[0], bout[0], upp[0], downn[0], btnu, btnc, clock);
    BCDcounter c1(a[1], cout[1], bout[1], upp[1], downn[1], btnu, btnc, clock);
    BCDcounter c2(a[2], cout[2], bout[2], upp[2], downn[2], btnu, btnc, clock);
    BCDcounter c3(a[3], cout[3], bout[3], upp[3], downn[3], btnu, btnc, clock);
    
    always@(posedge clock) begin
        upp = up;
        upp[0:2] = upp[0:2]|cout[1:3];
        downn = down;
        downn[0:2] = downn[0:2]|bout[1:3];
        if(a[0] == 9)
            upp[0] = 0;
        if(a[0] == 9 && a[1] == 9)
            upp[1] = 0;
        if(a[0] == 9 && a[1] == 9 && a[2] == 9)
            upp[2] = 0;
        if(a[0] == 9 && a[1] == 9 && a[2] == 9 && a[3] == 9)
            upp[3] = 0;
            
        if(a[0] == 0)
            downn[0] = 0;
        if(a[0] == 0 && a[1] == 0)
            downn[1] = 0;
        if(a[0] == 0 && a[1] == 0 && a[2] == 0)
            downn[2] = 0;
        if(a[0] == 0 && a[1] == 0 && a[2] == 0 && a[3] == 0)
            downn[3] = 0;
    end
    
    reg [1:0] clkcou;
    always@(posedge clk) begin
        clkcou <= clkcou + 1;
        case(clkcou)
            0: begin num <= a[0]; anode <= 4'b0111; end
            1: begin num <= a[1]; anode <= 4'b1011; end
            2: begin num <= a[2]; anode <= 4'b1101; end
            3: begin num <= a[3]; anode <= 4'b1110; end
        endcase
    end
endmodule
