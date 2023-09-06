`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/05/2023 05:56:28 PM
// Module Name: rotate_square_t
// Project Name: Class Report 1
//////////////////////////////////////////////////////////////////////////////////
  
module rotate_square_t();

logic clk;
logic rst;
logic up;
logic en;
logic [3:0] an;
logic [6:0] sseg;
parameter N = 4;
rotate_square #(.N(N)) uut(
    .clk(clk),
    .rst(rst),
    .up(up),
    .en(en),
    .an(an),
    .sseg(sseg)
    );
    
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    
    initial begin
    rst = 1;
    #10;
    rst = 0;
    #10;
    
    //TEST CLOCKWISE
    en = 1;
    up = 1;
    #100;
    en = 0;
    #100;
    en = 1;
    #100;
    up = 0;
    #100;
    $finish;
    end


endmodule
