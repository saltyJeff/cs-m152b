`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:42:51 PM
// Design Name: 
// Module Name: traffic_bois_tb
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


module traffic_bois_tb;
    reg traffic;
    reg walk;
    reg rst;
    reg clk;
    reg speedy_clk;
    wire [2:0] state;
    wire [2:0] counter;
    wire walk_reg;

    traffic_bois boi(.traffic(traffic), .walk(walk), .rst(rst), .clk(clk), .state(state), .counter(counter), .speedy_clk(speedy_clk), .walk_reg(walk_reg));
    always begin
        clk = ~clk;
        #1;
    end
    
    always begin
        speedy_clk = ~speedy_clk;
        #0.001;
    end
    
    initial begin
        rst = 1;
        traffic = 0;
        walk = 1;
        clk = 0;
        speedy_clk = 0;
        #2;
        rst = 0;
        
    end
endmodule
