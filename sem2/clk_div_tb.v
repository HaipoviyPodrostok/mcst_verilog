`timescale 10ns / 1ns

module clk_div_tb;

    wire clk;
    wire reset;

    wire clk_div2;
    wire clk_div4;
    wire clk_div8;
    wire [2:0] Q;    
    
    sys_sig clock_reset_gen (
        .clk   (clk),
        .reset (reset)
    );

    clk_div dut (
        .clk      (clk),
        .reset    (reset),
        .clk_div2 (Q[0]),
        .clk_div4 (Q[1]),
        .clk_div8 (Q[2])
    );

    initial begin
        $dumpfile("clk_div.vcd");
        $dumpvars(0, clk_div_tb);

        #200;

        $finish;
    end

endmodule