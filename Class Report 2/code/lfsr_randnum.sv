`timescale 1ns / 1ps
//////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/13/2023 09:16:28 PM
// Module Name: lfsr_randnum
// Project Name: Class Report 2
// Description: 
//////////////////////////////


module lfsr_randnum#(parameter N = 13)(
        input logic clk,
        input logic rst,
        output logic [N-1:0] rnd
    );

always_ff@(posedge(clk),posedge(rst))
begin
if(rst)
    rnd = {N{1'b1}};
else
    rnd = {rnd[N-2:0],(rnd[N-1]^rnd[N-2])};
end
endmodule
