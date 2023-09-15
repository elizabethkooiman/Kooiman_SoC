`timescale 1ns / 1ps
//////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/07/2023 12:38:20 PM
// Module Name: sseg_decoder
// Project Name: Class Report 2 
// Description: 
/////////////////////////////////////


module sseg_decoder(
    input logic [1:0] sel,
    input logic [10:0] ms,
    input logic rst,
    input logic clk,
    output logic [6:0] sseg,
    output logic[3:0] an
    );
    
    localparam clear = 2'b00;
    localparam stop_early = 2'b01;
    localparam start = 2'b10;
    localparam count = 2'b11;
    localparam refresh_N = 20;
    
    //declare variables
    logic [15:0] bcd_ms;
    logic [3:0] num2sseg_in;
    logic [6:0] num2sseg_out;
    
    //setup refresh to display on the 4 sseg
    logic [refresh_N-1:0] refresh_counter;
    always_ff @(posedge(clk),posedge(rst)) begin 
        if(rst) 
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    
    bcdconverter_11 bin2bcd(
    .A(ms),
    .output11b(bcd_ms)
    );
    
    num2sseg n2s0(
    .num(num2sseg_in),
    .sseg(num2sseg_out)
    );
    
    always_comb begin
    case(sel) 
        clear: 
            if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b00)begin
                an = 4'b1110;
                sseg = 7'b1001111;
                end
            else if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b01) begin
                an = 4'b1101;
                sseg = 7'b1001000;
                end
            else 
                an = 4'b1111;
                
            
        stop_early:
            begin
            if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b00)begin
                an = 4'b1110;
                sseg = 7'b0000100;
                end
            else if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b01) begin
                an = 4'b1101;
                sseg = 7'b0000100;
                end
            else if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b10) begin
                an = 4'b1011;
                sseg = 7'b0000100;
                end
            else begin
                an = 4'b0111;
                sseg = 7'b0000100;
                end
            end
            
        start:
            begin
            an = 4'b0000;
            sseg = 7'b0000001;
            end
        count: begin
            if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b00)begin
                an = 4'b1110;
                num2sseg_in = bcd_ms[3:0];
                end
            else if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b01) begin
            
                an = 4'b1101;
                num2sseg_in = bcd_ms[7:4];
                end
            else if(refresh_counter[refresh_N-1:refresh_N-2] == 2'b10) begin
                an = 4'b1011;
                num2sseg_in = bcd_ms[11:8];
                end
            else begin
                an = 4'b0111;
                num2sseg_in = bcd_ms[15:12];
            end
             sseg = num2sseg_out;
            end
         endcase
    end
endmodule
