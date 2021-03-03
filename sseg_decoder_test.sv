`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3


module sseg_decoder_test();
        
    // Interface for testing
    wire [6:0] out;
    reg [3:0] n;
    
    integer i; // Loop variable
        
    /// sseg_decoder instantiation
    sseg_decoder sseg_d0(
        .num(n), .sseg(out)
    );
           
    // Test Cases
    initial begin
        // For loop tests up until F (15)
        for (i=0; i<=8'hF; i=i+1) begin
            n = i;
            #10;
        end
        $finish;
    end

endmodule