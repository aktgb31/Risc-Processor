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

module TESTBENCH_HALF_ADDER;
	wire sum;
	wire carry;
	reg  s0,s1;
	HALF_ADDER half_adder_1(carry,sum,s0,s1);
	
	initial
		begin
		#10 s0=1'b0;s1=1'b0;
		#10 s0=1'b0;s1=1'b1;
		#10 s0=1'b1;s1=1'b0;	
		#10 s0=1'b1;s1=1'b1;
		#100$finish;
		end
endmodule
	