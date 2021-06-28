module NOR(Y,A,B);
	input A,B;
	output Y;
	wire a,b,c;
	nand (a,A,A);
	nand (b,B,B);
	nand (c,a,b);
	nand (Y,c,c);
endmodule