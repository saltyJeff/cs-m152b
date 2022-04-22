`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 01:30:13 PM
// Design Name: 
// Module Name: clk_1hz
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


module clk_1hz(
    input rst, 
    input clk,
    output reg sec_clk
    );
    
    reg[25:0] a;
    
    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            a <= 26'b0;
            sec_clk <= 0;
        end
        else if (a == 49999999) begin
            sec_clk <= ~sec_clk;
            a <= 26'b0;
        end
        else begin
            a <= a + 1'b1;
        end
    end
endmodule
