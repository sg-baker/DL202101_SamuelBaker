`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3


module sseg1(
    input [15:0] sw, // Switches
    output [3:0] an, // 7-seg digits
    output [6:0] seg, // 7-seg-segments
    output dp // decimal point 
    );
    
    // Internal connections
    wire [3:0] n0, n1, out_to_num;
    
    
    // mux instantiation
    mux2_4b mux0(
        .in0(sw[3:0]), .in1(sw[7:4]),
        .sel(sw[15]), .out(out_to_num)
    );
    
    // sseg_decoder instantiation
    sseg_decoder sseg_d0(
        .num(out_to_num), .sseg(seg)    
    );
    
    // Constants
    assign an[3] = 1'b1;
    assign an[2] = 1'b1;
    assign dp = 1'b1;
    
    // Leftover outputs
    assign an[1] = ~sw[15];
    assign an[0] = sw[15];
    
        
endmodule
