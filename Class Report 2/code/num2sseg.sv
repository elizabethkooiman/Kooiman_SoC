`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/08/2023 10:07:38 AM
// Module Name: num2sseg
// Project Name: Class Report 2
// Description: 
///////////////////////////////////////


module num2sseg(
    input logic [3:0] num,
    output logic [6:0] sseg
    );
    
    always_comb
    case(num)
        4'b0000: sseg = 7'b0000001;
        4'b0001: sseg = 7'b1001111;
        4'b0010: sseg = 7'b0010010;
        4'b0011: sseg = 7'b0000110;
        4'b0100: sseg = 7'b1001100;
        4'b0101:  sseg = 7'b0100100;
        4'b0110: sseg = 7'b0100000;
        4'b0111: sseg = 7'b0001111;
        4'b1000: sseg = 7'b0000000;
        4'b1001: sseg = 7'b0000100;
        default: sseg = 7'b0000001;
    
    endcase
endmodule
