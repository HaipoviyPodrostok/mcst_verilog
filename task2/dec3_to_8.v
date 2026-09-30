module decoder_3_to_8 (
    input  wire [2:0] n_in,
    output wire [7:0] vec_out
);

    assign vec_out = 8'b00000001 << n_in;

endmodule