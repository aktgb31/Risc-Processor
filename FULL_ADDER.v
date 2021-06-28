module OR(Y,A,B);
	input A,B;
	output Y;
	wire x,z;
	nand (x,A,A);
	nand (z,B,B);
	nand (Y,x,z);
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

module FULL_ADDER(COUT,SUM,IN0,IN1,CIN);
	input IN0,IN1,CIN;
	output COUT,SUM;
	wire wc1,wc2,wsum;
	HALF_ADDER Half_Adder_1(wc,wsum,IN0,IN1);
	HALF_ADDER Half_Adder_2(wc2,SUM,wsum,CIN);
	OR or_1(COUT,wc,wc2);
endmodule

