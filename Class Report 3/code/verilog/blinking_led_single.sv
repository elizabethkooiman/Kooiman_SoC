`timescale 1ns / 1ps
//////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 10/10/2023 05:44:57 PM
// Project Name: Class Report 3
// Description: 
//////////////////////////////////

module blinking_led_single(
    input logic clk, reset,
    input logic [15:0] reg_in,
    output logic led
    );
    
    logic [15:0] curr_ms_count;
    logic ms_tick, next_led, prev_ms_tick;
//    logic [10:0] clock_cycle_led, next_cc_led;
//    localparam CLOCK_CYCLES_ON = 50;
    
    
    counter_ms countms0(
    .clk(clk),
    .rst(reset),
    .en(1'b1),
    .ms_count(),//curr_ms_count
    .ms_tick(ms_tick)
    );
    
    
//    initial begin
//        next_led = 0;
//    end
    always_ff @(posedge(clk), posedge(reset))begin
        if(reset)begin
            led <= 0;
            curr_ms_count <= 0;
            prev_ms_tick <=0;
            next_led <=0;
//            clock_cycle_led <= 11'b0;
            end
        else
            led <= next_led;
//            clock_cycle_led <= next_cc_led; 
            prev_ms_tick <= ms_tick;
            
    end
    always_comb begin
//        next_cc_led = clock_cycle_led;
        if(prev_ms_tick == 0 && ms_tick == 1)begin
            curr_ms_count = curr_ms_count +1;
            
            if(curr_ms_count >=reg_in) begin
                next_led = 1;
                curr_ms_count = 0;
//                next_cc_led = 0;
                end
            else if (curr_ms_count < reg_in)
                next_led = 0;
                end
//         else if(clock_cycle_led < CLOCK_CYCLES_ON)begin
//            next_led = 1;
//            next_cc_led = clock_cycle_led +1;
//            end
         else
            next_led = 0;
    
    end
    
    
    
    
endmodule
