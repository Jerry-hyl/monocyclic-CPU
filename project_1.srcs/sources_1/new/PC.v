`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/07 09:53:01
// Design Name: 
// Module Name: PC
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


module PC(
    output reg [31:0] currentaddress,
    input clk,
    input Reset,
    input enable,
    input [31:0] newaddress
    );
always@(posedge clk or posedge Reset)
begin
    if (Reset)  currentaddress <= 0;
    else
    begin
        if (enable) currentaddress <= newaddress;
        else currentaddress <= currentaddress;
    end
end
initial
    currentaddress <= 0;
endmodule
