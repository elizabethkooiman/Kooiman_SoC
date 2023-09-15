`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bcdconverter_11_test
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


module bcdconverter_11_t();

    logic [10:0] A;
    logic [15:0] output11b;
    integer i;
    
    
bcdconverter_11 uut(
    .A(A),
    .output11b(output11b)
    
    );
    
 initial begin 
 
    for (i=11'd0;i<=11'd2047;i=i+1) begin
        A[10:0] = i; #10;
    end
    
    
    
    
    
    $finish;
 end

endmodule