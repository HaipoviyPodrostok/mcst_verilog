`timescale 1ns / 1ps

module priority_encoder_8_to_3_tb;

    reg  [7:0] t_vec_in;
    wire [2:0] t_pos_out;

    priority_encoder_8_to_3 dut (
        .vec_in  (t_vec_in),
        .pos_out (t_pos_out)
    );

    initial begin
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, priority_encoder_8_to_3_tb);

        t_vec_in = 8'b00000010; #10; // Выход: 1

        t_vec_in = 8'b01010010; #10; // Выход: 6

        t_vec_in = 8'b11111111; #10; // Выход: 7

        $finish;
    end

endmodule