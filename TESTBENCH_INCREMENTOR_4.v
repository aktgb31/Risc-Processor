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


module INCREMENTOR_4(COUT,OU,IN);

	input[3:0] IN;
	output COUT;
	output [3:0] OU;
	wire[2:0] carry;
	HALF_ADDER Half_Adder_1(carry[0],OU[0],IN[0],1'b1);
	HALF_ADDER Half_Adder_2(carry[1],OU[1],IN[1],carry[0]);
	HALF_ADDER Half_Adder_3(carry[2],OU[2],IN[2],carry[1]);
	HALF_ADDER Half_Adder_4(COUT,OU[3],IN[3],carry[2]);
endmodule 

module TESTBENCH_INCREMENTOR_4;
	wire [3:0]Y;
	wire carry;
	reg [3:0] s;
    reg cin;
	INCREMENTOR_4 incrementor_4_1(carry,Y,s);	
	integer i,j;
    initial
		begin
        for(i=0;i<=15;i=i+1)
        begin
           #10 s=i;
        end
        #100$finish;
		end
endmodule


