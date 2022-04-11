`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:51:09 PM
// Design Name: 
// Module Name: sixteen_to_one_mux
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


module sixteen_to_one_mux #(parameter WIDTH=1)(
    input [3:0] sel,
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input [WIDTH-1:0] in2,
    input [WIDTH-1:0] in3,
    input [WIDTH-1:0] in4,
    input [WIDTH-1:0] in5,
    input [WIDTH-1:0] in6,
    input [WIDTH-1:0] in7,
    input [WIDTH-1:0] in8,
    input [WIDTH-1:0] in9,
    input [WIDTH-1:0] in10,
    input [WIDTH-1:0] in11,
    input [WIDTH-1:0] in12,
    input [WIDTH-1:0] in13,
    input [WIDTH-1:0] in14,
    input [WIDTH-1:0] in15,
    output wire [WIDTH-1:0] out
    );
    
    wire [WIDTH-1:0] out_0;
    wire [WIDTH-1:0] out_1;
    wire [WIDTH-1:0] out_2;
    wire [WIDTH-1:0] out_3;
    
    four_to_one_mux #(.WIDTH(WIDTH)) mux_0(.a(in0), .b(in1), .c(in2), .d(in3), .sel(sel[1:0]), .out(out_0));
    four_to_one_mux #(.WIDTH(WIDTH)) mux_1(.a(in4), .b(in5), .c(in6), .d(in7), .sel(sel[1:0]), .out(out_1));
    four_to_one_mux #(.WIDTH(WIDTH)) mux_2(.a(in8), .b(in9), .c(in10), .d(in11), .sel(sel[1:0]), .out(out_2));
    four_to_one_mux #(.WIDTH(WIDTH)) mux_3(.a(in12), .b(in13), .c(in14), .d(in15), .sel(sel[1:0]), .out(out_3));
    four_to_one_mux #(.WIDTH(WIDTH)) mux_put(.a(out_0), .b(out_1), .c(out_2), .d(out_3), .sel(sel[3:2]), .out(out));
    
endmodule
