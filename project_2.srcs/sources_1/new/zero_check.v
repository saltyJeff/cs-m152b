`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2022 12:26:30 PM
// Design Name: 
// Module Name: zero_check
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


module zero_check #(WIDTH=16) (
        output isZero,
        input [WIDTH-1:0] a
    );
    wire [WIDTH-1:0] int;
    assign int[0] = a[0];
    genvar i;
    generate
        for(i = 0; i < WIDTH-1; i=i+1) begin: elon_mux
            or orblck (int[i+1], a[i+1], int[i]);
        end
    endgenerate
    not(isZero, int[15]);
endmodule
