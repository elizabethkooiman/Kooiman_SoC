`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 06:41:58 PM
// Design Name: 
// Module Name: blinking_led
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


module blinking_led(
    input logic clk, 
    input logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    //export 
    output logic [3:0] led_out
    );
    
    //signal declaration 
    logic [15:0] ledreg0, ledreg1, ledreg2, ledreg3;
//    logic led0, led1, led2, led3;
    logic [15:0] ledbuf0, ledbuf1, ledbuf2, ledbuf3;
    logic wr_en;
    
    //blinking led addr
    blinking_led_top leddriver(
    .reg_in0(ledreg0),
    .reg_in1(ledreg1),
    .reg_in2(ledreg2),
    .reg_in3(ledreg3),
    .led(led_out),
//    .led1(led1),
//    .led2(led2),
//    .led3(led3),
    .clk(clk),
    .reset(reset)
    );
    
    always_ff@(posedge(clk), posedge(reset)) begin
    if (reset) begin
        ledbuf0 <= 0;
        ledbuf1 <= 0;
        ledbuf2 <= 0;
        ledbuf3 <= 0;
    end
    else begin
        if(wr_en && addr==0)
            ledbuf0 <= wr_data[15:0];
        if(wr_en && addr==1)
            ledbuf1 <= wr_data[15:0];
        if(wr_en && addr==2)
            ledbuf2 <= wr_data[15:0];
        if(wr_en && addr==3)
            ledbuf3 <= wr_data[15:0];
    end
    end
    
    assign wr_en = cs && write;
    assign rd_data = 0;
    
    
//    assign led_out = {led3, led2, led1, led0};
    assign ledreg0 = ledbuf0;
    assign ledreg1 = ledbuf1;
    assign ledreg2 = ledbuf2;
    assign ledreg3 = ledbuf3;
    
    
    
endmodule
