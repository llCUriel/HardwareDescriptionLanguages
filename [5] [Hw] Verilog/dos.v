module Hw5(A,B,clock,salida);
input [3:0] A,B;
input clock;
output reg salida;

always @(posedge clock)
        salida <= A&B;
endmodule