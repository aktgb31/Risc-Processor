module D_FLIP_FLOP_RE_ASR_LOW(Q,Q_,D,CLK,R);
    input D,CLK,R;
    output Q,Q_;
    wire c,q,r;

    nand(c,CLK,CLK);

    D_LATCH_RESET d1(q,,D,c,R);
    D_LATCH_RESET d2(Q,Q_,q,CLK,R);

endmodule

module D_LATCH_RESET(Q,Q_,D,CLK,R);
    input D,CLK,R;
    output Q,Q_;
    wire a,b,d_;

    nand(d_,D,D);
    nand(a,D,CLK);
    nand(b,d_,CLK);
    NAND3 n1(Q,1'b1,Q_,a);
    NAND3 n2(Q_,R,Q,b);
endmodule

module NAND3(Y,A,B,C);
output Y;
input A,B,C;
wire x,y;
AND a1(x,A,B);
AND a2(y,x,C);
nand (Y,y,y);
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
