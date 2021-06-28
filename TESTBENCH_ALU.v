module NOT(Y,A);
	input A;
	output Y;
	nand(Y,A,A);
endmodule

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

module AND(Y,A,B);
	input A,B;
	output Y;
	wire x;	
	nand(x,A,B);
	nand(Y,x,x);
endmodule

module MUX21(Y,S,D1,D2);
	output Y;
	input S,D1,D2;
	wire s,d1,d2;
	NOT n_1(s,S);
	AND and_1(d1,D1,s);
	AND and_2(d2,D2,S);
	OR or_1(Y,d1,d2);
endmodule

module NEGATOR_16(Y,IN);
    
    output [15:0]Y;
    input [15:0]IN;
        
    nand(Y[0],IN[0],IN[0]);
    nand(Y[1],IN[1],IN[1]);
    nand(Y[2],IN[2],IN[2]);
    nand(Y[3],IN[3],IN[3]);
    nand(Y[4],IN[4],IN[4]);
    nand(Y[5],IN[5],IN[5]);
    nand(Y[6],IN[6],IN[6]);
    nand(Y[7],IN[7],IN[7]);
    nand(Y[8],IN[8],IN[8]);
    nand(Y[9],IN[9],IN[9]);
    nand(Y[10],IN[10],IN[10]);
    nand(Y[11],IN[11],IN[11]);
    nand(Y[12],IN[12],IN[12]);
    nand(Y[13],IN[13],IN[13]);
    nand(Y[14],IN[14],IN[14]);
    nand(Y[15],IN[15],IN[15]);
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

module ALU(out,x,y,zr,ng,zx,nx,zy,ny,f,no);
    input [15:0] x,y;
    output [15:0] out;
    output zr,ng;
	input  zx,nx,zy,ny,f,no;
    wire [15:0] x1,y1,xinv,yinv,xf,yf,fadd,fand,fout,foutn;
    MUX21 mux21_1[15:0](x1,zx,x,16'b0000000000000000);
    MUX21 mux21_2[15:0](y1,zy,y,16'b0000000000000000);
    NEGATOR_16 negator_16_1(xinv,x1);
    NEGATOR_16 negator_16_2(yinv,y1);
    MUX21 mux21_3[15:0](xf,nx,x1,xinv);
    MUX21 mux21_4[15:0](yf,ny,y1,yinv);
    ADDER_16 adder_16_1(,fadd,xf,yf,1'b0);
    AND and_1[15:0](fand,xf,yf);
    MUX21 mux21_5[15:0](fout,f,fand,fadd);
    NEGATOR_16 negator_16_3(foutn,fout);
    MUX21 mux21_6[15:0](out,no,fout,foutn);
	wire zr_1,zr_2,zr_3;
	OR_8 or_8_1(zr_1,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]);
	OR_8 or_8_2(zr_2,out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]);
	OR or_1(zr_3,zr_1,zr_2);
	NOT not_1(zr,zr_3);
	assign ng=out[15];
endmodule


module TESTBENCH_ALU;
	reg [15:0] in0,in1;
	wire zr,ng;
    wire [15:0] out;
	reg zx,nx,zy,ny,f,no;
	integer i,j;
	ALU alu_1(out,in0,in1,zr,ng,zx,nx,zy,ny,f,no);
	initial
		begin	
			i=3;j=5;
	#10	in0=i;in1=j; zx=1'b1; nx=1'b0; zy=1'b1; ny=1'b0; f=1'b1; no=1'b0;
  	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b1; ny=1'b1; f=1'b1; no=1'b1; 
  	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b1; ny=1'b0; f=1'b1; no=1'b0; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b1; ny=1'b1; f=1'b0; no=1'b0; 
 	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b0; ny=1'b0; f=1'b0; no=1'b0; 
 	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b1; ny=1'b1; f=1'b0; no=1'b1; 
 	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b0; ny=1'b0; f=1'b0; no=1'b1; 
 	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b1; ny=1'b1; f=1'b1; no=1'b1; 
	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b0; ny=1'b0; f=1'b1; no=1'b1; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b1; zy=1'b1; ny=1'b1; f=1'b1; no=1'b1; 
  	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b0; ny=1'b1; f=1'b1; no=1'b1; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b1; ny=1'b1; f=1'b1; no=1'b0; 
  	#10 in0=i;in1=j; zx=1'b1; nx=1'b1; zy=1'b0; ny=1'b0; f=1'b1; no=1'b0; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b0; ny=1'b0; f=1'b1; no=1'b0; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b1; zy=1'b0; ny=1'b0; f=1'b1; no=1'b1; 
 	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b0; ny=1'b1; f=1'b1; no=1'b1;
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b0; zy=1'b0; ny=1'b0; f=1'b0; no=1'b0; 
  	#10 in0=i;in1=j; zx=1'b0; nx=1'b1; zy=1'b0; ny=1'b1; f=1'b0; no=1'b1;
	#100 $finish;
end
endmodule


