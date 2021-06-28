module OR(Y,A,B);
	input A,B;
	output Y;
	wire x,z;
	nand (x,A,A);
	nand (z,B,B);
	nand (Y,x,z);
endmodule

module _16_BIT_OR(Y,A,B);
	input [15:0]A;
	input [15:0]B;
	output [15:0]Y;
	OR or_1[15:0](Y,A,B);
endmodule
