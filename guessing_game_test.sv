`timescale 1ns / 1ps
// ELC 2137, Samuel Baker, 4-21-2021

module guessing_game_test();
    reg btnU, btnR, btnD, btnL, brnC;
    reg clk;
    reg [11:0] sw;
    wire [6:0] seg;
    wire [3:0] an;
    wire [15:0] led;
    
    
    
    guessing_game DUT (
        .*
    );
    
    always begin
        #5 clk = ~clk;
    end
    
    



endmodule