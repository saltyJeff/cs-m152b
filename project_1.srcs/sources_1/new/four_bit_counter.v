`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 12:21:21 PM
// Design Name: 
// Module Name: four_bit_counter
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


module four_bit_counter(
        input clk,
        input reset,
        input enable,
        output reg [3:0] counter_out
    );
    
    always @(posedge clk) begin
        if (reset) begin
            counter_out <= 0;
        end
        else if (enable) begin
            counter_out <= counter_out + 1;
        end
    end
    
endmodule
