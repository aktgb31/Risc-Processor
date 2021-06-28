module TB_xyModulo2 ;

wire [31:0] Out;
reg [15:0] D;
reg [1:0] addr;
reg r, w,clk,e;


xyModulo2 m(Out,D,clk,e,w,r,addr);

initial 
begin 
	e = 1'b1 ;
	clk = 1'b0 ;
end

always
begin
	clk = ~clk; #1 ;
end

initial 
begin
	addr = 0; D = 8; w = 1; #10;
	addr = 1; D = 4; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; D = 100; w = 1; #10;
	addr = 1; D = 1; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; D = 65535; w = 1; #10;
	addr = 1; D = 32000; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;
	#100 $finish;
end
endmodule

module xyModulo2(OUT,D,CLK,E,W,R,ADDR);

output reg [31:0] OUT;
input [15:0] D;
input [1:0]ADDR;
input R, W, CLK,E;

reg [15:0] ram[1:0];
reg [15:0] out_ram;

always @(posedge CLK) 
begin
	if(W) 
		ram[ADDR] = D;
	if(R)
	begin
		if(ADDR>1)
			OUT = out_ram;
		else
			OUT = {{32-16{1'b0}}, ram[ADDR]};
	end
end

reg[15:0] answer;
reg [15:0] x, y;
integer i;
always @(ram[0] or ram[1])
begin
	assign x = ram[0];
	assign y = ram[1];
	
	answer=x%(x-y);
	out_ram = answer;
end
endmodule
