`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 12:27:53 PM
// Design Name: 
// Module Name: state_seq
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


module state_seq(
        input [2:0] counter,
        input traffic,
        input walk,
        input [2:0] state,
        output reg [2:0] next_state
    );
    parameter MGSR6_0 = 3'b000, MGSR3 = 3'b010, MGSR6_1 = 3'b001, MYSR = 3'b011, WG = 3'b100, MRSG6 = 3'b101, MRSY = 3'b111, MRSG3 = 3'b110; 
    always @(*) begin
        next_state = state;
        case(state)
        MGSR6_0:
            if (counter == 6)
                next_state = traffic ? MGSR3 : MGSR6_1;
            //$display("counter=%d, traffic=%d, next_state=%b", counter, traffic, next_state);
        MGSR3:
           if (counter == 3) begin
               next_state = MYSR;
           end
        MGSR6_1:
          if (counter == 6) begin
               next_state = MYSR;
          end
        MYSR:
          if (counter == 2) begin
               if (walk == 1) begin
                   next_state = WG; 
               end
               else begin
                   next_state = MRSG6;
               end
          end
         WG:
              if (counter == 3) begin
                  next_state = MRSG6;
              end
         MRSG6:
             if (counter == 6) begin
                 if (traffic == 1) begin 
                     next_state = MRSG3;
                 end
                 else begin
                     next_state = MRSY; 
                 end
             end
          MRSG3:
             if (counter == 3) begin
                next_state = MRSY; 
             end
          MRSY:
             if (counter == 2) begin
               next_state = MGSR6_0; 
             end
          default:
             begin
               next_state = state;
             end
        endcase
      end
endmodule
