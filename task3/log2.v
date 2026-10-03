module log2_exact (
    input  wire [7:0] pow2_in,
    output wire [2:0] log_out
);

    assign log_out = pow2_in[7] ? 3'd7 :
                     pow2_in[6] ? 3'd6 :
                     pow2_in[5] ? 3'd5 :
                     pow2_in[4] ? 3'd4 :
                     pow2_in[3] ? 3'd3 :
                     pow2_in[2] ? 3'd2 :
                     pow2_in[1] ? 3'd1 : 3'd0;

endmodule