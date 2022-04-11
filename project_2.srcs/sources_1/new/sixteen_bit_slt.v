`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 12:48:15 PM
// Design Name: 
// Module Name: sixteen_bit_slt
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


module sixteen_bit_slt(
        input [15:0] a,
        input [15:0] b,
        output wire out,
        output [15:0] not_b,
        output pos_res,
        output is_pos,
        output pos_out,
        output diff_res,
        output neg_res
    );
    //wire [15:0] not_b;
    wire not_b_oflow;
    sixteen_bit_invert b_inv(.a(b), .out(not_b), .overflow(not_b_oflow));
    // assuming a and b are both pos
    //wire is_pos;
    
    wire sign_or;
    or pos_or(sign_or, a[15], b[15]);
    not pos_not(is_pos, sign_or);
    
    wire [15:0] pos_result;
    wire pos_oflow;
    sixteen_bit_adder pos_adder(.a(a), .b(not_b), .ci(1'h0), .s(pos_result), .co(pos_oflow));
    assign pos_out = pos_result[15];
    
    and(pos_res, is_pos, pos_out);

    // assuming a and b are diff signs
    wire diff_out = a[15]; // a < b, so a is neg. A[15] is sign bit high
    wire is_diff;
    xor_module diff_xor(is_diff, a[15], b[15]);
    
    and(diff_res, is_diff, diff_out);
    
    
    // assuming a and b are both neg
    wire is_neg;
    and(is_neg, a[15], b[15]);
    // ^ dis much is good

    wire [15:0] neg_result;
    wire neg_oflow;
    sixteen_bit_adder neg_adder(.a(a), .b(not_b), .ci(1'h0), .s(neg_result), .co(neg_oflow));
    wire neg_no_oflow = neg_result[15];
    
    wire neg_out;
    wire not_not_b_oflow;
    not(not_not_b_oflow, not_b_oflow);
    and(neg_out, not_not_b_oflow, neg_no_oflow);
    
    and(neg_res, is_neg, neg_out);
    
    wire or1;
    or(or1, pos_res, diff_res);
    or(out, or1, neg_res);
endmodule
