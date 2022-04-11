`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:45:09 PM
// Design Name: 
// Module Name: four_to_one_mux
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


module four_to_one_mux #(parameter WIDTH=1)(
    input [1:0] sel,
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [WIDTH-1:0] c,
    input [WIDTH-1:0] d,
    output wire [WIDTH-1:0] out
    );
    
    wire [WIDTH-1:0] output_0;
    wire [WIDTH-1:0] output_1;
    
    two_to_one_mux #(.WIDTH(WIDTH)) mux_0(.in0(a), .in1(b), .sel(sel[0]), .out(output_0));
    two_to_one_mux #(.WIDTH(WIDTH)) mux_1(.in0(c), .in1(d), .sel(sel[0]), .out(output_1));
    two_to_one_mux #(.WIDTH(WIDTH)) mux_out(.in0(output_0), .in1(output_1), .sel(sel[1]), .out(out));
    
endmodule
