`timescale 1ns / 1ps

module is_even_tb;

    reg  [7:0] t_num_in;
    wire       t_even_out;

    is_even dut (
        .num_in   (t_num_in),
        .even_out (t_even_out)
    );

    initial begin
        $dumpfile("is_even.vcd");
        $dumpvars(0, is_even_tb);

        // чет
        t_num_in = 8'd0; #10;
        
        // нечет
        t_num_in = 8'd1; #10;
        
        // чет
        t_num_in = 8'd4; #10;
        
        // нечет
        t_num_in = 8'd255; #10;

        $finish;
    end

endmodule