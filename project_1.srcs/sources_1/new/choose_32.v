`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 14:04:09
// Design Name: 
// Module Name: choose_32
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


module choose_32(
    input [31:0] in_1,
    input [31:0] in_2,
    input control,
    output [31:0] out
    );
    assign out= control ? in_1: in_2;
endmodule
