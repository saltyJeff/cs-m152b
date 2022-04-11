`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:27:05 PM
// Design Name: 
// Module Name: one_bit_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module one_bit_alu(
    input a,
    input b,
    output out,
    output carry,
    input [1:0] sel
    );
    wire or_out;
    wire not_out;
    wire and_out;
    wire add_out;
    
    or or_mod(or_out, a, b);
    not not_mod(not_out, a);
    and and_mod(and_out, a, b);
    one_bit_adder add_mod(.a(a), .b(b), .s(add_out), .ci(1'h0), .co(carry));
    
    wire and_or_out;
    wire not_add_out;
    /*
    sel[1:0]
    00 = and
    01 = or
    10 = not
    11 = add
    */
    two_to_one_mux mux_and_or(.in0(and_out), .in1(or_out), .sel(sel[0]), .out(and_or_out));
    two_to_one_mux mux_not_add(.in0(not_out), .in1(add_out), .sel(sel[0]), .out(not_add_out));
    two_to_one_mux mux_out(.in0(and_or_out), .in1(not_add_out), .sel(sel[1]), .out(out));
endmodule
