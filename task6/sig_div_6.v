module clk_divider_6 (
    input  wire clk,
    input  wire reset,
    output reg  clk_out
);

    reg [1:0] cnt;

    always @(posedge clk) begin
        if (reset) begin
            cnt     <= 2'd0;
            clk_out <= 1'b0;
        end else begin
            if (cnt == 2'd2) begin
                cnt     <= 2'd0;
                clk_out <= ~clk_out;
            end else begin
                cnt     <= cnt + 1'b1;
            end
        end
    end

endmodule