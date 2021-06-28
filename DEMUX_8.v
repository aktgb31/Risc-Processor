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

module DEMUX_4(Y0,Y1,Y2,Y3,S0,S1,D);
input S0,S1,D;
output Y0,Y1,Y2,Y3;
wire x,y;
DEMUX12 mux_1(x,y,S0,D);
DEMUX12 mux_2(Y0,Y1,S1,x);
DEMUX12 mux_3(Y2,Y3,S1,y);
endmodule

module DEMUX_8(Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,S0,S1,S2,D);
output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
input S0,S1,S2,D;
wire a,b,c,d;
DEMUX_4 mux_1(a,b,c,d,S0,S1,D);
DEMUX12 mux_2(Y0,Y1,S2,a);
DEMUX12 mux_3(Y2,Y3,S2,b);
DEMUX12 mux_4(Y4,Y5,S2,c);
DEMUX12 mux_5(Y6,Y7,S2,d);
endmodule
