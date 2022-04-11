`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 01:30:35 PM
// Design Name: 
// Module Name: sixteen_bit_adder
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


module sixteen_bit_adder(
        input [15:0] a,
        input [15:0] b,
        input ci,
        output wire co,
        output [15:0] s
    );
    wire c1;
    one_bit_adder add0(a[0], b[0], ci, s[0], c1);
    
    wire c2;
    one_bit_adder add1(a[1], b[1], c1, s[1], c2);
    
    wire c3;
    one_bit_adder add2(a[2], b[2], c2, s[2], c3);
    
    wire c4;
    one_bit_adder add3(a[3], b[3], c3, s[3], c4);
    
    wire c5;
    one_bit_adder add4(a[4], b[4], c4, s[4], c5);
        
    wire c6;
    one_bit_adder add5(a[5], b[5], c5, s[5], c6);
            
    wire c7;
    one_bit_adder add6(a[6], b[6], c6, s[6], c7);
    
    wire c8;
    one_bit_adder add7(a[7], b[7], c7, s[7], c8);
    
    wire c9;
    one_bit_adder add8(a[8], b[8], c8, s[8], c9);
    
    wire c10;
    one_bit_adder add9(a[9], b[9], c9, s[9], c10);
    
    wire c11;
    one_bit_adder add10(a[10], b[10], c10, s[10], c11);
    
    wire c12;
    one_bit_adder add11(a[11], b[11], c11, s[11], c12);
    
    wire c13;
    one_bit_adder add12(a[12], b[12], c12, s[12], c13);
        
    wire c14;
    one_bit_adder add13(a[13], b[13], c13, s[13], c14);
            
    wire c15;
    one_bit_adder add14(a[14], b[14], c14, s[14], c15);
    
    one_bit_adder add15(a[15], b[15], c15, s[15], co);
    
    
    
    
endmodule
