module tb_program_counter ;

reg tb_clk , tb_rstn , tb_pc_en , tb_branch_en ;
reg [15:0] tb_branch_target ;
wire [15:0] tb_pc_out ;

program_counter dut (.clk(tb_clk), .rstn(tb_rstn), .pc_en(tb_pc_en), .branch_en(tb_branch_en),
			.branch_target(tb_branch_target), .pc_out(tb_pc_out));

initial tb_clk = 0 ;
always #10 tb_clk = ~tb_clk ;

initial begin 

	tb_branch_target = 16'h00A0 ;
	tb_rstn = 0 ;
	tb_pc_en = 1 ;
	tb_branch_en = 1 ;
	#10
	
	tb_rstn = 0 ;
	tb_pc_en = 1 ;
	tb_branch_en = 0 ;
	#10
	
	tb_rstn = 1 ;
	tb_pc_en = 0 ;
	tb_branch_en = 1 ;
	#10

	tb_rstn = 1 ;
	tb_pc_en = 1 ;
	tb_branch_en = 0 ;
	#10
	
	tb_rstn = 1 ;
	tb_pc_en = 0 ;
	tb_branch_en = 0 ;
	#10

	tb_rstn = 1 ;
	tb_pc_en = 1 ;
	tb_branch_en = 1 ;
	#10

$finish ;


end
initial begin
	$dumpfile("tb_program_counter.vcd");
	$dumpvars(0,tb_program_counter);
end

endmodule
