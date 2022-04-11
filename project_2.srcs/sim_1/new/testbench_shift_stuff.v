`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 12:24:37 PM
// Design Name: 
// Module Name: testbench_shift_stuff
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


module testbench_shift_stuff(

    );
    
    reg [15:0] a;
    reg [3:0] b;
    wire [15:0] asr;
    wire [15:0] lsr;
    wire [15:0] asl;
    wire [15:0] lsl;
    wire aslOflow;
    wire asrOflow;
    
    shift_stuff uut (.a(a),.b(b), .lsl(lsl), .lsr(lsr), .asl(asl), .asr(asr), .aslOflow(aslOflow), .asrOflow(asrOflow));
    integer i;
    
    initial begin
        a = 'hffff;
        for (i = 0; i < 16; i = i+1) begin
            b = i;
            #10;
        end
        
        a = 'h8000;
        for (i = 0; i < 16; i = i+1) begin
            b = i;
            #10;
        end
        
        a = 'h1;
        for (i = 0; i < 16; i = i+1) begin
            b = i;
            #10;
        end
    end
endmodule
