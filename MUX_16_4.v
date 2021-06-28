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
module OR(Y,A,B);
	input A,B;
	output Y;
	wire x,z;
	nand (x,A,A);
	nand (z,B,B);
	nand (Y,x,z);
endmodule

module MUX21(Y,S,D1,D2);
	output Y;
	input S,D1,D2;
	wire s,d1,d2;
	NOT n_1(s,S);
	AND and_1(d1,D1,s);
	AND and_2(d2,D2,S);
	OR or_1(Y,d1,d2);
endmodule
module MUX_16(Y,S,D1,D2);
output [15:0] Y;
input [15:0] D1,D2;
input S;
MUX21 mux_1[15:0](Y,S,D1,D2);
endmodule



module MUX_16_4(Y,S0,S1,D0,D1,D2,D3);

input [15:0]D0,D1,D2,D3;
input S0,S1;
output [15:0]Y;
wire [15:0]x,y;

MUX_16 mux_1[15:0](x,S0,D0,D1);
MUX_16 mux_2[15:0](y,S0,D2,D3);
MUX_16 mux_3[15:0](Y,S1,x,y);

endmodule
