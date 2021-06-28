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


module ADDER_4(COUT,SUM,IN0,IN1,CIN);
	input CIN;	
	input[3:0] IN0,IN1;
	output COUT;
	output [3:0] SUM;
	wire[2:0] carry;
	FULL_ADDER Full_Adder_1(carry[0],SUM[0],IN0[0],IN1[0],CIN);
	FULL_ADDER Full_Adder_2(carry[1],SUM[1],IN0[1],IN1[1],carry[0]);
	FULL_ADDER Full_Adder_3(carry[2],SUM[2],IN0[2],IN1[2],carry[1]);
	FULL_ADDER Full_Adder_4(COUT,SUM[3],IN0[3],IN1[3],carry[2]);
endmodule 

