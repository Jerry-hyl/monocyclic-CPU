`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 09:58:57
// Design Name: 
// Module Name: Regfile
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


module Regfile(
    input clk,WE,
    input [4:0] RegWriteAddr,
    input [31:0] RegWritedata,
    input [4:0] RsAddr,RtAddr,
    output [31:0] RsData,RtData
    );
    reg [31:0] REG[0:31];
    integer i;
    assign RsData=REG[RsAddr];
    assign RtData=REG[RtAddr];
always@(posedge clk)
begin
    if (WE && RegWriteAddr!=0) REG[RegWriteAddr] <= RegWritedata;
end
initial
begin
    for(i=0;i<32;i=i+1)
        REG[i] <= 0;
end
endmodule
