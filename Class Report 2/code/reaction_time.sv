`timescale 1ns / 1ps
/////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/06/2023 08:37:52 PM
// Design Name: 
// Module Name: reaction_time
// Project Name: Class Report 2
// Description: 
/////////////////////////////////////


module reaction_time(
    input logic btnClr,
    input logic btnStart,
    input logic btnStop,
    input logic clk,
    input logic rst,
    output logic [6:0] sseg,
    output logic [3:0] an,
    output logic led
    );
    
    //define local parameters for state machine
    localparam [2:0] clear = 3'b000;
    localparam [2:0] start = 3'b001;
    localparam [2:0] running = 3'b010;
    localparam [2:0] stop = 3'b011;
    localparam[2:0] stop_early = 3'b100;
    
    //Parameters for determining count
    localparam N_15s = 32;
    
    //define logic variables
    logic [N_15s-1:0] curr_count_15s;
    logic [10:0] curr_count_ms;
    logic [2:0] curr_state, next_state;
    logic [1:0] sel_sseg;
    logic [12:0] rand_initial;
    logic [12:0] rand_s;
    logic [N_15s-1:0] count_time_max; 
    
    logic en_ms_count;
    logic en_15s_count;
    logic rst_ms;
    logic rst_15s;

    counter_ms countms(
        .clk(clk),
        .rst(rst_ms),
        .en(en_ms_count),
        .ms_count(curr_count_ms)
        );
        
    counter#(.N(N_15s)) count15s(
        .clk(clk),
        .rst(rst_15s),
        .en(en_15s_count),
        .count(curr_count_15s)
        );
    
    lfsr_randnum#(.N(13)) rand_num(
        .clk(clk),
        .rst(btnClr),
        .rnd(rand_initial)
        );  
    
    assign rand_s = (rand_initial % 13) + 2;
    
    always_ff @(posedge(clk),posedge(btnClr)) begin
        if(btnClr)begin 
            curr_state <= clear;
            rst_ms  <= 1'b1;
            rst_15s <= 1'b1;
        end
        else begin 
            curr_state <= next_state;
            rst_ms  <= 1'b0;
            rst_15s <= 1'b0;
        end
    
    end
    
    sseg_decoder decode0(
        .sel(sel_sseg),
        .ms(curr_count_ms), 
        .rst(btnClr),
        .clk(clk),
        .sseg(sseg),
        .an(an)
        );
    
    always_comb begin
        next_state = curr_state;
        case(curr_state)
            clear: begin
                sel_sseg = 2'b00;
                en_ms_count = 1'b0;
                en_15s_count = 1'b0;
                led = 1'b0;
                if(btnStart) begin
                    next_state = start;
                    count_time_max = 27'd100000000 * rand_s;
                end
                else
                    next_state = clear;
                end
                
            start: begin
                sel_sseg = 2'b10;
                led = 1'b0;
                en_15s_count = 1'b1;
                if(btnStop) begin 
                    next_state = stop_early;
                    end
                else if(curr_count_15s == count_time_max) begin 
                    led = 1'b1;
                    en_15s_count = 1'b0;
                    next_state = running;
                end
                else begin
                    next_state = start;
                end
                end
                
            running: begin 
                en_ms_count = 1'b1;
                sel_sseg = 2'b11;
                led = 1'b1;
                if(curr_count_ms == 32'd1000) begin
                    next_state = stop;
                    en_ms_count = 1'b0;
                    end
                else if (btnStop) begin
                    next_state = stop;
                end
                else
                    next_state = running;
                end
                
            stop: begin 
                sel_sseg = 2'b11;
                led = 1'b0;
                en_ms_count = 1'b0;
                if(btnClr) begin 
                    next_state = clear;
                end
                else begin
                    next_state = stop;
                end
                end
            stop_early:
                begin
                    sel_sseg = 2'b01;
                    led = 1'b0;
                    en_ms_count = 1'b0;
                    en_15s_count = 1'b0;
                if(btnClr) begin
                    next_state = clear;
                    end
                else begin
                    next_state = stop_early;
                    end
                end 
        endcase
        end
endmodule
