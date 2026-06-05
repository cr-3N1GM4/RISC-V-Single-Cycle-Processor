`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 22:08:47
// Design Name: 
// Module Name: datamem
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


module datamem(
input [31:0] ALUresult,
input [31:0] WD,
input clk,
input rescontrol,
output [31:0] Readdata,
input wrendm
    );
    reg [31:0] datamem [0:2047];
    initial begin 
    $readmemh("DataMemory.mem",datamem);
    end 
     assign Readdata = (wrendm==0)?(rescontrol)? datamem[ALUresult>>2]: ALUresult : 32'b0;
     always @(posedge clk) begin 
     if(wrendm) begin
     datamem[ALUresult>>2] <= WD;
     end 
     end 
endmodule
