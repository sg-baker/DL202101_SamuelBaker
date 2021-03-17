`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-2021

module mux2_test();

     // Interface for testing
    wire [15:0] out;
    reg [15:0] in0, in1;
    reg sel;
    
    /// Mux instantiation
    mux2 #( .N(16) ) mux2_0 (
        .in0(in0), .in1(in1),
        .sel(sel), .out(out)
    );
       
    // Test Cases
    initial begin
        // sel = 0
        in0 = 16'b0000000000000000; in1 = 16'b0000000000000010; sel = 1'b0; #10;
        in0 = 16'b0000000001000001; in1 = 16'b000010001000010; sel = 1'b0; #10;
        // sel = 1
        in0 = 16'b0000000000000000; in1 = 16'b0000000000000010; sel = 1'b1; #10;
        in0 = 16'b0000000001000001; in1 = 16'b000010001000010; sel = 1'b1; #10;
    
        $finish;
    end

endmodule
