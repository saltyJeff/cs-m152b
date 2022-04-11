`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2022 01:15:10 PM
// Design Name: 
// Module Name: testbench_slt
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


module testbench_slt(

    );
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] not_b;
    wire out;
    wire pos_res;
    wire is_pos;
    wire pos_out;
    wire diff_res;
    wire neg_res;
    sixteen_bit_slt uut(.a(a), .b(b), .out(out), .pos_res(pos_res), .not_b(not_b), .neg_res(neg_res), .diff_res(diff_res), .pos_out(pos_out), .is_pos(is_pos));
    
    initial begin
        a = 5;
        b = 7;
        #10;
        a = 'h7FFF;
        b = 'h7FFF;
        #10;
        b = 'h7FFF - 1;
        #10;
        // diff signs
        a = 'h8000;
        b = 0;
        #10;
        a = 0;
        b = 'h8000;
        #10;
        // both neg
        a = -30;
        b = -5;
        #10;
        a = -5;
        b = -30;
        #30;
        a = 'h8000;
        b = -1;
        #10;
        a = -1;
        b = 'h8000;
        #10;
        a = -1;
        b = -2;
        #10;
        a = -2;
        b = -1;
        #10;
        a = 'h8000;
        b = 'h8000;
    end
endmodule
