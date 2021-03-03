`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3

module sseg1_test();

    // Interface for testing
    wire [3:0] an0;
    wire [6:0] seg0;
    wire dp0;
    reg [15:0] sw0;
    
    sseg1 sseg0(
        .sw(sw0), .an(an0),
        .seg(seg0), .dp(dp0)
    );
    
    initial begin
        // Initialize
        sw0 = 16'h0000; #10;
        // Test case 1
        sw0[7:0] = 8'hAB;
        sw0[15] = 1'b0; #10;
        sw0[15] = 1'b1; #10;
        // Test Case 2
        sw0[7:0] = 8'hCD;
        sw0[15] = 1'b0; #10;
        sw0[15] = 1'b1; #10;
        $finish;    
    end

endmodule 