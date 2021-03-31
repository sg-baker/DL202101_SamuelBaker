`timescale 1ns / 1ps

// Samuel Baker, ELC 2137, 3-31-2021

module show2c_test();


    // Interface for testing
    reg [7:0] Din;
    wire [15:0] Dout;
    wire sign;
    
    
    // show2c instantiation
    show2c DUT(
        .*
    );
    
    // Test Cases
    initial begin
        Din = 8'b00000000; #5;
        Din = 8'b11111111; #5;
        Din = 8'b00000101; #5;
        Din = 8'b00011011; #5;
        Din = 8'b00000011; #5;
        Din = 8'b00110011; #5;
        Din = 8'b10000101; #5;
        Din = 8'b10011011; #5;
        Din = 8'b10000011; #5;
        Din = 8'b10110011; #5;        
        $finish;
    end



endmodule