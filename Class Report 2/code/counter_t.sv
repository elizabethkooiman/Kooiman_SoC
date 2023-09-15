`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2023 12:50:25 PM
// Design Name: 
// Module Name: counter_t
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


module counter_t();

parameter N = 4;
     logic clk;
     logic rst;
     logic en;
     logic [N-1:0] count;
    
    
    
counter#(.N(N)) uut(
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count)
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
    #100
    
    $finish;
    end
endmodule
