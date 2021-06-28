module TB_D_FLIP_FLOP_RE;
    reg d,clk;
    wire q,q_;
    D_FLIP_FLOP_RE d1(q,q_,d,clk);
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
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
    #100 $finish;
end
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