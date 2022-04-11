`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 01:33:49 PM
// Design Name: 
// Module Name: testbench_sixteen_bit_alu
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


module testbench_sixteen_bit_alu(

    );
    
    reg signed [15:0] a;
    reg signed [15:0] b;
    reg [3:0] alu_ctrl;
    wire signed [15:0] s;
    wire overflow;
    wire zero;
//    wire [15:0] sub_out;
//    wire [15:0] adder_out;
//    wire [15:0] or_out;
//    wire [15:0] and_out;
//    wire [15:0] decrement_out;
//    wire [15:0] increment_out;
//    wire [15:0] inverter_out; 
//    wire [15:0] asl_out;
//    wire [15:0] asr_out;
//    wire [15:0] lsl_out; 
//    wire [15:0] lsr_out;
//    wire [15:0] slt_out;
//    wire slt_flag;
//    wire sub_oflow;
    
    //sixteen_bit_alu uut(a, b, alu_ctrl, s, overflow, zero, sub_out,adder_out, or_out, and_out, decrement_out, increment_out, inverter_out, asl_out, asr_out, lsl_out, lsr_out, slt_out, slt_flag,sub_oflow);
    sixteen_bit_alu uut(a,b,alu_ctrl,s,overflow,zero);
    
    
    initial begin
        // SUBTRACTION
        alu_ctrl = 'b0000;
        a = 17;
        b = -8;
        #10;
        a = 'h8000;
        b = 'h7fff;
        #15;
        // ADDITION
        alu_ctrl = 'b0001;
        a = 17;
        b = -8;
        #10;
        a = 'h7fff;
        b = 2;
        #15;
        // OR
        alu_ctrl = 'b0010;
        #15;
        // AND
        alu_ctrl = 'b0011;
        #15;
        // DECR
        alu_ctrl = 'b0100;
        a = 0;
        #10;
        a = 'h8000;
        #15;
        // INCR
        alu_ctrl = 'b0101;
        a = 0;
        #10;
        a = 'h7fff;
        #15;
        // INV
        alu_ctrl = 'b0110;
        a = 0;
        #10;
        a = 15;
        #10;
        a = 'h8000;
        #15;
        // ASL
        alu_ctrl = 'b1100;
        a = 5;
        b = 4;
        #10;
        a = 'h4000;
        b = 1;
        #15;
        // ASR
        alu_ctrl = 'b1110;
        a = 'h8000;
        b = 3;
        #10;
        a = 'h4000;
        b = 3;
        #15;
        // LSL
        alu_ctrl = 'b1000;
        a = 'h4000;
        b = 3;
        #15;
        // LSR
        alu_ctrl = 'b1010;
        a = 'h4000;
        b = 3;
        #10;
        a = 'h8000;
        b = 3;
        #15;
        // SLT
        alu_ctrl = 'b1001;
        a = 16;
        b = 8;
        #10;
        a = 'h8000;
        b = 'h7fff;
        #15;
        
////        for(i = 0; i < 16; i=i+1) begin
//            alu_ctrl = 4;
//            // values for a and b
//            a = 'hfffd;
//            b = 'h000f;
//            #5; // wait for period 
            
//            a = 1;
//            b = 0;
//            #5; // wait for period 
            
//            a = 0;
//            b = 1;
//            #5; // wait for period 
            
//            a = 1;
//            b = 1;
//            #5; // wait for period 
            
//            a = 5;
//            b = 'h8000;
//            #5;
            
//            alu_ctrl = 4;
//            #15;
//            a = 'h8000;
//            b = 5;
//            #5;
//            alu_ctrl = 0;
            
//            a = 'h7fff;
//            b = 5;
//            #5;
            
//             a = 4;
//             b =-4;
//             #5;
             
//              a = 'h8000 +1;
//             b = 'h7fff;
//             #5;
////        end
    end 
endmodule
