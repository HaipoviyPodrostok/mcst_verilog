module clk_div
(
    input   wire    clk,
    input   wire    reset,
    output  reg     clk_div
);

reg [2:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        clk_div <= 3'd0;
        counter <= 1'b0;
    end else begin
        if (counter == 3'd4) begin
            counter <= 3'd0;
            clk_div <= 1'b1;
        end else begin
            counter <= counter + 1'b1;
            clk_div <= 1'b0;
        end
    end
end

endmodule