module priority_encoder_8_to_3 (
    input   wire    [7:0] in,
    output  wire    [2:0] out,
    output  wire    valid
);

    assign out = in[7] ? 3'd7 :
                 in[6] ? 3'd6 :
                 in[5] ? 3'd5 :
                 in[4] ? 3'd4 :
                 in[3] ? 3'd3 :
                 in[2] ? 3'd2 :
                 in[1] ? 3'd1 : 
                 3'd0;

    assign valid = |in;

endmodule