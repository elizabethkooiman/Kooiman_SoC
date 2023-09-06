`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/05/2023 03:41:58 PM
// Module Name: rotate_square
// Project Name: Class Report 1
//////////////////////////////////////////////////////////////////////////////////

module rotate_square#(parameter N = 29)(
    input logic clk,
    input logic rst,
    input logic up,
    input logic en,
    output logic [3:0] an,
    output logic [6:0] sseg
    );

    logic [N-1:0] count;
    logic tic;
    
    
    count_n#(.N(N)) counter(
    .clk(clk),
    .rst(rst),
    .up(up),
    .en(en),
    .tic(tic),
    .count(count)
    );
    
    sseg_decoder sseg1(
    .in(count[N-1:N-3]),
    .sseg(sseg), 
    .an(an)
    );
    
    
endmodule
