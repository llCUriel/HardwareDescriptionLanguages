module VerilogAdder(
	input [7:0] A,
	input [7:0] B,
	input Cin,
	output reg [7:0] Sum,
	output reg Cout
	);

	always @ (*)
	begin
		{Cout, Sum} = A + B + Cin;
	end
endmodule