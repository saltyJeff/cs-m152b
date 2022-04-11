`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 01:14:07 PM
// Design Name: 
// Module Name: xor_module
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


module xor_module(
        output wire o,
        input a,
        input b
    );
    
    wire not_b;
    not not_1(not_b, b);
    
    wire not_a;
    not not_2(not_a, a);
    
    wire out_1;
    and and_1(out_1, a, not_b);
    
    wire out_2;
    and and_2(out_2, b, not_a);
    
    or or_1(o, out_1, out_2); 
     
endmodule
