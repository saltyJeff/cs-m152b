`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 01:48:01 PM
// Design Name: 
// Module Name: debounce
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


module debounce(
        input rst,
        input in,
        input clk,
        output reg out
    );
    reg [16:0] divider;
    wire divider_clk = divider[16];
    always @(posedge clk or posedge rst) begin
        if (rst) begin 
            divider <= 0;
        end
        else begin
            divider <= divider + 1;
        end
    end
    reg [10:0] debounce_reg;
    always @(posedge divider_clk) begin
        debounce_reg <= {debounce_reg[9:0], !in};
    end
    always @(*) begin
      out = debounce_reg == 0;
    end
endmodule
