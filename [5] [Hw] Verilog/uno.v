module Hw5(clock, strobe, xflag, mask, right, select, stop);
input clock, strobe, xflag, mask;
output reg right, select, stop;

always @(posedge clock)
begin
   right = right | strobe;
   select = right | xflag;
   stop  = select ^mask;
end
endmodule
