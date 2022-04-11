`timescale 1ns / 1ps

module shift_stuff(
        input [15:0] a,
        input [3:0] b,
        
        output reg [15:0] lsl,
        output reg [15:0] lsr,
        output reg [15:0] asl,
        output reg [15:0] asr,
        output reg aslOflow,
        output reg asrOflow
    );
    reg [15:0] sl8, sl4, sl2, sl1;
    reg [15:0] lsr8, lsr4, lsr2, lsr1;
    reg [15:0] asr8, asr4, asr2, asr1;

    
    always @(*) begin

        // shift left
        sl8 = b[3] ? {a[15-8:0], 8'h0} : a;
        sl4 = b[2] ? {sl8[15-4:0], 4'h0} : sl8;
        sl2 = b[1] ? {sl4[15-2:0], 2'h0} : sl4;
        sl1 = b[0] ? {sl2[15-1:0], 1'h0} : sl2;
        lsl = sl1;
        asl = sl1;
        
        // shift right logical
        lsr8 = b[3] ? {8'h0, a[15:8]} : a;
        lsr4 = b[2] ? {4'h0, lsr8[15:4]} : lsr8;
        lsr2 = b[1] ? {2'h0, lsr4[15:2]} : lsr4;
        lsr1 = b[0] ? {1'h0, lsr2[15:1]} : lsr2;
        lsr = lsr1;
        
        // shift right arithmetic
        asr8 = b[3] ? {a[15], a[15], a[15], a[15], a[15], a[15], a[15], a[15], a[15:8]} : a;
        asr4 = b[2] ? {a[15], a[15], a[15], a[15], asr8[15:4]} : asr8;
        asr2 = b[1] ? {a[15], a[15], asr4[15:2]} : asr4;
        asr1 = b[0] ? {a[15], asr2[15:1]} : asr2;
        asr = asr1;
        
        aslOflow = (a[15] ^ asl[15]);
        asrOflow = (a[15] ^ asr[15]);
    end
endmodule
