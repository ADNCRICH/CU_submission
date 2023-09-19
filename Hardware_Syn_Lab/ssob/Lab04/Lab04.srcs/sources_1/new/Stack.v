`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 02:04:27 PM
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
        input pushRaw,
        input popRaw,
        input resetRaw,
        input clock
    );
    wire push,pop,reset;
	reg [7:0] counter;
	reg [7:0] displayData,inRAM;
	wire [7:0] dRAM;
	reg writeEN;
	
	DistributedRAM RAM(dRAM,inRAM, counter, writeEN, clock);
	
	SinglePulser pushSP(push,pushRaw,clock);
	SinglePulser popSP(pop,popRaw,clock);
	SinglePulser resetSP(reset,resetRaw, clock);
    
    assign out = {displayData, counter};

	initial begin
		counter = 0;
	end

	always @(posedge clock) begin
	   writeEN <= 0;
		case ({push,pop,reset})
			3'b100: begin
				if (counter < 255) begin
					writeEN <= 1;
					inRAM = sw;
					counter <= counter + 1;
				end
			end
			3'b010: begin
				if (counter > 0) begin
				    displayData <= dRAM;
					counter <= counter - 1;
				end
			end
			3'b001: begin
				counter <= 0;
				displayData <= 0;
			end
		endcase
	end
    
endmodule
