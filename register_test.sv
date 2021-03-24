`timescale 1ns / 1ps

module register_test();
// Samuel Baker, ELC 2137, 2021-3-24

// Interface for testing
    reg [3:0] D;
    reg clk, en, rst;
    wire [3:0] Q;
    
    register #(.N(4)) r(.D(D), .clk(clk),
        .en(en), .rst(rst), .Q(Q) );
        
    // clock runs continuously
    always begin
        clk = ~clk; #5;
    end
    
    // this block only runs once
    initial begin
        clk = 0; en = 0; rst = 0; D = 4'h0; #7;
        rst = 1; #3; // reset
        D = 4'hA; en = 1; rst = 0; #10;
        D = 4'h3; #2;
        en = 0; #5;
        en = 1; #3;
        D = 4'h0; #2;
        en = 0; #10;
        en = 1; #2;
        D = 4'h6; #11;
        $finish;
    end

endmodule
