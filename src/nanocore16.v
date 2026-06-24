module nanocore16 (
	input clk , rstn , pc_en ,
	output [7:0]alu_result,
	output zero_flag , carry_flag ,
	input [15:0]branch_target );

wire [15:0] pc_out , instr ;
wire  imm_sel , branch_en , wr_en ;
wire [3:0] rd_addr , rs1_addr , rs2_addr , alu_op ;
wire [7:0]imm ,rs1_data , rs2_data , operand_a , operand_b , operand_sel;


program_counter dut1 (.clk(clk), .rstn(rstn), .branch_en(branch_en), .branch_target(branch_target), .pc_en(pc_en), .pc_out(pc_out));

instruction_memory dut2 (.addr(pc_out), .instr(instr));

instruction_decoder dut3 (.instr(instr), .zero_flag(zero_flag), .reg_wr_en(wr_en), .imm_sel(imm_sel), .branch_en(branch_en), .rd_addr(rd_addr), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .alu_op(alu_op), .imm(imm));

register_file dut4 (.clk(clk), .rstn(rstn), .wr_en(wr_en), .wr_data(alu_result), .rd_addr(rd_addr), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rs1_data(operand_a), .rs2_data(rs2_data));

assign operand_sel = (imm_sel == 1'b1) ? imm : rs2_data ;

alu dut5 (.operand_a(operand_a), .operand_b(operand_sel), .alu_op(alu_op), .zero_flag(zero_flag), .carry_flag(carry_flag), .alu_result(alu_result));

endmodule 
