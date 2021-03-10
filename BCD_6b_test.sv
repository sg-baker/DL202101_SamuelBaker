`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module BCD_6b_test();

    // Testing interface
    reg [5:0] in;
    wire [3:0] ones, tens;
    
    // loop variable
    integer i;
    
    // BCD instantiation
    BCD_6b DUT(
        .*        
    );
    
    // Test Cases
    initial begin
        // For loop that goes up to 111111 (63)
        for (i = 0; i <= 6'b111111; i = i + 1) begin
            in = i;
            #10;
        end
        $finish;
    end

endmodule