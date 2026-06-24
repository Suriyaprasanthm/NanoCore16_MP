module instruction_memory (
	input [15:0]addr ,
	output reg [15:0]instr );

reg [15:0] mem [0:255] ;

initial begin
	$readmemh ("/home/user21/user_sur/projects/NanoCore16_MP/program.hex",mem);
end
//assign instr = mem[addr[7:0]];
always @(*) begin
	if (addr[15:8] != 0) begin
		instr = 16'hF000 ;
	end
	else begin
		instr = mem[addr[7:0]];	
	end
end
endmodule
