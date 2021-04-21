`timescale 1ns / 1ps



module guessing_game(
    input btnU,
    input btnR,
    input btnD,
    input btnL,
    input btnC,
    input clk,
    input [11:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    // internal connections
    wire [3:0] debounced_b;
    wire [1:0] count_mux;
    wire guess_clk;
    wire [3:0] dummy_wire;
    wire win, lose;
    wire [3:0] y;
    
    
    
    // debouncing buttons
    debounce #(.N(2)) db0 (
        .clk(clk), .reset(reset),
        .in(btnU), .out(debounced_b[0]),
        .tick(dummy_wire[0])
    );
    
    debounce #(.N(2)) db1 (
        .clk(clk), .reset(reset),
        .in(btnR), .out(debounced_b[1]),
        .tick(dummy_wire[1])
    );
    
    debounce #(.N(2)) db2 (
        .clk(clk), .reset(reset),
        .in(btnD), .out(debounced_b[2]),
        .tick(dummy_wire[2])
    );
    
    debounce #(.N(2)) db3 (
        .clk(clk), .reset(reset),
        .in(btnL), .out(debounced_b[3]),
        .tick(dummy_wire[3])
    );
    
    // dividing clock and MUX
    
    ncount #(.N(16)) counter (
        .clk(clk), .rst(reset),
        .msbs(count_mux)
    );
    
    // MUX
    mux2 MUX(
        .in0(clk), .in1(count_mux[0]),
        .sel(sw[0]), .out(guess_clk)
    );
    
    // Guess FSM
    
    guess_FSM guess(
        .clk(guess_clk), .reset(reset),
        .b(debounced_b), .win(win),
        .lose(lose), .y(y)
    );
    
    // This just keeps the seven-segment display off
    assign an = 4'b1111;
    assign seg = 7'b1111111;
    
    assign led[3:0] = y;
    assign led[5:4] = lose;
    assign led[7:6] = win;
    
    // Keeps the rest of the led's off
    assign led[15:8] = 8'b00000000;
        
    
endmodule
