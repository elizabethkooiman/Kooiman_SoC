`timescale 1ns / 1ps
///////////////////////////////////////////////
// Engineer: Elizabeth Kooiman
// Create Date: 08/31/2023 11:40:16 AM
// Module Name: sseg_decoder
// Project Name: Class Report 1
//////////////////////////////////////////////


module sseg_decoder(
    input logic [2:0] in,
    output logic [6:0] sseg, 
    output logic [3:0] an
    );
    
    //0123
    //4567
always_comb begin
    case(in)
    3'b000:
        begin
        an = 4'b0111;
        sseg = 7'b0011100;
        end
    3'b001:
        begin
        an = 4'b1011;
        sseg = 7'b0011100;
        end
    3'b010:
        begin
        an = 4'b1101;
        sseg = 7'b0011100;
        end
    3'b011:
        begin
        an = 4'b1110;
        sseg = 7'b0011100;
        end
    3'b111:
        begin
        an = 4'b0111;
        sseg = 7'b0100011;
        end
    3'b110:
        begin
        an = 4'b1011;
        sseg = 7'b0100011;
        end
    3'b101:
        begin
        an = 4'b1101;
        sseg = 7'b0100011;
        end
    3'b100:
        begin
        an = 4'b1110;
        sseg = 7'b0100011;
        end
    default:
        begin
        an = 4'b0111;
        sseg = 7'b1111111;
        end
    
    endcase
end



    
endmodule
