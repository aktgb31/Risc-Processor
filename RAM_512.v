module RAM_512(OUT,D,CLK,W,R,E,ADDR);
output [15:0] OUT ;
input [15:0] D;
input CLK,E,W,R ;
input [8:0]ADDR;
wire [7:0]rs;
wire [15:0]o1,o2,o3,o4,o5,o6,o7,o8;

DECODER_8 Address(rs,E,ADDR[8:6]);
RAM_64 r1(o1,D,CLK,W,R,rs[7],ADDR[5:0]);
RAM_64 r2(o2,D,CLK,W,R,rs[6],ADDR[5:0]);
RAM_64 r3(o3,D,CLK,W,R,rs[5],ADDR[5:0]);
RAM_64 r4(o4,D,CLK,W,R,rs[4],ADDR[5:0]);
RAM_64 r5(o5,D,CLK,W,R,rs[3],ADDR[5:0]);
RAM_64 r6(o6,D,CLK,W,R,rs[2],ADDR[5:0]);
RAM_64 r7(o7,D,CLK,W,R,rs[1],ADDR[5:0]);
RAM_64 r8(o8,D,CLK,W,R,rs[0],ADDR[5:0]);

MUX_16_8 m(OUT,ADDR[6],ADDR[7],ADDR[8],o1,o2,o3,o4,o5,o6,o7,o8);

endmodule

module RAM_64(OUT,D,CLK,W,R,E,ADDR);
output [15:0] OUT ;
input [15:0] D;
input CLK,E,W,R ;
input [5:0]ADDR;
wire [7:0]rs;
wire [15:0]o1,o2,o3,o4,o5,o6,o7,o8;

DECODER_8 Address(rs,E,ADDR[5:3]);
RAM_8 r1(o1,D,CLK,W,R,rs[7],ADDR[2:0]);
RAM_8 r2(o2,D,CLK,W,R,rs[6],ADDR[2:0]);
RAM_8 r3(o3,D,CLK,W,R,rs[5],ADDR[2:0]);
RAM_8 r4(o4,D,CLK,W,R,rs[4],ADDR[2:0]);
RAM_8 r5(o5,D,CLK,W,R,rs[3],ADDR[2:0]);
RAM_8 r6(o6,D,CLK,W,R,rs[2],ADDR[2:0]);
RAM_8 r7(o7,D,CLK,W,R,rs[1],ADDR[2:0]);
RAM_8 r8(o8,D,CLK,W,R,rs[0],ADDR[2:0]);

MUX_16_8 m(OUT,ADDR[3],ADDR[4],ADDR[5],o1,o2,o3,o4,o5,o6,o7,o8);

endmodule

module RAM_8(OUT,D,CLK,W,R,E,ADDR);
output [15:0] OUT ;
input [15:0] D;
input CLK,E,W,R ;
input [2:0]ADDR;
wire [7:0]cs;
wire [15:0]o1,o2,o3,o4,o5,o6,o7,o8;

DECODER_8 Address(cs,E,ADDR);
REG_16BIT r1(o1,D,CLK,W,R,cs[7]);
REG_16BIT r2(o2,D,CLK,W,R,cs[6]);
REG_16BIT r3(o3,D,CLK,W,R,cs[5]);
REG_16BIT r4(o4,D,CLK,W,R,cs[4]);
REG_16BIT r5(o5,D,CLK,W,R,cs[3]);
REG_16BIT r6(o6,D,CLK,W,R,cs[2]);
REG_16BIT r7(o7,D,CLK,W,R,cs[1]);
REG_16BIT r8(o8,D,CLK,W,R,cs[0]);

MUX_16_8 m(OUT,ADDR[0],ADDR[1],ADDR[2],o1,o2,o3,o4,o5,o6,o7,o8);

endmodule

module REG_16BIT(OUT,D,CLK,W,R,CS) ;

output [15:0] OUT ;
input [15:0] D;
input CLK,CS,W,R ;

BIT_BINARY_CELL B[15:0](OUT,D,CLK,W,R,CS) ; 

endmodule 

module BIT_BINARY_CELL(OUT,D,CLK,W,R,CS);
	output OUT;
	input D,CLK,R,W,CS;
	wire w,r,d,q;

	AND a1(w,W,CS) ;
	AND a2(r,R,CS) ;
	MUX21 m1(d,w,q,D) ;
	D_FLIP_FLOP_RE d1(q,,d,CLK) ;
	MUX21 m2(OUT,r,1'bx,q) ;
	
endmodule

module D_FLIP_FLOP_RE(Q,Q_,D,CLK);
    input D,CLK;
    output Q,Q_;
    wire c,q;
    nand(c,CLK,CLK);
    D_LATCH d1(q,,D,c);
    D_LATCH d2(Q,Q_,q,CLK);

endmodule

module D_LATCH(Q,Q_,D,CLK);
    input D,CLK;
    output Q,Q_;
    wire a,b;
    nand(a,D,CLK);
    nand(b,a,CLK);
    nand(Q,Q_,a);
    nand(Q_,Q,b);
endmodule

module DECODER_8(OUT,S,D) ;

output [7:0] OUT ;
input [2:0] D ;
input S ;
wire [1:0] t ;

DECODER_2 d1(t[1:0],S,D[2]);
DECODER_4 d2(OUT[3:0],t[0],D[1:0]) ;
DECODER_4 d3(OUT[7:4],t[1],D[1:0]) ;

endmodule 

module DECODER_4(OUT,S,D) ;

output [3:0] OUT ;
input [1:0] D ;
input S ;
wire [1:0] t ;

DECODER_2 d1(t[1:0],S,D[1]) ;
DECODER_2 d2(OUT[3:2],t[1],D[0]) ;
DECODER_2 d3(OUT[1:0],t[0],D[0]) ;

endmodule 

module DECODER_2(OUT,S,D) ;

output [1:0] OUT ;
input S,D;
wire d;

nand(d,D,D) ;
AND a1(OUT[0],S,D) ;
AND a2(OUT[1],S,d) ;

endmodule 

module MUX_16_8(Y,S0,S1,S2,D0,D1,D2,D3,D4,D5,D6,D7);
	output [15:0]Y;
	input [15:0] D0,D1,D2,D3,D4,D5,D6,D7;
	input S0,S1,S2;
	wire [15:0]x,y;
	
	MUX_16_4 mux_1(x,S0,S1,D0,D1,D2,D3);
	MUX_16_4 mux_2(y,S0,S1,D4,D5,D6,D7);
	MUX21 mux_3[15:0](Y,S2,x,y);
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

module MUX_16(Y,S,D1,D2);
output [15:0] Y;
input [15:0] D1,D2;
input S;
MUX21 mux_1[15:0](Y,S,D1,D2);
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

module AND(Y,A,B);
	input A,B;
	output Y;
	wire x;	
	nand(x,A,B);
	nand(Y,x,x);
endmodule

module NOT(Y,A);
	input A;
	output Y;
	nand(Y,A,A);
endmodule

module OR(Y,A,B);
	input A,B;
	output Y;
	wire x,z;
	nand (x,A,A);
	nand (z,B,B);
	nand (Y,x,z);
endmodule
