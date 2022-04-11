`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:38:32 PM
// Design Name: 
// Module Name: testbench_one_bit_alu
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


module testbench_one_bit_alu(

    );
    reg a;
    reg b;
    reg [1:0] sel;
    wire o;
    
    one_bit_alu alu(.a(a), .b(b), .sel(sel), .out(o));
    initial begin
        a = 0;
        b = 1;
        sel = 0;
        #10;
        sel = 1;
        #10;
        sel = 2;
        #10;
        sel = 3;
        #10;
        
        a = 0;
        b = 0;
        sel = 0;
        #10;
        sel = 1;
        #10;
        sel = 2;
        #10;
        sel = 3;
        #10;
        
        a = 1;
        b = 1;
        sel = 0;
        #10;
        sel = 1;
        #10;
        sel = 2;
        #10;
        sel = 3;
        #10;
    end
endmodule
