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

module TESTBENCH_INCREMENTOR_16;
	wire [15:0]Y;
	wire carry;
	reg [15:0] s;
	INCREMENTOR_16 incrementor_16_1(carry,Y,s);	
	integer i;
    initial
		begin
        for(i=0;i<=65535;i=i+1)
        begin
           #1 s=i;
        end
        #100$finish;
		end
endmodule



