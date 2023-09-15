`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2023 02:49:39 PM
// Design Name: 
// Module Name: num2sseg_t
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


module num2sseg_t();

     logic [3:0] num;
     logic [6:0] sseg;
   

num2sseg uut(
    .num(num),
    .sseg(sseg)
    );
    
    initial begin 
    num = 4'b0000;
    #5;
    num = 4'b0001;
    #5;
    num = 4'b0010;
    #5;
    num = 4'b0011;
    #5;
    num = 4'b0100;
    #5;
    num = 4'b0101;
    #5;
    num = 4'b0110;
    #5;
    num = 4'b0111;
    #5;
    num = 4'b1000;
    #5;
    num = 4'b1001;
    #5;
    $finish;
    end

endmodule
