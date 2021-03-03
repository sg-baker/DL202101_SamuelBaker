`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3

module mux2_4b(
    // inputs and outputs
    input [3:0] in0, in1,
    input sel,
    output [3:0] out    
    );
    // Conditional statement
    assign out = sel ?  in1 : in0;
    
endmodule
