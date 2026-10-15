`timescale 1ns / 1ps

module sys_sig(
    output reg clk,
    output reg reset
);

    initial begin
        clk = 1'b0;
        reset = 1'b1;
        #30;
        reset = 1'b0;
    end

    always #5 clk = ~clk;

endmodule