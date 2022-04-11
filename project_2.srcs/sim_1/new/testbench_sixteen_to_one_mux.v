`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2022 12:59:09 PM
// Design Name: 
// Module Name: testbench_sixteen_to_one_mux
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


module testbench_sixteen_to_one_mux(

    );
    
    reg [3:0] sel;
    reg [15:0] in [15:0];
    wire [15:0] out;
    sixteen_to_one_mux #(.WIDTH(16)) uut (.sel(sel), 
                            .in0(in[0]),
                            .in1(in[1]),
                            .in2(in[2]),
                            .in3(in[3]),
                            .in4(in[4]),
                            .in5(in[5]),
                            .in6(in[6]),
                            .in7(in[7]),
                            .in8(in[8]),
                            .in9(in[9]),
                            .in10(in[10]),
                            .in11(in[11]),
                            .in12(in[12]),
                            .in13(in[13]),
                            .in14(in[14]),
                            .in15(in[15]), 
                            .out(out));
    
    
    integer i;
    initial begin
        for(i = 0; i < 16; i=i+1) begin
            in[i] = i;
        end
        
        for(i=0; i < 16; i=i+1) begin
            sel = i;
            #10;
        end
    end
        
    
endmodule
