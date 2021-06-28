module _16_BIT_NOT(Y,A);
	input [15:0]A;
	output [15:0]Y;
	nand n[15:0](Y,A,A);
endmodule
