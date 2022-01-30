`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 14:00:10
// Design Name: 
// Module Name: choose_5
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


module choose_5(
    input [4:0] in_1,
    input [4:0] in_2,
    input control,
    output [4:0] out
    );
    assign out= control ? in_1 : in_2;
endmodule
