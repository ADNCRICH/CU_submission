`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module sevenSegmentMemory(data,address,wr,clock,seg,an,sw);
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=12;

inout	[DATA_WIDTH-1:0]	data;
input	[ADDR_WIDTH-1:0]	address;
input		wr;
input		clock;

reg	[DATA_WIDTH-1:0]	mem[0:1<<ADDR_WIDTH -1];

reg	[DATA_WIDTH-1:0]	data_out;

// Lab05-03 initial begin
output wire [6:0] seg;
output wire [3:0] an;
reg [15:0] sevenSegmentInp;
input wire [11:0] sw;
SevenSegmentMainDriver SSMD(seg,an,sevenSegmentInp,clock);
// Lab05-03 initial end

// Tri-State buffer
assign data=(wr==0) ? data_out:32'bz;

integer i;
initial
begin
	$readmemb("data.list",mem);
end

always @(address)
begin
	$display("%10d - mem[%h] -  %h\n",$time, address,data_out);	
	case (address)
	   12'hFF0: data_out = sevenSegmentInp[3:0];
	   12'hFF4: data_out = sevenSegmentInp[7:4];
	   12'hFF8: data_out = sevenSegmentInp[11:8];
	   12'hFFC: data_out = sevenSegmentInp[15:12];
	   12'hFE0: data_out = sw[3:0];
	   12'hFE4: data_out = sw[7:4];
	   12'hFE8: data_out = sw[11:8];
	   default: data_out = mem[address];
	endcase
end

always @(posedge clock)
begin : MEM_WRITE
	if (wr) begin
	   case(address)
	       12'hFF0: sevenSegmentInp[3:0] = data[3:0];
	       12'hFF4: sevenSegmentInp[7:4] = data[3:0];
	       12'hFF8: sevenSegmentInp[11:8] = data[3:0];
	       12'hFFC: sevenSegmentInp[15:12] = data[7:4];
	       default: mem[address]=data;
	   endcase
		$display("%10d - MEM[%h] <- %h",$time, address, data);
	end
end

endmodule