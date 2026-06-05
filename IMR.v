`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 10:49:12
// Design Name: 
// Module Name: Instructionmemreg
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


module Instructionmemreg(
input [31:0] A,
output reg [31:0] RD
    );
    reg [31:0] instruction [0:255];
    initial begin
    $readmemh("program.mem",instruction);
    end
    always @(*) begin 
    RD = instruction[A>>2];
    end 
endmodule
