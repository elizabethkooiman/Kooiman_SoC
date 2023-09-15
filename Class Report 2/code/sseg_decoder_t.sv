`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 09:25:48 AM
// Design Name: 
// Module Name: sseg_decoder_t
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


module sseg_decoder_t();

     logic [1:0] sel;
     logic [27:0] ms;
     logic rst;
     logic clk;
     logic [6:0] sseg;
     logic[3:0] an;
     logic en;
     parameter N = 4;
     counter#(.N(N)) count1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(ms)
    );
    
    sseg_decoder uut(
    .sel(sel),
    .ms(ms),
    .rst(rst),
    .clk(clk),
    .sseg(sseg),
    .an(an)
    );
    
    
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
        
        rst = 0;
        #5;
        rst = 1;
        #5;
        rst = 0;
        en = 1;
        ms[27:N] = {23{1'b0}};
        #5;
        sel = 2'b00;
        #50;
        sel = 2'b01;
        #50;
        sel = 2'b10;
        #50;
        sel = 2'b11;
        #50;
        $finish;
    end
    
    
endmodule
