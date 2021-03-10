`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021


module add3(
    input [3:0] num,
    output [3:0] out
    );
    
    // Conditional that adds 3 to input if it is 5 or greater
    assign out = (num > 3'b100) ? (num + 3'b011) : num; 
    
endmodule
