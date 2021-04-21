`timescale 1ns / 1ps
// ELC 2137, Samuel Baker, 4-7-2021


module guess_FSM(
    input clk, reset,
    input [3:0] b,
    output reg win, lose,
    output reg [3:0] y
    );
    
    // defining states as local parameters
    localparam [3:0]
        s0 = 4'b0001,
        s1 = 4'b0010,
        s2 = 4'b0100,
        s3 = 4'b1000,
        swin = 4'b1111,
        slose = 4'b0000;
        
    // state memory
    reg [3:0] state, n_state;
    always_ff @(posedge(clk), posedge(reset)) begin
        if (reset)
            state <= s0;
        else
            state <= n_state;
    end
    
    // next-state and output logic
    always_comb begin
        // default behavior
        n_state = state;
        
        case (state) 
            s0: begin
                y = 4'b0001;
                win = 1'b0;
                lose = 1'b0;
                if (b == 4'b0000)
                    n_state = s1;
                else if (b == 4'b0001)
                    n_state = swin;
                else
                    n_state = slose;
            end
            
            s1: begin
                y = 4'b0010;
                win = 1'b0;
                lose = 1'b0;
                if (b == 4'b0000)
                    n_state = s2;
                else if (b == 4'b0010)
                    n_state = swin;
                else
                    n_state = slose;
            end
            
            s2: begin
                y = 4'b0100;
                win = 1'b0;
                lose = 1'b0;
                if (b == 4'b0000)
                    n_state = s3;
                else if (b == 4'b0100)
                    n_state = swin;
                else
                    n_state = slose;
            end
            
            s3: begin
                y = 4'b1000;
                win = 1'b0;
                lose = 1'b0;
                if (b == 4'b0000)
                    n_state = s0;
                else if (b == 4'b1000)
                    n_state = swin;
                else
                    n_state = slose;
            end
            
            
            swin: begin
                //y = 4'b0000;
                win = 1'b1;
                lose = 1'b0;
                if (b == 4'b0000)
                    n_state = s0;
                else
                    n_state = swin;
            end
            
            slose: begin
                //y = 4'b0000;
                win = 1'b0;
                lose = 1'b1;                
                if (b == 4'b0000)
                    n_state = s0;
                else
                    n_state = slose;
            end
        endcase 
    end
    
        
    
    
endmodule
