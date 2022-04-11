`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 01:10:14 PM
// Design Name: 
// Module Name: one_bit_adder
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


module one_bit_adder(
        input a,
        input b,
        input ci,
        output wire s,
        output wire co
    );
    
    wire int;
    xor_module xor1(.a(a), .b(b), .o(int));
    xor_module xor2(.a(int), .b(ci), .o(s));
    
    
    wire out_1;
    and and_1(out_1,a,b);
    
    wire out_2;
    and and_2(out_2, int, ci);
    
    or or_1(co,out_1,out_2);
    
endmodule
