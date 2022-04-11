`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:08:18 PM
// Design Name: 
// Module Name: testbench_two_mux
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


module testbench_two_mux(

    );
    reg sel;
    reg [1:0] in0 = 3;
    reg [1:0] in1 = 0;
    wire [1:0] out;
    two_to_one_mux #(.WIDTH(2)) uut (.sel(sel), .in0(in0), .in1(in1), .out(out));
    
    initial begin
        sel = 0;
        #10;
        sel = 1;
        #10;
    end
endmodule
