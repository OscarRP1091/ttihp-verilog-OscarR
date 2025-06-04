module tt_um_OscarRP1091 (
    input  wire clk,
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe
);

    wire [4:0] sw_credito = ui_in[7:3];
    wire avance = ui_in[2];
    wire [2:0] estado = ui_in[2:0];

    wire credito;
    wire [3:0] estado_actual;
    wire [6:0] seg;

    Credito credito_inst (
        .sw_credito(sw_credito),
        .hay_credito(credito)
    );

    ControlEstado control_estado_inst (
        .estado(estado),
        .avance(avance),
        .credito(credito),
        .estado_actual(estado_actual)
    );

    Display7Seg display_inst (
        .numero(estado_actual),
        .seg(seg)
    );

    assign uo_out[0] = credito;
    assign uo_out[7:1] = seg[6:0];

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
