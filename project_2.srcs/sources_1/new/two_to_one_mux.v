`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 12:59:46 PM
// Design Name: 
// Module Name: two_to_one_mux
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


module two_to_one_mux #(parameter WIDTH=1) (
        input sel,
        input [WIDTH-1:0] in0,
        input [WIDTH-1:0] in1,
        output [WIDTH-1:0] out
);
    genvar i;
    generate
        for(i = 0; i < WIDTH; i=i+1) begin: elon_mux
            wire not_sel;
            not not_0(not_sel, sel);
            
            wire out_0;
            and and_0(out_0, not_sel, in0[i]);
            
            wire out_1;
            and and_1(out_1, sel, in1[i]);
            
            or or_0(out[i], out_0, out_1);
//            wire not_sel;
//            not not_0(not_sel, sel);
            
//            wire out_0;
//            and and_0(out_0, not_sel, in[0]);
            
//            wire out_1;
//            and and_1(out_1, sel, in[1]);
            
//            or or_0(out, out_0, out_1);
        end
    endgenerate
    
    
endmodule
