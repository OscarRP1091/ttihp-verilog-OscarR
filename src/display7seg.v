module Display7Seg (
    input [3:0] numero,
    output reg [6:0] seg
);
    always @(*) begin
        case (numero)
            4'd1: seg = 7'b1111001; // 1
            4'd2: seg = 7'b0100100; // 2
            4'd3: seg = 7'b0110000; // 3
            4'd4: seg = 7'b0011001; // 4
            4'd5: seg = 7'b0010010; // 5
            4'd6: seg = 7'b0000010; // 6
            default: seg = 7'b1000000; // 0 o inválido
        endcase
    end
endmodule
