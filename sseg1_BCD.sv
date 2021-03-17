`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021


module sseg1_BCD(
    input [15:0] sw,
    output dp,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire [3:0] thou, hund, tens, ones;
    wire[3:0] mux_sseg;
    
    bcd11 BCD(
        .in(sw[10:0]), .ones(ones),
        .tens(tens), .hundreds(hund),
        .thousands(thou)    
    );
    
    mux2_4b MUX(
        .in0(ones), .in1(tens),
        .sel(sw[15]), .out(mux_sseg)
    );
    
    sseg_decoder DECODE(
        .num(mux_sseg),
        .sseg(seg)    
    );
    
    assign dp = 1'b1;
    assign an[3:2] = {1'b1, 1'b1};
    assign an[1] = ~sw[15];
    assign an[0] = sw[15];
    
endmodule
