`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module mux4
    #(parameter N=1)
    (
    input [N-1:0] in0, in1, in2, in3,
    input [1:0] sel,
    output reg [N-1:0] out
    );
    
    // Case statement that assigns output
    always@*
    begin
        case (sel)
            // Assigns out to corresponding sel input
            2'b00: assign out = in0;
            2'b01: assign out = in1;
            2'b10: assign out = in2;
            2'b11: assign out = in3;
        endcase
    
    end
    
endmodule
