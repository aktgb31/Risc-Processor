module NOT(Y,A);
	input A;
	output Y;
	nand(Y,A,A);
endmodule

module XOR(Y,A,B);
	input A,B;
	output Y;
	wire a,b,c;
	nand(c,A,B);
	nand(a,c,A);
	nand(b,c,B);
	nand(Y,a,b);
endmodule

module XNOR(Y,A,B);
	input A,B;
	output Y;
	wire x;
	XOR xor_1(x,A,B);
	NOT not_1(Y,x);
endmodule

