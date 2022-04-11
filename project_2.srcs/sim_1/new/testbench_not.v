`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 01:16:51 PM
// Design Name: 
// Module Name: testbench_not
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


module testbench_not(

    );
    
    reg [15:0] a;
    
    wire [15:0] out;
    
    not uut(out, a);
    
    initial begin
        a = 0;
        
    end 
endmodule
