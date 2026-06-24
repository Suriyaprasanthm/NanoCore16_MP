`timescale 1ns/1ps

module alu_tb;

    reg  [3:0] alu_op;
    reg  [7:0] operand_a;
    reg  [7:0] operand_b;

    wire [7:0] alu_result;
    wire       zero_flag;
    wire       carry_flag;

    // DUT Instantiation
    alu dut (
        .alu_op(alu_op),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_result(alu_result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag)
    );

    initial begin
        // Create VCD file
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $display("Time\tOP\tA\tB\tResult\tZero\tCarry");
        $monitor("%0t\t%h\t%h\t%h\t%h\t%b\t%b",
                 $time, alu_op, operand_a, operand_b,
                 alu_result, zero_flag, carry_flag);

        // ADD
        alu_op = 4'b0000; operand_a = 8'h15; operand_b = 8'h0A;
        #10;

        // SUB
        alu_op = 4'b0001; operand_a = 8'h20; operand_b = 8'h10;
        #10;

        // AND
        alu_op = 4'b0011; operand_a = 8'hF0; operand_b = 8'h0F;
        #10;

        // OR
        alu_op = 4'b0100; operand_a = 8'hF0; operand_b = 8'h0F;
        #10;

        // XOR
        alu_op = 4'b0101; operand_a = 8'hAA; operand_b = 8'h55;
        #10;

        // NOT
        alu_op = 4'b0110; operand_a = 8'hAA; operand_b = 8'h00;
        #10;

        // SHIFT LEFT
        alu_op = 4'b0111; operand_a = 8'h01; operand_b = 8'd3;
        #10;

        // SHIFT RIGHT
        alu_op = 4'b1000; operand_a = 8'h80; operand_b = 8'd3;
        #10;

        // PASS B
        alu_op = 4'b1001; operand_a = 8'h12; operand_b = 8'h34;
        #10;

        // PASS A
        alu_op = 4'b1010; operand_a = 8'h56; operand_b = 8'h78;
        #10;

        // ZERO FLAG TEST
        alu_op = 4'b0101; operand_a = 8'hAA; operand_b = 8'hAA;
        #10;

        // DEFAULT CASE
        alu_op = 4'b1111; operand_a = 8'hFF; operand_b = 8'hFF;
        #10;

        $display("Simulation Finished");
        $finish;
    end

endmodule
