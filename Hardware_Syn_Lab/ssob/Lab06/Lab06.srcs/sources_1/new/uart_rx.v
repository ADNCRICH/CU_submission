`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:30:47 PM
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
        output reg [7:0] dataOut,
        output reg finish,
        input dataIn,
        input clk
    );
    reg receiving;
    reg [7:0] counter;
    initial begin
        finish = 1;
        receiving = 0;
        counter = 0;
    end
    
    always @(posedge clk) begin
        if(receiving) begin
            counter <= counter + 1;
            case(counter)
                12: dataOut[0] <= dataIn;
                20: dataOut[1] <= dataIn;
                28: dataOut[2] <= dataIn;
                36: dataOut[3] <= dataIn;
                44: dataOut[4] <= dataIn;
                52: dataOut[5] <= dataIn;
                60: dataOut[6] <= dataIn;
                68: dataOut[7] <= dataIn;
                76: begin
                    receiving <= 0;
                    finish <= 1;
                    counter <= 0;
                end
            endcase
        end else begin
            counter <= 0;
        end
        
        if(~dataIn && ~receiving) begin
            receiving <= 1;
            finish <= 0;
            counter <= 0;
        end
    end
endmodule
