module register_file (
	input clk , rstn , wr_en ,
	input [3:0] rd_addr , rs1_addr , rs2_addr ,
        input [7:0] wr_data ,
	output reg [7:0] rs1_data , rs2_data );
reg [7:0] regs [0:15] ;
integer i ;
always @ (posedge clk or negedge rstn) begin
        if (!rstn) begin
                for (i = 0; i <=15; i=i+1) begin
                        regs[i] <= 8'h00;
                end
        end
        else if (wr_en && rd_addr !=0) begin
                regs[rd_addr] <= wr_data;
        end
end

always @(*) begin
	rs1_data = regs[rs1_addr];
	rs2_data = regs[rs2_addr];
end

endmodule
