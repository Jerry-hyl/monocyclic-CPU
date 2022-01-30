`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 18:12:19
// Design Name: 
// Module Name: signextend
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


module signextend(
    input sext,
    input [15:0] a,
    output [31:0] b
    );
    assign b[15:0]=a;
    assign b[31:16]=sext ? (a[15] ? 16'hffff : 16'h0000) : 16'h0000;
endmodule
