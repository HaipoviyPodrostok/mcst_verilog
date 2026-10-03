module clk_div (
    input  wire clk,
    input  wire reset,
    output reg  clk_div2,
    output reg  clk_div4,
    output reg  clk_div8
);

    always @(posedge clk) begin
        if (reset) begin
            {clk_div2, clk_div4, clk_div8} <= 3'h0;
        end else begin
            clk_div2 <= ~clk_div2;
            clk_div4 <= clk_div4 ^ clk_div2;
            clk_div8 <= clk_div8 ^ (clk_div2 & clk_div4);
        end
    end

endmodule