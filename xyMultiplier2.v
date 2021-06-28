module xyMultiplier2(OUT,D,CLK,E,W,R,ADDR);

output reg [31:0] OUT;
input [15:0] D;
input [1:0]ADDR;
input R, W, CLK,E;

reg [15:0] ram[1:0];
reg [31:0] out_ram;

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

reg[31:0] product;
reg [15:0] x, y;
integer i;
always @(ram[0] or ram[1])
begin
	assign x = ram[0]+ram[1];
	assign y = ram[0]-ram[1];

	product = 0;
	for ( i = 0; i < 16; i= i+1)
	begin
		if ( x[i])
			product =  product + (y<< i);
	end
	out_ram = product;
end
endmodule
