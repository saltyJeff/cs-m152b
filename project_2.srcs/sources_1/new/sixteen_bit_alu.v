`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 12:45:46 PM
// Design Name: 
// Module Name: sixteen_bit_alu
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


module sixteen_bit_alu(
        input [15:0] a,
        input [15:0] b,
        input [3:0] aluCtrl,
        output [15:0] s,
        output overflow,
        output zero,
        output sub_out,
        output  adder_out,
        output or_out,
        output and_out,
        output decrement_out,
        output increment_out,
        output inverter_out,
        output asl_out,
        output asr_out,
        output lsl_out,
        output lsr_out,
        output slt_out,
        output slt_flag,
        output sub_oflow
    );
    
    wire slt_flag;
    sixteen_bit_slt slt(.a(a), .b(b), .out(slt_flag));

    wire [15:0] slt_out;
    assign slt_out = {15'b0, slt_flag};
//    reg [14:0] slt_out_test;
//    always @ (*) begin
//        slt_out_test = 15'b0;
//    end;
   
    wire [15:0] adder_out;
    wire adder_oflow;
    
    sixteen_bit_adder adder (.a(a), .b(b), .s(adder_out), .ci(1'h0));
    // adder_oflow = (A /^ B) & (S ^ B)
    wire a_xor_b;
    xor_module axorb(a_xor_b, a[15], b[15]);
    wire adder_out_xor_b;
    xor_module adderoutxorb(adder_out_xor_b, adder_out[15], b[15]);
    wire not_a_xor_b;
    not notaxorb (not_a_xor_b, a_xor_b);
    and(adder_oflow, not_a_xor_b, adder_out_xor_b);
    
    wire [15:0] inverter_out;
    wire inverter_oflow;
    sixteen_bit_invert inverter (.a(a), .out(inverter_out), .overflow(inverter_oflow));
    
    wire [15:0] b_invert_out;
    sixteen_bit_invert b_inverter (.a(b), .out(b_invert_out));
    
    wire [15:0] sub_out;
    wire sub_oflow;
    sixteen_bit_adder subtractor(.a(a), .b(b_invert_out), .s(sub_out), .ci(1'h0));
    // sub_oflow = (A ^ B) & (S /^ B)
    wire a_xor_b_sub;
    xor_module suboutxorb(a_xor_b_sub, a[15], b[15]);
    wire s_xor_b_sub;
    xor_module bleepbloop(s_xor_b_sub, sub_out[15], b[15]);
    wire s_nxor_b_sub;
    not(s_nxor_b_sub, s_xor_b_sub);
    and(sub_oflow, a_xor_b_sub, s_nxor_b_sub);
            
    wire [15:0] lsl_out;
    wire [15:0] lsr_out;
    wire [15:0] asl_out;
    wire [15:0] asr_out;
    wire asl_oflow;
    wire asr_oflow;
    
    
    shift_stuff shifter (.a(a), .b(b[3:0]), .lsl(lsl_out), .lsr(lsr_out), .asl(asl_out), .asr(asr_out), .aslOflow(asl_oflow), .asrOflow(asr_oflow));
    
    wire [15:0] increment_out;
    wire increment_oflow;
    sixteen_bit_adder increment_adder (.a(a), .b(16'h1), .s(increment_out), .ci(1'h0));
    wire not_a15;
    not nota15 (not_a15, a[15]);
    and(increment_oflow,  not_a15, increment_out[15]);
    
    // problem with decrement
    wire [15:0] decrement_out;
    wire decrement_oflow;
    sixteen_bit_adder decrement_adder (.a(a), .b(-1), .s(decrement_out), .ci(1'h0));
    // sub_oflow = (A ^ B) & (S /^ B)
    wire not_s_decr;
    not(not_s_decr, decrement_out[15]);
    and(decrement_oflow, a[15], not_s_decr);
    
    
    wire [15:0] and_out;
    sixteen_bit_and and_generator (.a(a), .b(b), .out(and_out));
    
    wire [15:0] or_out;
    sixteen_bit_or or_generator (.a(a), .b(b), .out(or_out));
    
    
    sixteen_to_one_mux #(.WIDTH(16)) out_mux (aluCtrl, sub_out, adder_out, or_out, and_out, decrement_out, increment_out, inverter_out, 0, lsl_out, slt_out, lsr_out, 0, asl_out, 0, asr_out, 0, s);
    sixteen_to_one_mux #(.WIDTH(1)) oflow_mux (aluCtrl, sub_oflow, adder_oflow, 0, 0, decrement_oflow, increment_oflow, inverter_oflow, 0, 0, 0, 0, 0, asl_oflow, 0, asr_oflow, 0, overflow);
    
    zero_check zero_chk(zero, s);

endmodule
