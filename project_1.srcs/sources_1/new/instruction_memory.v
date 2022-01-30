`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 10:09:07
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    //input WE,
    input [31:0] address,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate,
    output [5:0] func,
    output [25:0] label
    );
    integer i;
    reg [7:0] mem[0:63];
    assign op=mem[address][7:2];
    assign rs[4:3]=mem[address][1:0];
    assign rs[2:0]=mem[address+1][7:5];
    assign rt=mem[address+1][4:0];
    assign rd=mem[address+2][7:3];
    assign immediate[15:8]=mem[address+2];
    assign immediate[7:0]=mem[address+3];
    assign func=mem[address+3][5:0];
    assign label[25:24]=mem[address][1:0];
    assign label[23:16]=mem[address+1];
    assign label[15:8]=mem[address+2];
    assign label[7:0]=mem[address+3];
initial
begin
    $readmemb("D:/digital design/project_1/test.txt",mem);
    for (i=0;i<64;i=i+1)
    $display("memory[%d] = %h",i, mem[i]);
end
endmodule
