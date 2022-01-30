`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 18:16:59
// Design Name: 
// Module Name: t_signextend
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


module t_choose_5();
    reg reset,clk;
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [15:0] immediate;
    wire [5:0] func;
    wire [25:0] label;
    wire [31:0] Q1;
    wire [31:0] Q2;
    wire [31:0] Writedata;
    wire [31:0] Dataout;
    wire [31:0] currentAddress;
    wire [31:0] result;
    top M1(clk,reset,op,rs,rt,rd,immediate,func,label,Q1,Q2,Writedata,Dataout,currentAddress,result);
initial
begin
clk=0;reset=1;
#10 clk=~clk;
#10 reset=0;
repeat(36)
#10 clk=~clk;
$finish;
end
endmodule
