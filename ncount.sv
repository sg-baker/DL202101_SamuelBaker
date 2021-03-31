`timescale 1ns / 1ps

// Samuel Baker, ELC 2137, 3-31-2021

module ncount #(parameter N=1)
    (
    input clk, rst,
    output [1:0] msbs
    );
    
    // internal signals
    reg [N-1:0] Q_reg, Q_next;
    
    // register (state memory)
    always @(posedge clk, posedge rst)
    begin
        if (rst)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    end
    
    // next-state logic    
    assign Q_next = Q_reg + 1;
    
    // output logic
    assign msbs = Q_reg[N-1:N-2];   
    
endmodule
