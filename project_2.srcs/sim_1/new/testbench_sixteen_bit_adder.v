`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 01:47:58 PM
// Design Name: 
// Module Name: testbench_sixteen_bit_adder
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


module testbench_sixteen_bit_adder();

    reg [15:0] a;
    reg [15:0] b;
    reg ci;
    wire [15:0] s;
    wire co;
    
    sixteen_bit_adder uut(.a(a), .b(b), .ci(ci), .s(s), .co(co));
    
    initial // initial block executes only once
        begin
            // values for a and b
            a = 'hfffd;
            b = 'h000f;
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


