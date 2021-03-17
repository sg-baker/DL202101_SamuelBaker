`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3


module sseg4(
    input [15:0] data,
    input hex_dec,
    input sign,
    input [1:0] digit_sel,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    // Internal Connections
    // underscore means to
    wire [15:0] bcd11_mux2;
    wire [15:0] mux2_mux4;
    wire [3:0] mux4_ssegdecoder;
    wire [6:0] ssegdecoder_mux2;
    wire [3:0] an_end;
    wire and_mux2;    
    
    // Working top-down from the diagram
    bcd11 bcd11_0(
        .in(data[10:0]),
        .out(bcd11_mux2)    
    );
    
    mux2 #( .N(16) ) mux2_0 (
        .in0(bcd11_mux),
        .in1(data),
        .sel(hex_dec),
        .out(mux2_mux4)    
    );
    
    mux4 #( .N(4) ) mux4_0(
        .in0(mux2_mux4[3:0]),
        .in1(mux2_mux4[7:4]),
        .in2(mux2_mux4[11:8]),
        .in3(mux2_mux4[15:12]),
        .sel(digit_sel),
        .out(mux4_ssegdecoder)  
    );
    
    an_decoder an_0(
        .in(digit_sel),
        .out(an_end)
    );
    
    sseg_decoder sseg0(
        .in(mux4_ssegdecoder),
        .out(ssegdecoder_mux2)
    );
    
    // AND gate
    and(and_mux2, sign, ~an_end[3]);
    
    mux2 #( .N(7) ) mux2_1 (
        .in0(ssegdecoder_mux2),
        .in1(7'b0111111),
        .sel(and_mux2),
        .out(seg)
    );
    
    // Remaining outputs
    assign dp = 1'b1;
    assign an = an_end;
    
    
    
    
endmodule
