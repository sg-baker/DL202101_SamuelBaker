`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3


// This is the Top-Level module that'll interface with the board
module sseg4_manual(
    input [15:0] sw,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    sseg4 sseg4_0 (
        .data({4'b0000, sw[11:0]}),
        .hex_dec(sw[15]),
        .sign(sw[14]),
        .digit_sel(sw[13:12]),
        .seg(seg),
        .dp(dp),
        .an(an)
    );
    
    
    
    
    
    
    
endmodule
