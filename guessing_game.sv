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
    wire [1:0] count_mux0, count_mux1;
    wire guess_clk;
    wire [3:0] dummy_wire;
    wire win, lose;
    wire [3:0] y;
    
    
    
    // debouncing buttons
    debounce #(.N(2)) db0 (
        .clk(clk), .reset(btnC),
        .in(btnU), .out(debounced_b[0]),
        .tick(dummy_wire[0])
    );
    
    debounce #(.N(2)) db1 (
        .clk(clk), .reset(btnC),
        .in(btnR), .out(debounced_b[1]),
        .tick(dummy_wire[1])
    );
    
    debounce #(.N(2)) db2 (
        .clk(clk), .reset(btnC),
        .in(btnD), .out(debounced_b[2]),
        .tick(dummy_wire[2])
    );
    
    debounce #(.N(2)) db3 (
        .clk(clk), .reset(btnC),
        .in(btnL), .out(debounced_b[3]),
        .tick(dummy_wire[3])
    );
    
    // dividing clock and MUX
    ncount #(.N(25)) counter0 (
        .clk(clk), .rst(btnC),
        .msbs(count_mux0)
    );
    
    // Hard difficulty
    ncount #(.N(21)) counter1 (
        .clk(clk), .rst(btnC),
        .msbs(count_mux1)
    );
    
    // MUX
    mux2 MUX(
        .in0(count_mux0[0]), .in1(count_mux1[0]),
        .sel(sw[0]), .out(guess_clk)
    );
    
    // Guess FSM
    
    guess_FSM guess(
        .clk(guess_clk), .reset(btnC),
        .b(debounced_b), .win(win),
        .lose(lose), .y(y)
    );
    
    // This just keeps the seven-segment display off
    assign an = ~y;
    assign seg = 7'b0000000;
    
    assign led[3:0] = 4'b0000;
    assign led[5:4] = {lose, lose};
    assign led[7:6] = {win, win};
    
    // Keeps the rest of the led's off
    assign led[15:8] = 8'b00000000;
        
    
endmodule
