`timescale 1ns / 1ps

module top();

    wire clk;
    wire reset;
    wire [2:0] Q;

    sys_sig sys (clk, reset);

    clk_div divider 
    (
        .clk     (clk),
        .reset   (reset),
        .clk_div (Q[0])
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, top);

        #200;
        $finish;
    end

endmodule