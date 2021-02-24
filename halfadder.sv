`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-2-24

module halfadder(
    input a, b,
    output s, c
    );
    
    and and0(c, a, b);
    xor xor0(s, a, b);
    
endmodule
