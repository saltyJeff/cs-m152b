`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 12:56:27 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input rst,
    input clk,
    input [5:0] Ra,
    input [5:0] Rb,
    input [5:0] Rw,
    input WrEn,
    input [15:0] busW,
    output reg [15:0] busA,
    output reg [15:0] busB
    );
    reg [15:0] ram [31:0];
    integer i;
    always @(posedge clk) begin
        if(rst) begin
            for(i = 0; i < 32; i=i+1) begin
                ram[i] <= 16'h00;
            end
            busA <= 0;
            busB <= 0;
        end
        else begin
            if(WrEn) begin
                ram[Rw] <= busW; 
            end
            busA <= (WrEn && Ra == Rw) ? busW : ram[Ra];
            busB <= (WrEn && Rb == Rw) ? busW : ram[Rb];
        end
    end
endmodule
