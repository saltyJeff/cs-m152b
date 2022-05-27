`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 04:12:56 PM
// Design Name: 
// Module Name: filters
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


module filters(
        input [5:0] sw,
        input [3:0] lu,
        input [3:0] mu,
        input [3:0] ru,
        input [3:0] lm,
        input [3:0] mm,
        input [3:0] rm,
        input [3:0] lb,
        input [3:0] mb,
        input [3:0] rb,
        input [2:0] constant,
        output reg [3:0] color
    );
    
    
    always @(*) begin
        if (sw == 1) begin
            color = (lu + mu + ru + lm + mm + rm + lb + mb + rb)/9; // blur
        end 
        else if (sw == 2) begin
            color = (lu - ru + lm*2 + rm*-2 + lb - rb); // x_direction kernel
        end
        else if (sw == 4) begin
            color = (lu + 2*mu + ru - lb - 2*mb - rb); // y_direction kernel
        end
        else if (sw == 8) begin
            if (constant != 0) begin
                color = (-mu + -lm + 4 * mm + -rm + -mb);
            end
            else begin
                color = ((lu - ru + lm*2 + rm*-2 + lb - rb + lu + 2*mu + ru - lb - 2*mb - rb)/2); // edge detection
            end
        end
        else if (sw == 16) begin
            color = (2*mm - (lu + mu + ru + lm + mm + rm + lb + mb + rb)/9); // sharpen
        end
        else if (sw == 32) begin
            if(constant == 1) begin
                color = ((2*lu + 4*mu + 2*ru + 4*lm + 4*mm + 4*rm + 2*lb + 4*mb + 2*rb)/28); // gaussian kernel
                //color = 15;
            end
            else if(constant == 2) begin
                color = ((2*mu + 2*lm + 4*mm + 2*rm + 2*mb)/ 12); // gaussian kernel
                //color = 0;
            end
            else begin
                color = ((lu + 2*mu + ru + 2*lm + 4*mm + 2*rm + lb + 2*mb + rb)/16); // gaussian kernel
            end               
        end
        else begin
            color = mm;
        end
        
    end
endmodule
