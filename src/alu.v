module alu (
	input [3:0] alu_op ,
	input [7:0] operand_a , operand_b ,
	output reg [7:0] alu_result ,
	output reg  zero_flag , carry_flag);
reg [8:0]c_f ; 

always @(*) begin
	carry_flag = 1'b0;
	case (alu_op)
		4'b0000 : begin 
			alu_result = operand_a + operand_b ;
			c_f = operand_a + operand_b ;
	       		carry_flag = c_f[8] ;
		end

		4'b0001 : begin
			alu_result = operand_a - operand_b ;
			c_f = operand_a - operand_b ;
	       		carry_flag = c_f[8] ;

		end

		4'b0011 : begin
			alu_result = operand_a & operand_b ;
		end

		4'b0100 : begin
			alu_result = operand_a | operand_b ;

		end

		4'b0101 : begin
			alu_result = operand_a ^ operand_b ;

		end

		4'b0110 : begin
			alu_result = ~operand_a ;

		end

		4'b0111 : begin
			alu_result = operand_a << operand_b[2:0] ;

		end

		4'b1000 : begin
			alu_result = operand_a >> operand_b[2:0] ;

		end

		4'b1001 : begin
			alu_result = operand_b ;

		end

		4'b1010 : begin
			alu_result = operand_a ;

		end

		default : alu_result = 8'h00 ;

	endcase

	if(alu_result == 0) begin
		zero_flag = 1 ;
	end
	else begin
		zero_flag = 0 ;
	end
end

endmodule
