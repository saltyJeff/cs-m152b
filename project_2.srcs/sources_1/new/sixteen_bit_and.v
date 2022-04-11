`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 01:24:51 PM
// Design Name: 
// Module Name: sixteen_bit_and
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


module sixteen_bit_and(
        input [15:0] a,
        input [15:0] b,
        output wire [15:0] out
    );
    
    genvar i;
    generate
        for(i = 0; i < 16; i=i+1) begin: elon_and
            and and_0(out[i], a[i], b[i]);
        end
    endgenerate
endmodule
