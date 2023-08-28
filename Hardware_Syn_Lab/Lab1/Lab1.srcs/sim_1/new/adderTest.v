`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 12:05:00 PM
// Design Name: 
// Module Name: adderTest
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


module adderTest;
reg a,b,cin;
wire cout,s;
AdderAssign a1(cout,s,a,b,cin);
initial
begin
//$dumpfile("time.dump");
//$dumpvars(2,a1);
$monitor("time %t: {%b %b} <- {%d %d %d}", $time,cout,s,a,b,cin);
    #0;
    a = 0;
    b = 0;
    cin = 0;
    #5;
    cin = 1;
    #5;
    b = 1;
    cin = 0;
    #5;
    cin = 1;
    #5;
    a = 1;
    b = 0;
    cin = 0;
    #5;
    cin = 1;
    #5;
    b = 1;
    cin = 0;
    #5;
    cin = 1;
    #5;
    
    $finish;
end
endmodule
