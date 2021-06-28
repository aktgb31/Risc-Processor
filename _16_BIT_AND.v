module AND(Y,A,B);
	input A,B;
	output Y;
	wire x;	
	nand(x,A,B);
	nand(Y,x,x);
endmodule

module _16_BIT_AND(Y,A,B);
	input [15:0]A;
	input [15:0]B;
	output [15:0]Y;
	AND and_1[15:0](Y,A,B);
endmodule