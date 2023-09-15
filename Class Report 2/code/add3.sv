`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// 
// Create Date: 09/07/2023 08:02:58 PM
// Module Name: add3
// Project Name: Class Report 2
// Description: 
// 
////////////////////////////////////


module add3(
    input logic [3:0] num,
    output logic[3:0] modnum
    );
    
    always_comb
        if(num>=5)
            modnum = num+3;
        else
            modnum = num;
endmodule
