`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/14 14:12:00
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate,
    output [5:0] func,
    output [25:0] label,
    output [31:0] Q1,
    output [31:0] Q2,
    output [31:0] Writedata,
    output [31:0] Dataout,
    output [31:0] currentAddress,
    output [31:0] result
    );
    wire [2:0] ALUop;
    wire [31:0] B,newAddress;
    wire [31:0] currentAddress_4,extendimm,currentAddress_label;
    wire [4:0] Writereg;
    wire zero,Jump,M2reg,Wmem,ALUimm,Wreg,sext,Regrt;
    Control_Unit cu(op,func,zero,Jump,M2reg,Wmem,ALUop,ALUimm,Wreg,Regrt,sext);
    PC pc(currentAddress,clk,reset,1,newAddress);
    instruction_memory inm(currentAddress,op,rs,rt,rd,immediate,func,label);
    Regfile rf(clk,Wreg,Writereg,Writedata,rs,rt,Q1,Q2);
    ALU alu(ALUop,Q1,B,zero,result);
    Data_memory dm(Dataout,Wmem,result,Q2);
    signextend ext(sext,immediate,extendimm);
    choose_5 m1(rt,rd,Regrt,Writereg);
    choose_32 m2(extendimm,Q2,ALUimm,B);
    choose_32 m3(Dataout,result,M2reg,Writedata);
    choose_32 m4(currentAddress_label,currentAddress_4,Jump,newAddress);
    assign currentAddress_4=currentAddress+4;
    assign currentAddress_label[31:28]=currentAddress_4[31:28];
    assign currentAddress_label[27:0]=label << 2;
endmodule
