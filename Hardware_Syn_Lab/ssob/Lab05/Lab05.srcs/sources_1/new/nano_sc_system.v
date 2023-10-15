`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : nano_sc_system.v
// Title        : nanoCPU Single Cycle system.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module nano_sc_system(
    output [6:0] seg,
    output [3:0] an,
    input [11:0] sw,
    input clock
);
wire 	[31:0]	p_address;
wire 	[31:0]	p_data;
wire	[31:0]	d_address;
wire		mem_wr;
wire	[31:0]	d_data;
reg		nreset;

nanocpu	CPU(p_address,p_data,d_address,d_data,mem_wr,clock,nreset);
rom 	PROGMEM(p_data,p_address[9:2]);
//Lab05-02
// Memory 	DATAMEM(d_data,d_address[15:0],mem_wr,clock);
//Lab05-03
sevenSegmentMemory 	DATAMEM(d_data,d_address[11:0],mem_wr,clock,seg,an,sw);

initial begin
    nreset = 1;
end
endmodule