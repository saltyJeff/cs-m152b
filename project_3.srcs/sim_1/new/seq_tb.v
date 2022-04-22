`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:54:52 PM
// Design Name: 
// Module Name: seq_tb
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


module seq_tb(

    );
    
    reg [2:0] state;
    wire [2:0] next_state;
    reg [2:0] counter;
    
    reg traffic;
    reg walk;
    
    
    state_seq uut(.counter(counter), .walk(walk), .traffic(traffic), .state(state), .next_state(next_state));

    initial begin
        // If the traffic sensor is high at the end of the first 6 second length
        state = 3'b0000;
        counter = 3;
        traffic = 1;
        walk = 0;
        #5;
        // next_state = 3'b0000
        // Then the light should remain green for additional 3 seconds
        state = 3'b0000;
        counter = 6;
        traffic = 1;
        walk = 0;
        #5;
        // next_state = 3'b0001
        // Else, the light should remain green for additional 6 seconds
        state = 3'b0000;
        counter = 6;
        traffic = 0;
        walk = 0;
        #5;
        // next_state = 3'b0010
        
        // Walk signal high
        state = 3'b0011;
        counter = 2;
        traffic = 0;
        walk = 1;
        #5;
        // next_state = 3'b0100
        
        state = 3'b0011;
        counter = 2;
        traffic = 0;
        walk = 0;
        #5;
        // next_state = 3'b0101
        
        state = 3'b0101;
        counter = 6;
        traffic = 1;
        walk = 0;
        #5;
        // next_state = 3'b0110
        
        
        state = 3'b0101;
        counter = 6;
        traffic = 0;
        walk = 0;
        #5;
        // next_state = 3'b0111
    end

endmodule
