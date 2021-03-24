`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-24


module register #(parameter N=1)
    (
    input clk, rst, en,
    input [N-1:0] D,
    output reg [N-1:0] Q
    );
    
    always @(posedge clk, posedge rst)
    begin
        if (rst == 1)
            Q <= 0;
        else if (en == 1)
            Q <= D;
    end
    
    
endmodule
