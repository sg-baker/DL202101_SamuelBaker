`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-2-24

module addsub(
    input [1:0] a, b,
    input mode,
    output [1:0] sum,
    output cbout
    );
    
    // Internal Signals
    wire c1, c2;
    wire [1:0] b_n;
    
    // Invert b for subtraction
    assign b_n[0] = b[0] ^ mode;
    assign b_n[1] = b[1] ^ mode;
    
    fulladder fa0(
        .ain(a[0]), .bin(b_n[0]), .cin(mode),
        .cout(c1), .sout(sum[0])
    );
    
    fulladder fa1(
        .ain(a[1]), .bin(b_n[1]), .cin(c1),
        .cout(c2), .sout(sum[1])    
    );
    
    // Convert carry to borrow when subtracting
    assign cbout = c2 ^ mode;
    
    
endmodule
