module ram #(
    parameter MEM_SIZE  = 16,
    parameter DATA_W    = 8,                 
    parameter ADDR_SIZE = $clog2(MEM_SIZE)
)(
    input                       clock,
    input                       write,
    input      [DATA_W-1:0]     datain,
    input      [ADDR_SIZE-1:0]  addr_w,
    input                       read,
    input      [ADDR_SIZE-1:0]  addr_r,
    output reg [DATA_W-1:0]     dataout
);

    reg [DATA_W-1:0] mem [0:MEM_SIZE-1];

    always @(posedge clock) begin

        if (write)
            mem[addr_w] <= datain;

        if (read)
            dataout <= mem[addr_r];
    end

endmodule
