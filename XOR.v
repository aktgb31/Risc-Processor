module XOR(Y,A,B);
	input A,B;
	output Y;
	wire a,b,c;
	nand(c,A,B);
	nand(a,c,A);
	nand(b,c,B);
	nand(Y,a,b);
endmodule
