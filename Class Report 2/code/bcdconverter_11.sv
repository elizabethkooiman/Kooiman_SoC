`timescale 1ns / 1ps
//////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 09/07/2023 08:01:03 PM
// Module Name: bcdconverter_11
// Project Name: Class Report 2
// Description: 
///////////////////////////////////////

module bcdconverter_11(
    input logic [10:0] A,
    output logic [15:0] output11b
    );
    wire tens;
    wire ones;
    wire c4msb;
    wire c5msb;
    wire c6msb;
    wire c7msb;
    wire c9msb;
    wire c10msb;
    wire c11msb;
    wire c12msb;
    
    wire [2:0] temp1;
    wire [2:0] temp2;
    wire [2:0] temp3;
    wire [2:0] temp4;
    wire [2:0] temp5;
    wire [2:0] temp6;
    wire [2:0] temp7;
   // wire [2:0] temp8;
    wire [2:0] temp9;
    wire [2:0] temp10;
    wire [2:0] temp11;
    wire [2:0] temp12;
    wire [2:0] temp14;
    
    wire [3:0] ones11;
    wire [3:0] tens11;
    wire [3:0] hundreds11;
    wire [3:0] thousands11;
    
    add3 c1(
    .num({1'b0,A[10:8]}),
    .modnum({c1msb,temp1})
    );
    add3 c2(
    .num({temp1,A[7]}),
    .modnum({c2msb,temp2})
    );
    add3 c3(
    .num({temp2,A[6]}),
    .modnum({c3msb,temp3})
    );
    add3 c4(
    .num({temp3,A[5]}),
    .modnum({c4msb,temp4})
    );
     add3 c5(
    .num({temp4,A[4]}),
    .modnum({c5msb,temp5})
    );
     add3 c6(
    .num({temp5,A[3]}),
    .modnum({c6msb,temp6})
    );
     add3 c7(
    .num({temp6,A[2]}),
    .modnum({c7msb,temp7})
    );
     add3 c8(
    .num({temp7,A[1]}),
    .modnum({tens11[0], ones11[3:1]})
    );
     add3 c9(
    .num({1'b0,c1msb,c2msb,c3msb}),
    .modnum({c9msb,temp9})
    );
     add3 c10(
    .num({temp9,c4msb}),
    .modnum({c10msb,temp10})
    );
     add3 c11(
    .num({temp10,c5msb}),
    .modnum({c11msb,temp11})
    );
     add3 c12(
    .num({temp11,c6msb}),
    .modnum({c12msb,temp12})
    );
     add3 c13(
    .num({temp12,c7msb}),
    .modnum({hundreds11[0],tens11[3:1]})
    );
     add3 c14(
    .num({1'b0,c9msb,c10msb,c11msb}),
    .modnum({thousands11[1],temp14})
    );
     add3 c15(
    .num({temp14,c12msb}),
    .modnum({thousands11[0],hundreds11[3:1]})
    );
    
    assign ones11[0] = A[0];
    assign thousands11[3] = 1'b0;
    assign thousands11[2] = 1'b0;
    
    assign output11b = {thousands11,hundreds11,tens11,ones11};
    
endmodule
