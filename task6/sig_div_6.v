module clk_div
(
    input   wire    clk,
    input   wire    reset,
    output  reg     clk_div
);

reg [2:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        clk_div <= 3'h0;
        counter <= 1'h0;
    end else begin
        if (counter == 3'd2) begin
            counter <= 3'h0;
            clk_div <= ~clk_div;
        end else begin
            counter <= counter + 1'b1;
        end
    end
end

endmodule