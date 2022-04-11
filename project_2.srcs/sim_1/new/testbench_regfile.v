`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2022 12:08:06 PM
// Design Name: 
// Module Name: testbench_regfile
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


module testbench_regfile;
  reg rst;
  reg clk;
  reg [5:0] Ra;
  reg [5:0] Rb;
  reg [5:0] Rw;
  reg WrEn;
  reg [15:0] busW;
  wire [15:0] busA;
  wire [15:0] busB;
  
  reg_file uut(rst, clk, Ra, Rb, Rw, WrEn, busW, busA, busB);
  
  initial begin
    clk = 0;
    rst = 1;
    Ra = 0;
    Rb = 0;
    WrEn = 0;
    #10;
    rst = 0;
    
    // write in addr 1 and 31
    WrEn = 1;
    Rw = 1;
    busW = 1;
    #10;
    Rw = 31;
    busW = 31;
    #10;
    
    // test read
    Ra = 1;
    Rb = 31;
    WrEn = 0;
    #10;
    
    // test concurrent read/write
    Ra = 1;
    Rb = 2;
    WrEn = 1;
    Rw = 2;
    busW = 2;
    #10;
    
    // test write persistence
    WrEn = 0;
    #10;
    
    // RST highest priority
    rst = 1;
    WrEn = 1;
    // ... expect everything to zed-out
    
  end
  always begin
    clk = ~clk;
    #5;
  end
endmodule
