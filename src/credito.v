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
