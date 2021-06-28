module TB_REG_16BIT ;

wire [15:0] OUT ;
reg [15:0] D;
reg CLK,CS,W,R ;

REG_16BIT B(OUT,D,CLK,W,R,CS) ;

initial
begin 
	CLK = 1'b1 ;
end

always 
begin 
	CLK = ~CLK ; #5 ;
end 

initial
begin
	D = 1465 ; CS = 1'b0 ; W = 1'b0 ; R = 1'b0 ; #5 ; 
	D = 325 ; CS = 1'b0 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 4362 ; CS = 1'b0 ; W = 1'b0 ; R = 1'b1 ; #5 ;
	D = 724 ; CS = 1'b0 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 345 ; CS = 1'b1 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 45 ; CS = 1'b1 ; W = 1'b0 ; R = 1'b1 ; #5 ;
	D = 64 ; CS = 1'b1 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 3264 ; CS = 1'b1 ; W = 1'b0 ; R = 1'b1 ; #5 ;
	D = 263 ; CS = 1'b1 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 643 ; CS = 1'b0 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	D = 42 ; CS = 1'b0 ; W = 1'b1 ; R = 1'b0 ; #5 ;
	#100 $finish;
end

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