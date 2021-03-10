`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module BCD_6b(
    // InterfaceS
    input [5:0] in,
    output [3:0] ones,
    output [3:0] tens
    );
    
    // Internal Connections
    // Underscore means 'to'
    wire [2:0] c1_c2, c2_c3;
    wire c1_end, c2_end; 
    
    add3 C1(
        // This conatenates vectors so that 0 can be given
        // to the add3 
        .num({1'b0, in[5:3]}),
        .out({c1_end, c1_c2})
    );
    
    add3 C2(
        .num({c1_c2 ,in[2]}),
        .out({c2_end, c2_c3})
    );
    
    add3 C3(
        .num({c2_c3 ,in[1]}),
        .out({tens[0], ones[3:1]})
    );
    
    // Leftover assignments and constants
    assign ones[0] = in[0];
    assign tens[1] = c2_end;
    assign tens[2] = c1_end;
    assign tens[3] = 1'b0;
    
    
endmodule
