`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 10:21:19 PM
// Design Name: 
// Module Name: uart
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


module uart(
        output RsTx,
        input RsRx,
        input clk
    );
    
    wire sampling;
    wire sent;
    reg enable;
    reg [7:0] dataToSend;
    wire [7:0] receivedData;
    
    // Sampling is 8 time faster than 9600 baudrate
    samplingGenerator sampler(sampling, clk);
    
    uart_tx transmitter(RsTx, sent, enable, dataToSend, sampling);
    uart_rx receiver(receivedData, received, RsRx, sampling);

    reg lastReceived;
    always @(posedge sampling) begin
        if(received && ~lastReceived) begin
            dataToSend = receivedData + 1;
            enable = 1;
        end else begin
            enable = 0;
        end
        lastReceived = received;
    end
endmodule
