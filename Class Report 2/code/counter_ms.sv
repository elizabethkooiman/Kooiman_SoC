`timescale 1ns / 1ps
////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/13/2023 09:55:52 AM
// Module Name: counter_ms
// Project Name: Class Report 2
// Description: 
///////////////////////////////////

module counter_ms(
    input logic clk,
    input logic rst,
    input logic en,
    output logic [10:0] ms_count
    );

    logic [31:0] count, curr_ms;
    always_ff @(posedge(clk),posedge(rst))
    if(rst) begin
        curr_ms = {32{1'b0}};
        count = {32{1'b0}};
        end
    else begin
        if(count == 99999)
        begin
            count <=0;
            curr_ms = curr_ms +1;
        end
        else if(en)
            count = count +1;
        end
        
    assign ms_count = curr_ms[10:0];
    
endmodule
