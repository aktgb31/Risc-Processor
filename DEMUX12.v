module NOT(Y,A);
	input A;
	output Y;
	nand(Y,A,A);
endmodule
module AND(Y,A,B);
	input A,B;
	output Y;
	wire x;	
	nand(x,A,B);
	nand(Y,x,x);
endmodule

module DEMUX12(Y1,Y2,S,D);
	output Y1,Y2;
	input S,D;
	wire s;
	NOT n_1(s,S);
	AND and_1(Y1,s,D);
	AND and_2(Y2,S,D);
endmodule
