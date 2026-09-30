module is_even (
    input  wire [7:0] num_in,
    output wire       even_out
);

    assign even_out = ~num_in[0];

endmodule