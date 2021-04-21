`timescale 1ns / 1ps
// ELC 2137, John Miller, 2019-11-08 

module debounce_test();

    reg clk, reset;
    reg [3:0] b;
    wire win, lose;
    wire [3:0] y;
    
    guess_FSM DUT(
        .*
    );
        
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0; reset = 0; b = 4'b0000; #5;
        reset = 1; #5;
        reset = 0; b = 4'b0001; #20; // should win
        reset = 1; #5;
        reset = 0; b = 4'b0100; #20; // should lose
        b = 4'b0000; #30; // should loop through each state
        reset = 1; #5;
        reset = 0; #30;
        b =  4'b1000; #20; // should win
        b = 4'b0000; #20; // should loop back to s0         
        $finish;
    end
endmodule // debounce_test