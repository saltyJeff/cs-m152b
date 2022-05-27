
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SYSU
// Engineer: liuzs
// 
// Create Date: 2018/12/03 21:37:38
// Design Name: 
// Module Name: ov7670_top
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


module ov7670_top(
input  clk100,
input  OV7670_VSYNC, //SCCB???????????
input  OV7670_HREF,  //SCCB???????????
input  OV7670_PCLK,  //??????
output OV7670_XCLK,  //???????
output OV7670_SIOC, 
inout  OV7670_SIOD,
input [7:0] OV7670_D, //?????
input [5:0] sw,
// JSTK2
input MISO,
input RST,


output MOSI,
output SS,
output SCLK,
//
output [2:0] LED,
output reg [3:0] vga_red,
output reg [3:0] vga_green,
output reg [3:0] vga_blue,
output wire vga_hsync, //????
output wire vga_vsync, //???
output pwdn,
output reset,
output [3:0] AN,
output [6:0] SEG
);
wire [16:0] frame_addr;
wire [16:0] capture_addr;   
//wire  capture_we;  
wire  config_finished;  
wire  clk25; 
wire  clk50;     
wire  resend;        
wire [11:0] frame_pixel;  
wire [3:0]  data_12;
//wire [11:0]  data_12;
//wire [11:0] cam_color;

//vga
wire [9:0] sx;
wire [9:0] sy;
wire de;
wire valid_address;


  
assign pwdn = 0; //0??????1??????
assign reset = 1;
  

//assign LED = {3'b0,config_finished};
assign  	OV7670_XCLK = clk25;  
debounce   btn_debounce(
		.clk(clk50),
		.i(RST),
		.o(resend)
);


simple_480p disp(
    .clk_pix(clk25),   // pixel clock
    .sx(sx),  // horizontal screen position
    .sy(sy),  // vertical screen position
    .hsync(vga_hsync),     // horizontal sync
    .vsync(vga_vsync),     // vertical sync
    .de(de)     // data enable (low in blanking interval)
);
wire [15:0] cam_x, cam_y;
 ov7670_capture capture(         //??ov7670?????
 		.pclk  (OV7670_PCLK),    //??????
 		.vsync (OV7670_VSYNC),   //???
 		.href  (OV7670_HREF),    //???? 
 		.d     ( OV7670_D),      //??????
 		.addr (capture_addr),         //12?????
        .dout(data_12),
 		.we   ()
 	);
 parameter WIDTH = 320;
//parameter WIDTH = 160;
 wire [3:0] lu, mu, ru, lm, mm, rm, lb, mb, rb;
// wire [11:0] screen_color;
//conv_buffer conv_buf(OV7670_PCLK, capture_addr, data_12, clk25, sx, sy, screen_color);

//wire [15:0] cap_x, cap_y;
//assign cap_x = capture_addr % WIDTH;
//assign cap_y = capture_addr / WIDTH;
//wire [11:0] write_addr = (cap_x / 2) + (cap_y / 2) * WIDTH;

parameter WIDTH_D4 = 320 / 4;


blk_mem_gen_0 buf0(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 - 1 - WIDTH_D4), .doutb(lu));
blk_mem_gen_0 buf1(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 - WIDTH_D4), .doutb(mu));
blk_mem_gen_0 buf2(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 + 1 - WIDTH_D4), .doutb(ru));
blk_mem_gen_0 buf3(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 - 1), .doutb(lm));
blk_mem_gen_0 buf4(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4), .doutb(mm));
blk_mem_gen_0 buf5(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 + 1), .doutb(rm));
blk_mem_gen_0 buf6(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 - 1 + WIDTH_D4), .doutb(lb));
blk_mem_gen_0 buf7(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 + WIDTH_D4), .doutb(mb));
blk_mem_gen_0 buf8(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4 + 1 + WIDTH_D4), .doutb(rb));


// blk_mem_gen_0 buf4(.clka(OV7670_PCLK), .wea(1'b1), .addra(capture_addr / 4), .dina(data_12), .clkb(clk25), .addrb((sx + WIDTH*sy) / 4), .doutb(mm));


//assign vga_red = de ? screen_color : 0;
//assign vga_green = de ? screen_color : 0;
//assign vga_blue = de ? screen_color : 0;



wire [3:0] color;

filters filter(sw, lu, mu, ru, lm, mm, rm, lb, mb, rb, constant, color);

ssdCtrl DispCtrl(
        .CLK(clk100),
        .RST(RST),
        .DIN(sw[5] ? 6 : (sw[4] ? 5 : (sw[3] ? 4 : (sw[2] ? 3 : (sw[1] ? 2  : (sw[0] ? 1 : 0)))))),
        .AN(AN),
        .SEG(SEG)
);
			

always @(*) begin
    if (sx < 320) begin
        vga_red = (de && sx >= 0 && sx < 320) && (sy >= 0 && sy < 240) ? color : 0;
        vga_green = (de && sx >= 0 && sx < 320) && (sy >= 0 && sy < 240) ? color : 0;
        vga_blue = (de && sx >= 0 && sx < 320) && (sy >= 0 && sy < 240) ? color : 0;
    end
    else begin 
        vga_red = (de && sx >= 320 && sx < 640) && (sy >= 0 && sy < 240) ? mm : 0;
        vga_green = (de && sx >= 320 && sx < 640) && (sy >= 0 && sy < 240) ? mm : 0;
        vga_blue = (de && sx >= 320 && sx < 640) && (sy >= 0 && sy < 240) ? mm : 0;
    end

end
 
I2C_AV_Config IIC(                 //???SCCB?????
 		.iCLK   ( clk25),          //??25MHz??
 		.iRST_N (! resend),        //??
 		.Config_Done ( config_finished),    //?ov7670??????????????config_finished??
 		.I2C_SDAT  ( OV7670_SIOD),   //???? 
 		.I2C_SCLK  ( OV7670_SIOC),   //??????
 		.LUT_INDEX (),
 		.I2C_RDATA ()
 		); 
		
clk_wiz_0 clk_div(
        .reset(RST),
		.clk_in1 (clk100),
		.clk_out1  (clk50),
		.clk_out2 (clk25)
);

wire [9:0] posData;
// REMARK: anode and seg are NC within this module
PmodJSTK_Demo jstk(clk100, RST, MISO, 3'b111, SS, MOSI, SCLK, LED, AN, SEG, posData);

reg [2:0] constant;
// posData will change the constant, default postData is 526 (Y axis)
always @(*) begin
    if(posData < 250) begin
        constant = 1;
    end
    else if(posData < 750) begin
        constant = 0;
    end
    else begin
        constant = 2;
    end;
end


endmodule