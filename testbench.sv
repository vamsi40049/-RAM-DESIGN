module sync_ram_tb;

    logic clk;
    logic we;
    logic [3:0] addr;
    logic [7:0] din;
    logic [7:0] dout;

    sync_ram dut(
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 1;
        addr = 4'd2;
        din = 8'hA5;
        #10;

        we = 1;
        addr = 4'd5;
        din = 8'h3C;
        #10;

        we = 0;
        addr = 4'd2;
        #10;

        addr = 4'd5;
        #10;

        $finish;
    end
endmodule
