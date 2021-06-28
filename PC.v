module PC(OUT,D,CLK,W,R,CS,RE,INC,L);
	input RE,CLK,CS,W,R,INC,L;
	input [15:0]D;
	output [15:0]OUT;
	wire[15:0] d,d_,d__,d1,v;
	MUX_16 m1(d,L,OUT,D);
	INCREMENTOR_16 i(,d1,d);
	AND a1[15:0](v,d,d);
	MUX_16 m2(d_,INC,v,d);
	MUX_16 m3(d__,RE,d_,16'b0);
	REG_16BIT r(OUT,d__,CLK,W,R,CS);
endmodule

module INCREMENTOR_16(COUT,OU,IN);

	input[15:0] IN;
	output COUT;
	output [15:0] OU;
	wire[14:0] carry;
	HALF_ADDER Half_Adder_1(carry[0],OU[0],IN[0],1'b1);
	HALF_ADDER Half_Adder_2(carry[1],OU[1],IN[1],carry[0]);
	HALF_ADDER Half_Adder_3(carry[2],OU[2],IN[2],carry[1]);
	HALF_ADDER Half_Adder_4(carry[3],OU[3],IN[3],carry[2]);
	HALF_ADDER Half_Adder_5(carry[4],OU[4],IN[4],carry[3]);
	HALF_ADDER Half_Adder_6(carry[5],OU[5],IN[5],carry[4]);
	HALF_ADDER Half_Adder_7(carry[6],OU[6],IN[6],carry[5]);
	HALF_ADDER Half_Adder_8(carry[7],OU[7],IN[7],carry[6]);
	HALF_ADDER Half_Adder_9(carry[8],OU[8],IN[8],carry[7]);
	HALF_ADDER Half_Adder_10(carry[9],OU[9],IN[9],carry[8]);
	HALF_ADDER Half_Adder_11(carry[10],OU[10],IN[10],carry[9]);
	HALF_ADDER Half_Adder_12(carry[11],OU[11],IN[11],carry[10]);
	HALF_ADDER Half_Adder_13(carry[12],OU[12],IN[12],carry[11]);
	HALF_ADDER Half_Adder_14(carry[13],OU[13],IN[13],carry[12]);
	HALF_ADDER Half_Adder_15(carry[14],OU[14],IN[14],carry[13]);
	HALF_ADDER Half_Adder_16(COUT,OU[15],IN[15],carry[2]);
endmodule 

module HALF_ADDER(COUT,SUM,IN0,IN1);
	input IN0,IN1;
	output COUT,SUM;
	wire t1,t2,t3;
	nand(t1,IN0,IN1);
	nand(t2,t1,IN0);
	nand(t3,t1,IN1);
	nand(SUM,t2,t3);
	nand(COUT,t1,t1);
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

module MUX_16(Y,S,D1,D2);
output [15:0] Y;
input [15:0] S,D1,D2;
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
