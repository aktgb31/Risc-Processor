module XOR(Y,A,B);
	input A,B;
	output Y;
	wire a,b,c;
	nand(c,A,B);
	nand(a,c,A);
	nand(b,c,B);
	nand(Y,a,b);
endmodule

module _16_BIT_XOR(Y,A,B);
	input [15:0]A;
	input [15:0]B;
	output [15:0]Y;
	XOR xor_1[15:0](Y,A,B);
endmodule
