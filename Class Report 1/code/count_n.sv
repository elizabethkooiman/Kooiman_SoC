`timescale 1ns / 1ps
//////////////////////////////////////////////
// Company: 
// Engineer: Elizabeth Kooiman
// Create Date: 09/05/2023 03:02:20 PM
// Module Name: count_n
// Project Name: Class Report 1
////////////////////////////////////////////


module count_n#(parameter N=20)(
    input logic clk,
    input logic rst,
    input logic up,
    input logic en,
    output logic tic,
    output logic [N-1:0] count
    );
    parameter ZERO={N,{1'b0}};
    logic [N-1:0] count_curr;
    logic [N-1:0] count_next;
    
    always_ff @(posedge(clk),posedge(rst))
    begin
        if (rst) begin
        count_curr <= ZERO;
        end
        //else if(en) begin
        else begin
        count_curr <= count_next;
        end
    end
    
    always_comb 
        if(en) begin
            if(up) begin
                count_next = count_curr +1;
                end
            else begin
                count_next = count_curr -1;
                end
        end
        else begin
            count_next = count_curr;
        end
    
    
    assign count = count_curr;
    assign tic = count_curr == 1;
    
    
    
endmodule
