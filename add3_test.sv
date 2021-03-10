`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021


module add3_test();
    
    // Testing interface
    reg [3:0] in;
    wire [3:0] out;
    
    // loop variable
    integer i;
    
    // add3 instantiation
    add3 add0(
        .num(in),
        .out(out)
    );

    // Test Cases
    initial begin
        // For loop tests up to 15
        for (i = 0; i <= 4'b1111; i = i+1) begin
            in = i;
            #10;
        end
        $finish;
    end
    

endmodule
