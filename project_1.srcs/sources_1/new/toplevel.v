`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2022 12:12:34 PM
// Design Name: 
// Module Name: toplevel
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


module toplevel(
    input clk,
    input btnC,
    input [15:0] sw,
    output [15:0] led
    );
    
    reg [25:0] clk_divider;
    
    always @(posedge clk) begin
        clk_divider <= clk_divider + 1;
    end
    
    four_bit_counter counter(
        .clk(clk_divider[25]),
        .enable(sw[0]),
        .counter_out(led[3:0]),
        .reset(sw[15])
        );
endmodule
