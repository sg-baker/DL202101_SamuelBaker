`timescale 1ns / 1ps
// Samuel Baker, ELC 2137, 2021-3-24

module top_lab9(
    input btnU,
    input btnD,
    input [11:0] sw,
    input clk,
    input btnC,
    output [15:0] led
    );
    
    // Internal Wiring
    wire [7:0] reg1_ALU_n_LED;
    wire [7:0] ALU_reg2;
    wire [7:0] reg2_end;
    
    // Module instantiation
    register #(.N(8)) reg1(
        .D(sw[7:0]), .clk(clk),
        .en(btnD), .rst(btnC),
        .Q(reg1_ALU_n_LED) 
    );
    
    alu #(.N(8)) alu0(
        .out(ALU_reg2), .in0(sw[7:0]),
        .in1(reg1_ALU_n_LED), .op(sw[11:8])
    );
    
    register #(.N(8)) reg2(
        .D(ALU_reg2), .clk(clk),
        .en(btnU), .rst(btnC),
        .Q(reg2_end) 
    );
    
    // output assigning
    assign led = {reg2_end, reg1_ALU_n_LED};   
    
    
endmodule
