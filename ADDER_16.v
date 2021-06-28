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

module ADDER_16(COUT,SUM,IN0,IN1,CIN);
	input CIN;	
	input[15:0] IN0,IN1;
	output COUT;
	output [15:0] SUM;
	wire[14:0] carry;
	FULL_ADDER Full_Adder_1(carry[0],SUM[0],IN0[0],IN1[0],CIN);
	FULL_ADDER Full_Adder_2(carry[1],SUM[1],IN0[1],IN1[1],carry[0]);
	FULL_ADDER Full_Adder_3(carry[2],SUM[2],IN0[2],IN1[2],carry[1]);
	FULL_ADDER Full_Adder_4(carry[3],SUM[3],IN0[3],IN1[3],carry[2]);
	FULL_ADDER Full_Adder_5(carry[4],SUM[4],IN0[4],IN1[4],carry[3]);
	FULL_ADDER Full_Adder_6(carry[5],SUM[5],IN0[5],IN1[5],carry[4]);
	FULL_ADDER Full_Adder_7(carry[6],SUM[6],IN0[6],IN1[6],carry[5]);
	FULL_ADDER Full_Adder_8(carry[7],SUM[7],IN0[7],IN1[7],carry[6]);
	FULL_ADDER Full_Adder_9(carry[8],SUM[8],IN0[8],IN1[8],carry[7]);
	FULL_ADDER Full_Adder_10(carry[9],SUM[9],IN0[9],IN1[9],carry[8]);
	FULL_ADDER Full_Adder_11(carry[10],SUM[10],IN0[10],IN1[10],carry[9]);
	FULL_ADDER Full_Adder_12(carry[11],SUM[11],IN0[11],IN1[11],carry[10]);
	FULL_ADDER Full_Adder_13(carry[12],SUM[12],IN0[12],IN1[12],carry[11]);
	FULL_ADDER Full_Adder_14(carry[13],SUM[13],IN0[13],IN1[13],carry[12]);
	FULL_ADDER Full_Adder_15(carry[14],SUM[14],IN0[14],IN1[14],carry[13]);
	FULL_ADDER Full_Adder_16(COUT,SUM[15],IN0[15],IN1[15],carry[14]);
endmodule 

