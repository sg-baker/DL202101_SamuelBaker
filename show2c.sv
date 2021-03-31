`timescale 1ns / 1ps

// Samuel Baker, ELC 2137, 3-31-2021

module show2c(
    input [7:0] Din,
    output reg [15:0] Dout,
    output sign
    );
    
    // Internal connections
    wire [15:0] Din_16_1, Din_16_0;
    wire msb;
    wire [15:0] Din_16_1_to_MUX;
    wire [15:0] Din_16_1_to_ALU;
    
    assign msb = Din[7];
    
    // Concatenating 1's and 0's
    assign Din_16_1 = {8'b11111111, Din};
    assign Din_16_0 = {8'b00000000, Din};
    
    // Flipping Din_16_1
    assign Din_16_1_to_ALU = ~Din_16_1;
    
    // Adding 16 1's to Din_16_1
    assign Din_16_1_to_MUX = Din_16_1_to_ALU + 16'b0000000000000001;
    
    // MUX statement
    always @*
        begin
            case (msb)
                1'b0 : Dout = Din_16_0;
                1'b1 : Dout = Din_16_1_to_MUX;
            endcase
        end
        
    assign sign = Din[7];    
    
    
endmodule
