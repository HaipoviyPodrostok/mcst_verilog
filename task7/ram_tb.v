module ram_tb;

    localparam MEM_SIZE = 16;
    localparam DATA_W   = 8;
    localparam ADDR_W   = $clog2(MEM_SIZE);

    reg               clock;
    reg               write;
    reg  [DATA_W-1:0] datain;
    reg  [ADDR_W-1:0] addr_w;
    reg               read;
    reg  [ADDR_W-1:0] addr_r;
    wire [DATA_W-1:0] dataout;

    integer errors;

    ram #(
        .MEM_SIZE (MEM_SIZE),
        .DATA_W   (DATA_W)
    ) dut (
        .clock   (clock),
        .write   (write),
        .datain  (datain),
        .addr_w  (addr_w),
        .read    (read),
        .addr_r  (addr_r),
        .dataout (dataout)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    task check(input [DATA_W-1:0] expected);
        begin
            if (dataout !== expected) begin
                $display("ERROR t=%0t: dataout=%h, expected=%h", $time, dataout, expected);
                errors = errors + 1;
            end
            else
                $display("OK    t=%0t: dataout=%h", $time, dataout);
        end
    endtask

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars(0, ram_tb);

        errors = 0;
        write  = 0;
        read   = 0;
        datain = 0;
        addr_w = 0;
        addr_r = 0;

        @(negedge clock); write = 1; addr_w = 3; datain = 8'hAA;
        @(negedge clock); write = 1; addr_w = 5; datain = 8'h55;
        @(negedge clock); write = 0;

        @(negedge clock); read = 1; addr_r = 3;
        @(negedge clock); read = 0;
        check(8'hAA);

        addr_r = 5;
        @(negedge clock);
        check(8'hAA);

        read = 1; addr_r = 5;
        @(negedge clock); read = 0;
        check(8'h55);

        write = 1; addr_w = 7; datain = 8'h77;
        read  = 1; addr_r = 3;
        @(negedge clock); write = 0; read = 0;
        check(8'hAA);

        read = 1; addr_r = 7;
        @(negedge clock); read = 0;
        check(8'h77);

        write = 1; addr_w = 5; datain = 8'hC3;
        read  = 1; addr_r = 5;
        @(negedge clock); write = 0; read = 0;
        check(8'h55);

        read = 1; addr_r = 5;
        @(negedge clock); read = 0;
        check(8'hC3);

        if (errors == 0) $display("TEST PASSED");
        else             $display("TEST FAILED, errors = %0d", errors);
        $finish;
    end

endmodule
