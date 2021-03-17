`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021


module an_decoder(
    input [1:0] in,
    output reg [3:0] out
    );
    
    // Case statement that assigns output
    always@*
    begin
        case (in)
            // Assigns out to turn on corresponding power of 10
            // "ones", "tens", etc.
            2'b00: assign out = 4'b1110;
            2'b01: assign out = 4'b1101;
            2'b10: assign out = 4'b1011;
            2'b11: assign out = 4'b0111;
        endcase
    end
    
endmodule
