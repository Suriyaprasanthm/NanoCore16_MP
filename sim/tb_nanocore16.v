module tb_nanocore16 ;
reg tb_clk , tb_rstn , tb_pc_en;
reg [15:0]tb_branch_target ;
wire [7:0] tb_alu_result ;
wire tb_zero_flag , tb_carry_flag ;

nanocore16 dut (.clk(tb_clk), .rstn(tb_rstn), .alu_result(tb_alu_result), .zero_flag(tb_zero_flag), .carry_flag(tb_carry_flag), .pc_en(tb_pc_en), .branch_target(tb_branch_target));

    initial begin
        tb_clk = 0;
        forever #5 tb_clk = ~tb_clk;
    end

    initial begin
        tb_rstn = 0;
        tb_pc_en = 0;
        tb_branch_target = 16'h0000;

        #20;
        tb_rstn = 1;
        tb_pc_en = 1;

        #500;

        $finish;
    end
initial begin
	$dumpfile("tb_nanocore16.fsdb");
	$dumpvars(0,tb_nanocore16);
end
endmodule	
