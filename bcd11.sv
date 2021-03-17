`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021


module bcd11(
    input [10:0] in,
    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds,
    output [3:0] thousands
    );
    
    // Internal connections
    // underscore means 'to'
    wire [3:0] c1_out, c2_out, c3_out;
    wire [7:0] line4_out, line5_out, line6_out;
    wire [11:0] line7_out, line8_out;
    
    
    add3 C1(
        .num({1'b0, in[10:8]}),
        .out(c1_out)
    );
    
    add3 C2(
        .num({c1_out[2:0], in[7]}),
        .out(c2_out)
    );
    
    add3 C3(
        .num({c2_out[2:0], in[6]}),
        .out(c3_out)
    );
    
    // C1 - C3 are good
    
    add3 line4[1:0] (
        .num({1'b0, c1_out[3], c2_out[3], c3_out, in[5]}),
        .out(line4_out)
    );
    
    add3 line5[1:0] (
        .num({line4_out[6:0], in[4]}),
        .out(line5_out)
    );
    
    add3 line6[1:0] (
        .num({line5_out[6:0], in[3]}),
        .out(line6_out)
    );
    
    add3 line7[2:0] (
        .num({1'b0, line4_out[7], line5_out[7], line6_out, in[2]}),
        .out(line7_out)
    );
    
    add3 line8[2:0] (
        .num({line7_out[10:0], in[1]}),
        .out(line8_out)
    );
    
    
    // Leftover assignments
    assign ones[0] = in[0];
    assign ones[3:1] = line8_out[2:0];
    assign tens = line8_out[6:3];
    assign hundreds = line8_out[10:7];
    assign thousands = {1'b0, 1'b0, line7_out[11], line8_out[11]};
    
    
endmodule
