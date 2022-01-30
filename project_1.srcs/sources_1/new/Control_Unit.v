`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 14:50:46
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [5:0] op,
    input [5:0] funct,
    input zero,
    output reg Jump,
    output reg M2Reg,
    //output reg Branch,
    output reg Wmem,
    output reg [2:0] ALUop,
    output reg ALUimm,
    output reg Wreg,
    output reg Regrt,
    output reg sext
    );
    always@(op or funct or zero)
    begin
    case(op)
    6'b000000://R-type
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=0;
        Wreg=1;
        Regrt=0;
        sext=0;
        case(funct)
        6'b100000:ALUop=3'b000;
        6'b100010:ALUop=3'b001;
        6'b100100:ALUop=3'b010;
        6'b100101:ALUop=3'b011;
        6'b101010:ALUop=3'b100;
        6'b000000:
        begin
            ALUop=3'bxxx;
            Wreg=0;
        end
        endcase
    end
    6'b001000://addi
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=1;
        Wreg=1;
        Regrt=1;
        sext=1;
        ALUop=3'b000;
    end
    6'b001100://andi
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=1;
        Wreg=1;
        Regrt=1;
        sext=0;
        ALUop=3'b010;
    end
    6'b001101://ori
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=1;
        Wreg=1;
        Regrt=1;
        sext=0;
        ALUop=3'b011;
    end
    6'b001010://slti
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=1;
        Wreg=1;
        Regrt=1;
        sext=1;
        ALUop=3'b100;
    end
    6'b101011://sw
    begin
        Jump=0;
        M2Reg=0;
        //Branch=0;
        Wmem=1;
        ALUimm=1;
        Wreg=0;
        Regrt=1;
        sext=1;
        ALUop=3'b000;
    end
    6'b100011://lw
    begin
        Jump=0;
        M2Reg=1;
        //Branch=0;
        Wmem=0;
        ALUimm=1;
        Wreg=1;
        Regrt=1;
        sext=1;
        ALUop=3'b000;
    end
    6'b000010://j
    begin
        Jump=1;
        M2Reg=0;
        //Branch=0;
        Wmem=0;
        ALUimm=0;
        Wreg=0;
        Regrt=0;
        sext=0;
        ALUop=3'bxxx;
    end
    endcase
    end
endmodule
