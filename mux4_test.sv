`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module mux4_test();

    // Interface for testing
    wire [3:0] out;
    reg [3:0] in0, in1, in2, in3;
    reg [1:0] sel;
    
    // Mux insantiation
    mux4 #( .N(4) ) mux4_0 (
        .*
    ); 
    
    // Test Cases
    initial begin
        // sel = 00
        in0 = 4'b0000; in1 = 4'b0010; in2 = 4'b1010; in3 = 4'b1111; sel = 2'b00; #10;
        in0 = 4'b0011; in1 = 4'b0110; in2 = 4'b1110; in3 = 4'b1011; sel = 2'b00; #10;
        // sel = 01
        in0 = 4'b0000; in1 = 4'b0010; in2 = 4'b1010; in3 = 4'b1111; sel = 2'b01; #10;
        in0 = 4'b0011; in1 = 4'b0110; in2 = 4'b1110; in3 = 4'b1011; sel = 2'b01; #10;
        // sel = 10
        in0 = 4'b0000; in1 = 4'b0010; in2 = 4'b1010; in3 = 4'b1111; sel = 2'b10; #10;
        in0 = 4'b0011; in1 = 4'b0110; in2 = 4'b1110; in3 = 4'b1011; sel = 2'b10; #10;
        // sel = 11
        in0 = 4'b0000; in1 = 4'b0010; in2 = 4'b1010; in3 = 4'b1111; sel = 2'b11; #10;
        in0 = 4'b0011; in1 = 4'b0110; in2 = 4'b1110; in3 = 4'b1011; sel = 2'b11; #10;
    
        $finish;
    end
    
    
    

endmodule