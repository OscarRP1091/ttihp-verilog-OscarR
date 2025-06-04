`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 21:39:53
// Design Name: 
// Module Name: tt_um_OscarRP1091
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

module tt_um_OscarRP1091 (
    input  wire clk,
    input  wire ena,
    input  wire rst_n,              // Reset activo en bajo
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe
);

    // Mapear entradas
    wire [3:0] sw_credito = ui_in[7:4];  // 4 bits crédito
    wire avance = ui_in[3];             // señal de avance
    wire [2:0] estado = ui_in[2:0];     // estado deseado

    // Salidas internas
    wire credito;
    wire [3:0] estado_actual;
    wire [6:0] seg;

    // Instanciar módulo de crédito
    Credito credito_inst (
        .sw_credito(sw_credito),
        .hay_credito(credito)
    );

    // Control de estado
    ControlEstado control_estado_inst (
        .estado(estado),
        .avance(avance),
        .credito(credito),
        .estado_actual(estado_actual)
    );

    // Conversor a display 7 segmentos
    Display7Seg display_inst (
        .numero(estado_actual),
        .seg(seg)
    );

    // Salidas protegidas por ena
    assign uo_out[0]   = ena ? credito  : 1'b0;
    assign uo_out[7:1] = ena ? seg      : 7'b0;

    // No se usan los pines bidireccionales
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
