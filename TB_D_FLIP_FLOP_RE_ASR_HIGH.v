module TB_D_FLIP_FLOP_RE_ASR_HIGH;
wire q,q_ ;
reg d,clk,r ;

D_FLIP_FLOP_RE_ASR_HIGH D(q,q_,d,clk,r);

initial 
begin 
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end 

initial
begin
	d = 1'b0 ; r = 1'b0 ; #10 ; 
	d = 1'b1 ; #5 ; r = 1'b1 ; #5 ; r = 1'b0 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #5 ; r = 1'b1 ; #5 ;
	#100 $finish; 
end
endmodule
module D_FLIP_FLOP_RE_ASR_HIGH(Q,Q_,D,CLK,R);
    input D,CLK,R;
    output Q,Q_;
    wire c,q,r;

    nand(r,R,R);
    nand(c,CLK,CLK);

    D_LATCH_RESET d1(q,,D,c,r);
    D_LATCH_RESET d2(Q,Q_,q,CLK,r);

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
