`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module an_decoder_test();
    // Testing interface
    wire [3:0] out;
    reg [1:0] in;
    
    an_decoder an0(
        .*
    );
    
    // Test cases
    initial begin
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;
        $finish;
    end

endmodule