module Hw5(A,B,salida);
input [3:0] A,B;
output reg  salida;

always @(A,B)
        salida = A&B;
endmodule
