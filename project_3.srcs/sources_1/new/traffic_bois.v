`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:39:11 PM
// Design Name: 
// Module Name: traffic_bois
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


module traffic_bois(
        input traffic,
        input walk,
        input rst,
        input clk,
        input speedy_clk,
        input freeze,
        output reg [2:0] state,
        output reg [2:0] counter,
        output reg walk_reg
    );
    wire [2:0] next_state;
    parameter MGSR6_0 = 3'b000, MGSR3 = 3'b010, MGSR6_1 = 3'b001, MYSR = 3'b011, WG = 3'b100, MRSG6 = 3'b101, MRSY = 3'b111, MRSG3 = 3'b110; 
    state_seq combinational_boi(counter, traffic, walk_reg, state, next_state);
    always @(posedge speedy_clk or posedge rst) begin
        if (rst) walk_reg <= 0;
        else if(freeze) walk_reg <= walk_reg;
        else if(state == WG && next_state == MRSG6) walk_reg <= 0;
        else walk_reg <= walk | walk_reg;
    end
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= 0;
            counter <= 1;
        end
        else if (freeze) begin
            counter <= counter;
            state <= state;
        end
        else begin
            state <= next_state;
            if(state == next_state) begin
                counter <= counter + 1;
            end
            else begin
                counter <= 1;
            end
        end
    end
endmodule
