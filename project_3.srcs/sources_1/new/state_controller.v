`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2022 01:00:06 PM
// Design Name: 
// Module Name: state_controller
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


module state_controller(
        input sec_clk,
        input [2:0] current_state,
        input traffic,
        input walk,
        input counter_rst,
        output reg [3:0] next_state,
        output reg [2:0] counter
    );
    
    parameter MGSR6_0 = 3'b000, MGSR3 = 3'b010, MGSR6_1 = 3'b001, MYSR = 3'b011, WG = 3'b100, MRSG6 = 3'b101, MRSY = 3'b111, MRSG3 = 3'b110; 
    
    always @(posedge sec_clk) begin: FSM
        if (counter_rst == 1) begin
            counter <= 0;
        end
        else begin
            case(current_state)
                MGSR6_0:
                    if (counter == 6) begin
                        if (traffic == 1) begin 
                            next_state <= MGSR3;
                            counter <= 0; 
                        end
                        else begin
                            next_state <= MGSR6_1; 
                            counter <= 0; 
                        end
                    end
                    else begin
                        next_state <= current_state;
                        counter <= counter + 1;
                    end
                MGSR3:
                    if (counter == 3) begin
                        next_state <= MYSR;
                        counter <= 0;
                    end
                    else begin 
                        next_state <= current_state;
                        counter <= counter + 1;
                    end
               MGSR6_1:
                   if (counter == 6) begin
                        next_state <= MYSR;
                        counter <= 0;
                   end
                   else begin
                       next_state <= current_state;
                       counter <= counter + 1;
                   end
               MYSR:
                   if (counter == 2) begin
                        if (walk == 1) begin
                            next_state <= WG; 
                        end
                        else begin
                            next_state <= MRSG6;
                        end
                        counter <= 0;
                   end
                   else begin
                       next_state <= current_state;
                       counter <= counter + 1;
                   end
              WG:
                   if (counter == 3) begin
                       next_state <= MRSG6;
                       counter <= 0;
                   end
                   else begin
                       next_state <= current_state;
                       counter <= counter + 1;
                   end
              MRSG6:
                  if (counter == 6) begin
                      if (traffic == 1) begin 
                          next_state <= MRSG3;
                          counter <= 0; 
                      end
                      else begin
                          next_state <= MRSY; 
                          counter <= 0; 
                      end
                  end
                  else begin
                      next_state <= current_state;
                      counter <= counter + 1;
                  end
               MRSG3:
                  if (counter == 3) begin
                     next_state <= MRSY; 
                     counter <= 0; 
                  end
                  else begin
                     next_state <= current_state;
                     counter <= counter + 1;
                  end
               MRSY:
                  if (counter == 2) begin
                    next_state <= MGSR6_0; 
                    counter <= 0; 
                  end
                  else begin
                    next_state <= current_state;
                    counter <= counter + 1;
                  end
               default:
                  begin
                    counter <= counter +1;
                    next_state <= current_state; 
                  end
              endcase
           end
    end
    
endmodule
