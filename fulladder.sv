`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-2-24

module fulladder(
    input ain, bin, cin,
    output cout, sout
    );
    
    wire c1, c2, s1;
    
    halfadder ha0(
        .a(ain), .b(bin),
        .c(c1), .s(s1)
    );
       
    halfadder ha1(
        .a(s1), .b(cin),
        .c(c2), .s(sout)
    );
    
    assign cout = c1 | c2;
    
endmodule
