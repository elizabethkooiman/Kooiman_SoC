`timescale 1ns / 1ps
///////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/09/2023 12:37:23 PM
// Module Name: wrapper_reaction_timer
// Project Name: Class Report 2
// Description: 
///////////////////////////////////////


module wrapper_reaction_timer(
        input CLK100MHZ,
        input BTNC,//rst
        input BTNL, //btnClr
        input BTNU, //btnStart
        input BTNR, //btnStop
        output [15:0] LED,
        output [7:0] AN,
        output CA,
        output CB,
        output CC,
        output CD,
        output CE,
        output CF,
        output CG 
        //output DP
    );
    
    
    assign LED[15:1] = 0;
    assign AN[7:4] = 4'b1111;
    
    reaction_time(
    .btnClr(BTNL),
    .btnStart(BTNU),
    .btnStop(BTNR),
    .clk(CLK100MHZ),
    .rst(BTNC),
    .sseg({CA,CB,CC,CD,CE,CF,CG}),
    .an(AN[3:0]),
    .led(LED[0])
    );
endmodule
