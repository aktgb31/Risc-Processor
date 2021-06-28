module TB_D_FLIP_FLOP_RE_SR;
    reg d,clk,r;
    wire q,q_;
    D_FLIP_FLOP_RE_SR d1(q,q_,d,clk,r);
    initial
    begin
       clk=1'b1; 
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

module D_FLIP_FLOP_RE_SR(Q,Q_,D,CLK,R);
    input D,CLK,R;
    output Q,Q_;
    wire r,d;
    nand(r,R,R);
    AND and_1(d,D,r);
    D_FLIP_FLOP_RE d1(Q,Q_,d,CLK);

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

module AND(Y,A,B);
	input A,B;
	output Y;
	wire x;	
	nand(x,A,B);
	nand(Y,x,x);
endmodule

