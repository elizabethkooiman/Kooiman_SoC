`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2023 11:41:08 AM
// Design Name: 
// Module Name: counter
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


module counter#(parameter N = 20)(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [N-1:0] count
    );
    
    parameter ZERO={N{1'b0}};
    logic [N-1:0] count_curr;
    logic [N-1:0] count_next;
    
    always_ff @(posedge(clk),posedge(rst))
    begin
        if (rst) begin
        count_curr <= ZERO;
        end
        else begin
        count_curr <= count_next;
        end
    end
    
    always_comb 
        if(en) begin
            count_next = count_curr +1;
            
        end
        else begin
            count_next = count_curr;
        end
    
    assign count = count_curr;
    
endmodule
