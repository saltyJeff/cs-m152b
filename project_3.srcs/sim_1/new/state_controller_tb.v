`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2022 01:31:29 PM
// Design Name: 
// Module Name: state_controller_tb
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


module state_controller_tb(

    );
    
    reg clk;
    reg [3:0] current_state;
    wire [3:0] next_state;
    reg traffic;
    reg walk;
    reg counter_rst;
    wire [2:0] counter;
   
    
    state_controller uut(.sec_clk(clk),.current_state(current_state), .traffic(traffic), .walk(walk), .counter_rst(counter_rst), .next_state(next_state), .counter(counter));
    
     always begin
        clk = ~clk;
        #0.5;
    end
    
    initial begin
        counter_rst = 1;
        clk = 0;
        current_state = 0;
        walk = 0;
        traffic = 0;
        #1;
        counter_rst = 0;
        
        
//        counter_rst <= 0;    
//        clk <= 0;
//        current_state <= 3'b000;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
        counter_rst = 1;
        #5;
        counter_rst = 0;
        
        current_state = 3'b000;
        traffic = 1;
        walk = 0;
        #10;
        // MGSR3 -> 010
        
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b001;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b010;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b011;
//        traffic <= 0;
//        walk <= 1;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b011;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b100;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b101;
//        traffic <= 1;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b101;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b110;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
//        current_state <= 3'b111;
//        traffic <= 0;
//        walk <= 0;
//        #10;
        
//        counter_rst <= 1;
//        #5;
//        counter_rst <= 0;
        
    end
endmodule
