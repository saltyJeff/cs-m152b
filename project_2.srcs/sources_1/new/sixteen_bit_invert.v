`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 01:28:56 PM
// Design Name: 
// Module Name: sixteen_bit_invert
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


module sixteen_bit_invert(
        input [15:0] a,
        output [15:0] out,
        output overflow
    );
    wire [15:0] out0;
    sixteen_bit_not sixteen_not(.a(a), .out(out0));
    sixteen_bit_adder sixteen_add(.a(out0), .b(16'h1), .ci(1'h0),.s(out));
    
    // overflow = a != 0 && a[15] == out[15]
    wire iszero;
    zero_check zilch_chk(iszero, a);
    wire notzero;
    not(notzero, iszero);
    
    wire a_xor_out;
    xor_module xor_mod(a_xor_out, a[15], out[15]);
    wire not_a_xor_out;
    not(not_a_xor_out, a_xor_out);
    
    and(overflow, notzero, not_a_xor_out);
endmodule
