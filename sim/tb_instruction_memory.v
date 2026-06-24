module tb_instruction_memory ;

reg [15:0] tb_addr ;
wire [15:0] tb_instr ;

instruction_memeory dut (.addr(tb_addr), .instr(tb_instr));

initial begin 

	tb_addr = 16'h0000 ;
	#10
	
	tb_addr = 16'h0001 ;
	#10
	
	tb_addr = 16'h0002 ;
	#10

	tb_addr = 16'h0100 ;
	#10
	
	tb_addr = 16'hFF05 ;
	#10

	tb_addr = 16'h0003 ;
	#10

$finish ;


end
initial begin
	$dumpfile("tb_instruction_memory.vcd");
	$dumpvars(0,tb_instruction_memory);
end

endmodule
