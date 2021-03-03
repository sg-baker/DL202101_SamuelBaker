`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-3


module mux2_4b_test();
    
    // Interface for testing
    wire [3:0] ot;
    reg [3:0] n0, n1;
    reg select;
    
    /// Mux instantiation
    mux2_4b mux24_0(
        .in0(n0), .in1(n1),
        .sel(select), .out(ot)
    );
       
    // Test Cases
    initial begin
        // sel = 0
        n0 = 4'b0000; n1 = 4'b0010; select = 1'b0; #10;
        n0 = 4'b0101; n1 = 4'b0011; select = 1'b0; #10;
        // sel = 1
        n0 = 4'b0000; n1 = 4'b0010; select = 1'b1; #10;
        n0 = 4'b0101; n1 = 4'b0011; select = 1'b1; #10;  
    
        $finish;
    end

endmodule
