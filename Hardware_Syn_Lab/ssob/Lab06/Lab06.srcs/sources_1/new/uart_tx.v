`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:30:47 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
        output reg dataOut,
        output reg finish,
        input enable,
        input [7:0] dataIn,
        input clk
    );
    reg sending;
    reg [7:0] currentData;
    reg [7:0] counter;
    
    initial begin
        sending = 0;
        finish = 1;
        counter = 0;
    end
    
    // clk is 8 time faster than baudrate
    always @(posedge clk) begin
        if(sending) begin
            counter <= counter + 1;
            case(counter)
                0: dataOut <= 0;
                8: dataOut <= currentData[0];
                16: dataOut <= currentData[1];
                24: dataOut <= currentData[2];
                32: dataOut <= currentData[3];
                40: dataOut <= currentData[4];
                48: dataOut <= currentData[5];
                56: dataOut <= currentData[6];
                64: dataOut <= currentData[7];
                72: begin
                    dataOut <= 1;
                    sending <= 0;
                    finish <= 1;
                    counter <= 0;
                end
            endcase
        end else begin
            dataOut <= 1;
            counter <= 0;
        end
        
        if(enable && ~sending) begin
            sending <= 1;
            finish <= 0;
            currentData <= dataIn;
            counter <= 0;
        end
    end
endmodule
