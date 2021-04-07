`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-4-7

module top_lab10(
    input btnU,
    input btnD,
    input [15:0] sw,
    input clk,
    input btnC,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    output [15:0] led
    );
    
    
    // Internal Signals
    wire [15:0] calc_led;
    wire [7:0] calc_show2c;
    wire [15:0] show2c_dout;
    wire sign_sign;
    wire [1:0] count_sseg4;
    
    // Internal Modules
    top_lab9 calc(
        .btnU(btnU), .btnD(btnD),
        .sw(sw[11:0]), .clk(clk),
        .btnC(btnC), .led(calc_led)
    );
    
    // Assigning LED
    assign led = calc_led;
    
    show2c two_c(
        .Din(calc_led[15:8]),
        .Dout(show2c_dout),
        .sign(sign_sign)
    );
    
    ncount #( .N(20) ) timer(
        .clk(clk),
        .rst(btnC),
        .msbs(count_sseg4)
    );
    
    
    sseg4_TDM sseg(
        .data(show2c_dout),
        .sign(sign_sign),
        .hex_dec(sw[15]),
        .digit_sel(count_sseg4),
        .seg(seg),
        .dp(dp),
        .an(an)
    );
    
    
    
endmodule
