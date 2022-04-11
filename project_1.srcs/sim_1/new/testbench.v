`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2022 12:26:50 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    
    reg reset;
    reg clock;
    reg enable;
    wire [3:0] counter_out;
    
    four_bit_counter uut(
        .reset(reset),
        .clk(clock),
        .enable(enable),
        .counter_out(counter_out)
        );
    
    always begin 
        clock <= ~clock;
        #1;
     end
     
     initial begin
        clock <= 0;
        enable <= 1;
        #1;
        reset <= 1;
        #2;
        reset <= 0;
        #10;
        enable <= 0;
        #5;
        enable <= 1;
     end
    
endmodule
