`timescale 1ns / 1ps
////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 10/10/2023 06:47:52 PM
// Project Name: Class Report 3
// Description: 
// 
/////////////////////////////////////


module counter_ms(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [15:0] ms_count,
    output logic ms_tick
    );
    localparam MILLISECOND = 20'b00011000011010100000;
    logic [31:0] count, next_count, curr_ms;
    always_ff @(posedge(clk),posedge(rst))
    if(rst) begin
        curr_ms = {32{1'b0}};
        count = {32{1'b0}};
        end
    else begin
        if(en)
        count <= next_count;
        end
        
    assign ms_tick = (count == MILLISECOND);
    assign ms_count = curr_ms[15:0];
    assign next_count = (count==MILLISECOND)? 0: count +1;
    
endmodule
