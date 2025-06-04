`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 20:47:44
// Design Name: 
// Module Name: control_estado
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


module ControlEstado (
    input [2:0] estado,
    input avance,
    input credito,
    output reg [3:0] estado_actual
);
    always @(*) begin
        if (credito && avance) begin
            case (estado)
                3'b000: estado_actual = 4'd1;
                3'b001: estado_actual = 4'd2;
                3'b010: estado_actual = 4'd3;
                3'b011: estado_actual = 4'd4;
                3'b100: estado_actual = 4'd5;
                3'b101: estado_actual = 4'd6;
                default: estado_actual = 4'd0;
            endcase
        end else begin
            estado_actual = 4'd0;
        end
    end
endmodule

