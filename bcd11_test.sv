`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module bcd11_test();

   // Testing interface
    reg [10:0] in;
    wire [3:0] ones, tens, hundreds, thousands;
    
    // loop variable
    integer i;
    
    // BCD instantiation
    bcd11 DUT(
        .in(in), .ones(ones),
        .tens(tens), .hundreds(hundreds),
        .thousands(thousands)        
    );
    
    // Test Cases
    initial begin
        // For loop that goes up to 11111111111
        for (i = 0; i <= 11'b11111111111; i = i + 1) begin
            in = i;
            #5;
        end
        $finish;
    end

endmodule