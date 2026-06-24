module instruction_decoder (
	input [15:0] instr ,
	input zero_flag , 
	output reg reg_wr_en , imm_sel , branch_en ,
	output [3:0] rd_addr,rs1_addr,rs2_addr,
	output reg [3:0]alu_op,
	output [7:0] imm );

//assign opcode =  instr[15:12];
assign rd_addr = instr[11:8];
assign rs1_addr = instr[7:4];
assign rs2_addr = instr[3:0];
assign imm = {{4{instr[3]}},instr[3:0]};

always @(*) begin
	case(instr[15:12])
		4'b0000 : begin
		       	alu_op = 4'b0000 ; 
			reg_wr_en = 1'b1 ; 
			imm_sel = 1'b0 ; 
			branch_en = 1'b0 ;
	       	end
		4'b0001 : begin 
		alu_op = 4'b0001 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b0010 : begin 
		alu_op = 4'b0000 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b1 ;
	       	branch_en = 1'b0 ;
		end
		4'b0011 : begin 
		alu_op = 4'b0011 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b0100 : begin 
		alu_op = 4'b0100 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b0101 : begin 
		alu_op = 4'b0101 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b0110 : begin 
		alu_op = 4'b0110 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b0111 : begin 
		alu_op = 4'b0111 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b1 ;
	       	branch_en = 1'b0 ;
		end
		4'b1000 : begin 
		alu_op = 4'b1000 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b1 ;
	       	branch_en = 1'b0 ;
		end
		4'b1001 : begin 
		alu_op = 4'b1001 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b1 ;
	       	branch_en = 1'b0 ;
		end
		4'b1010 : begin 
		alu_op = 4'b1010 ;
	       	reg_wr_en = 1'b1 ;
	       	imm_sel = 1'b0 ;
	       	branch_en = 1'b0 ;
		end
		4'b1011 : begin 
		alu_op = 4'b0001 ;
	       	reg_wr_en = 1'b0 ;
	       	imm_sel = 1'b0 ; 
		branch_en = 1'b0 ;
		end
		4'b1100 : begin 
		alu_op = 4'bxxxx ; 
		reg_wr_en = 1'b0 ; 
		imm_sel = 1'bx ; 
		branch_en = 1'b1 ;
		end
		4'b1101 : begin 
		alu_op = 4'bxxxx ;
	       	reg_wr_en = 1'b0 ;
	       	imm_sel = 1'bx ;
	       	branch_en = zero_flag ;
		end
		4'b1110 : begin 
		alu_op = 4'bxxxx ;
	       	reg_wr_en = 1'b0 ;
	       	imm_sel = 1'bx ;
	       	branch_en = ~zero_flag ;
		end
		4'b1111 : begin 
		alu_op = 4'bxxxx ; 
		reg_wr_en = 1'b0 ; 
		imm_sel = 1'bx ; 
		branch_en = 1'b0 ;
		end
	endcase
end


endmodule 
