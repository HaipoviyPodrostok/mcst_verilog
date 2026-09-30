`timescale 1ns / 1ps

module decoder_3_to_8_tb;

    reg  [2:0] t_n_in;
    wire [7:0] t_vec_out;

    decoder_3_to_8 dut (
        .n_in    (t_n_in),
        .vec_out (t_vec_out)
    );

    initial begin
        $dumpfile("decoder_3_to_8.vcd");
        $dumpvars(0, decoder_3_to_8_tb);

        t_n_in = 3'd0; #10; // Ожидается 00000001
        t_n_in = 3'd3; #10; // Ожидается 00001000
        t_n_in = 3'd7; #10; // ожидается 10000000 

        $finish;
    end

endmodule