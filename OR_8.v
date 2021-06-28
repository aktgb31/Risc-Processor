module OR(Y,A,B);
	input A,B;
	output Y;
	wire x,z;
	nand (x,A,A);
	nand (z,B,B);
	nand (Y,x,z);
endmodule

module OR_8(Y,IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7);
	input IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7;
	output Y;
	wire w1,w2,w3,w4,w5,w6;
	OR or_1(w1,IN0,IN1);
	OR or_2(w2,w1,IN2);
	OR or_3(w3,w2,IN3);
	OR or_4(w4,w3,IN4);
	OR or_5(w5,w4,IN5);
	OR or_6(w6,w5,IN6);
	OR or_7(Y,w6,IN7);
endmodule