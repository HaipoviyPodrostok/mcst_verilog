module pulse_gen_5 (
    input  wire clk,
    input  wire reset,
    output reg  pulse_out
);

    reg [2:0] cnt;

    always @(posedge clk) begin
        if (reset) begin
            cnt       <= 3'd0;
            pulse_out <= 1'b0;
        end else begin
            if (cnt == 3'd4) begin
                cnt       <= 3'd0;
                pulse_out <= 1'b1;
            end else begin
                cnt       <= cnt + 1'b1;
                pulse_out <= 1'b0;
            end
        end
    end

endmodule