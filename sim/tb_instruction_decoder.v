module tb_instruction_decoder ;

reg [15:0] tb_instr ;
reg tb_zero_flag ;
wire tb_reg_wr_en , tb_imm_sel , tb_branch_en ;
wire [3:0] tb_opcode , tb_rd_addr , tb_rs1_addr , tb_rs2_addr ;
wire [3:0] tb_alu_op ;
wire [7:0] tb_imm ;

instruction_decoder dut (.instr(tb_instr), .zero_flag(tb_zero_flag), .reg_wr_en(tb_reg_wr_en),
			.imm_sel(tb_imm_sel), .branch_en(tb_branch_en), .opcode(tb_opcode),
			.rd_addr(tb_rd_addr), .rs1_addr(tb_rs1_addr), .rs2_addr(tb_rs2_addr),
			.alu_op(tb_alu_op), .imm(tb_imm));

initial begin 

	tb_instr = 16'h0123 ;
	tb_zero_flag = 0 ;
	#10
	
	tb_instr = 16'h1456 ;
	tb_zero_flag = 0 ;
	#10
	
	tb_instr = 16'h278A ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h3BC2 ;
	tb_zero_flag = 0 ;
	#10
	
	tb_instr = 16'h4234 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h5567 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h689A ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h7CDE ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h8123 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'h945F ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hA789 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hBABC ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hCDE5 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hD123 ;
	tb_zero_flag = 1 ;
	#10

	tb_instr = 16'hD123 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hE456 ;
	tb_zero_flag = 1 ;
	#10

	tb_instr = 16'hE456 ;
	tb_zero_flag = 0 ;
	#10

	tb_instr = 16'hF000 ;
	tb_zero_flag = 0 ;
	#10

$finish ;


end
initial begin
	$dumpfile("tb_instruction_decoder.vcd");
	$dumpvars(0,tb_instruction_decoder);
end

endmodule
