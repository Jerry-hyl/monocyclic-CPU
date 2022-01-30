`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/30 13:49:43
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [2:0] op,
    input [31:0] A,B,
    output reg zero,
    output reg [31:0] Result
    );
    always@(*)
    begin
        case(op)
        0:Result=A+B;//add
        1:Result=A-B;//sub
        2:Result=A&B;//and
        3:Result=A|B;//or
        4:if (A<B) Result=1;else Result=0;//slt
        default:Result=0;
        endcase
        if (Result) zero=0;
        else zero=1;
    end
endmodule
