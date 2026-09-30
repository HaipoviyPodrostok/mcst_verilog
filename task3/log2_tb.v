`timescale 1ns / 1ps

module log2_exact_tb;

    reg  [7:0] t_pow2_in;
    wire [2:0] t_log_out;

    log2_exact dut (
        .pow2_in (t_pow2_in),
        .log_out (t_log_out)
    );

    initial begin
        $dumpfile("log2_exact.vcd");
        $dumpvars(0, log2_exact_tb);

        t_pow2_in = 8'd1;   #10; // 2^0 -> выход 0
        t_pow2_in = 8'd2;   #10; // 2^1 -> выход 1
        t_pow2_in = 8'd16;  #10; // 2^4 -> выход 4
        t_pow2_in = 8'd128; #10; // 2^7 -> выход 7
        
        $finish;
    end

endmodule