`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 20:45:13
// Design Name: 
// Module Name: credito
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


module Credito (
    input [4:0] sw_credito,
    output reg hay_credito
);
    always @(*) begin
        if (sw_credito == 5'b10100)
            hay_credito = 1;
        else
            hay_credito = 0;
    end
endmodule
