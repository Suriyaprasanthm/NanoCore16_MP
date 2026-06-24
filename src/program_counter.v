module program_counter (
	input clk , rstn , pc_en , branch_en ,
	input [15:0] branch_target ,
        output reg [15:0] pc_out );
	
always @(posedge clk or negedge rstn) begin
	if(rstn == 1'b0) begin
		pc_out <= 0 ;
	end
	else if ((rstn == 1'b1) & (pc_en == 1'b0)) begin
		pc_out <= pc_out ;
	end	
	else if ((rstn == 1'b1) & (pc_en == 1'b1) & (branch_en == 1'b0)) begin
		pc_out <= pc_out + 1 ;
	end
	else if ((rstn == 1'b1) & (pc_en == 1'b1) & (branch_en == 1'b1)) begin
		pc_out <= branch_target ;
	end

end	

endmodule
