`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 08:06:48 PM
// Design Name: 
// Module Name: vga_test
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


module vga_test
	(
		input wire clk, reset,
		input wire [11:0] sw,
		input wire btnU,
		input wire btnD,
		output wire hsync, vsync,
		output wire [11:0] rgb
	);
	
	// Lab06-01
	wire p_tick;
	wire [9:0] x,y;
	
	// register for Basys 2 8-bit RGB DAC 
	wire [11:0] rgb_reg;
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;

        // instantiate vga_sync
        vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                                .video_on(video_on), .p_tick(p_tick), .x(x), .y(y));
   
//         rgb buffer
        vga_gradient vga_gradient_unit(rgb_reg,sw,btnU,btnD,p_tick,x,y,clk);
        
        // output
        assign rgb = (video_on) ? rgb_reg : 12'b0;
endmodule