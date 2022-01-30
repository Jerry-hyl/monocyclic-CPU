`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/08 13:38:57
// Design Name: 
// Module Name: Data_memory
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


module Data_memory(
    output reg [31:0] Dataoutput,
    input WE,
    input [31:0] address,
    input [31:0] Datainput
    );
    reg [31:0] mem[0:64];
    integer i;
    
    initial
    begin
        for(i=0;i<64;i=i+1)
            mem[i] <=0;
    end
    
    always@(*)
    begin
        if (WE)
        begin
            mem[address]<=Datainput;
        end
        else
        begin
            Dataoutput <=mem[address];
        end
    end
endmodule
