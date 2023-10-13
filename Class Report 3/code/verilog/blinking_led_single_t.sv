`timescale 1ns / 1ps
////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 10/10/2023 07:06:06 PM
// Module Name: blinking_led_single_t
// Project Name: Class Report 3
// Description: 
//////////////////////////////////////


module blinking_led_single_t();

     logic clk, reset;
     logic [15:0] reg_in;
     logic led;
    
 blinking_led_single uut(
    .clk(clk), 
    .reset(reset),
    .reg_in(reg_in),
    .led(led)
    );
    
    
    
    initial begin
    clk=0;
    forever #5 clk = ~clk;
    end
    initial begin
    reset = 0;
    #5;
    reset = 1;
    #5;
    reset = 0;
    #5;
    reg_in = 1;
    #1000000;
    end
endmodule
