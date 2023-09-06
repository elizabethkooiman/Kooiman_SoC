`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// 
// Create Date: 09/05/2023 03:57:46 PM
// Module Name: top_class_report_1
// Project Name: Class Report 1
//////////////////////////////////////////////////////////////////////////////////


module top_class_report_1(
    input logic clk, 
    input logic en,
    input logic cw,
    input logic rst,
    output logic [7:0] AN,
    output logic [6:0] seg
    );

    assign AN[7:4] = 4'b1111;

    rotate_square rotate(
    .clk(clk),
    .rst(rst),
    .up(cw),
    .en(en),
    .an(AN[3:0]),
    .sseg(seg)
    );
endmodule
