`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 01:21:01 PM
// Design Name: 
// Module Name: testbench_adder
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


module testbench_adder(
        
    );
    
    reg a, b, ci;
    wire s, co;
    
    one_bit_adder uut(.a(a), .b(b), .ci(ci), .s(s), .co(co));
    
    initial // initial block executes only once
        begin
            // values for a and b
            a = 0;
            b = 0;
            ci = 0;
            #5; // wait for period 
            
            a = 1;
            b = 0;
            ci = 0;
            #5; // wait for period 
            
            a = 0;
            b = 1;
            ci = 0;
            #5; // wait for period 
            
            a = 1;
            b = 1;
            ci = 0;
            #5; // wait for period 
            
            a = 1;
            b = 1;
            ci = 1;
            #5; // wait for period 
        end
    
endmodule
