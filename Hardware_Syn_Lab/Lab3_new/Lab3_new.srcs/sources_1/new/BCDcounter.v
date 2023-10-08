`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 10:46:32 PM
// Design Name: 
// Module Name: BCDcounter
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


module BCDcounter(
    output wire [3:0] out,
    output wire cout, bout,
    input up, down, set9, set0, clock
    );
    reg [3:0] outt;
    reg coutt, boutt;
    
    initial {outt, coutt, boutt} = 0;
    
    assign {out, cout, bout} = {outt, coutt, boutt};
    
    always@(posedge clock) begin
        if(set9 == 1)
            {outt, coutt, boutt} <= {4'h9, 1'b0, 1'b0};
        else if(set0 == 1)
            {outt, coutt, boutt} <= {4'h0, 1'b0, 1'b0};
        else begin
            if(up == 1) begin
                if(outt < 9)
                    {outt, coutt, boutt} <= {outt + 1, 1'b0, 1'b0};
                else
                    {outt, coutt, boutt} <= {4'h0, 1'b1, 1'b0};
            end
            if(down == 1) begin
                if(outt > 0)
                    {outt, coutt, boutt} <= {outt - 1, 1'b0, 1'b0};
                else
                    {outt, coutt, boutt} <= {4'h9, 1'b0, 1'b1};
            end
        end
        if(up == 0)
            coutt <= 0;
        if(down == 0)
            boutt <= 0;
    end
endmodule
