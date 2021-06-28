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
