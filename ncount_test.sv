`timescale 1ns / 1ps

module ncount_test();

    // interface for testing
    reg clk, rst;
    wire [1:0] msbs;
    
    ncount #(.N(3)) nc0(
        .*
    );
    
    // Clock running continuosly
    always begin
        clk = ~clk; #5;
    end
    
    // Block that runs just once
    initial begin
        clk = 0; rst = 0; #5;
        #15; // Let the counter run for a bit
        rst = 1'b1; #5; // Resets the counter
        rst = 1'b0; #80;
        rst = 1'b1; #5;
        rst = 1'b0; #80;
        $finish;
    end

endmodule
