`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 01:40:41 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
        input rst,
        input clk,
        input traffic,
        input walk,
        input freeze,
        output reg MG,
        output reg MY,
        output reg MR,
        output reg SG,
        output reg SY,
        output reg SR,
        output reg W,
        output wire [3:0] state,
        output wire debounce_out
    );
    
    wire sec_clk;
    wire debounced_walk;
    parameter MGSR6_0 = 3'b000, MGSR3 = 3'b010, MGSR6_1 = 3'b001, MYSR = 3'b011, WG = 3'b100, MRSG6 = 3'b101, MRSY = 3'b111, MRSG3 = 3'b110; 

    clk_1hz sec_clk_module(
        .rst(rst), 
        .clk(clk),
        .sec_clk(sec_clk)
        );
    
    
    debounce button_debounce(.in(walk), .clk(clk), .out(debounced_walk));
    
    wire walk_reg;
    traffic_bois traffic_module(
            .traffic(traffic),
            .walk(walk),
            .rst(rst),
            .freeze(freeze),
            .clk(sec_clk),
            .speedy_clk(clk),
            .state(state),
            .walk_reg(walk_reg)
        );
    
    assign debounce_out = walk_reg;
    
    always @(*) begin
        case(state)
        MGSR6_0, MGSR6_1, MGSR3: begin
            MG = 1;
            MY = 0;
            MR = 0;
            SG = 0;
            SY = 0;
            SR = 1;
            W = 0;
        end
        MYSR: begin
            MG = 0;
            MY = 1;
            MR = 0;
            SG = 0;
            SY = 0;
            SR = 1;
            W = 0;
        end
        WG: begin
            MG = 0;
            MY = 0;
            MR = 1;
            SG = 0;
            SY = 0;
            SR = 1;
            W = 1;
        end
        MRSG6, MRSG3: begin
            MG = 0;
            MY = 0;
            MR = 1;
            SG = 1;
            SY = 0;
            SR = 0;
            W = 0;
        end
        MRSY: begin
            MG = 0;
            MY = 0;
            MR = 1;
            SG = 0;
            SY = 1;
            SR = 0;
            W = 0;
        end
        default: begin
            MG = 1;
            MY = 1;
            MR = 1;
            SG = 1;
            SY = 1;
            SR = 1;
            W = 1;
        end
        endcase
    end
     
    
endmodule
