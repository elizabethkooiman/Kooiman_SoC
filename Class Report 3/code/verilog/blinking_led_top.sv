`timescale 1ns / 1ps
//////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 10/10/2023 07:31:03 PM
// Project Name: Class Report 3 
// Description: 
//////////////////////////////////


module blinking_led_top(
    input logic [15:0] reg_in0,
    input logic [15:0] reg_in1,
    input logic [15:0] reg_in2,
    input logic [15:0] reg_in3,
    output logic [3:0]led,
//    output logic led1,
//    output logic led2,
//    output logic led3,
    input logic clk,
    input logic reset
    );
    
    blinking_led_single blink0(
    .clk(clk), 
    .reset(reset),
    .reg_in(reg_in0),
    .led(led[0])
    );
    
    blinking_led_single blink1(
    .clk(clk), 
    .reset(reset),
    .reg_in(reg_in1),
    .led(led[1])
    );
    
    blinking_led_single blink2(
    .clk(clk), 
    .reset(reset),
    .reg_in(reg_in2),
    .led(led[2])
    );
    
    blinking_led_single blink3(
    .clk(clk), 
    .reset(reset),
    .reg_in(reg_in3),
    .led(led[3])
    );
endmodule
