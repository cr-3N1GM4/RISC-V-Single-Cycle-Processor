`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 12:12:54
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
input reset,
input clk ,
input PCsrc,
input [31:0] PCtarget,
output reg [31:0] PC
    );
    always @(posedge clk) begin 
    if(reset) begin 
    PC<=0;
    end 
    else begin
    if(PCsrc==1'b0) begin 
    PC <=PC+4;
    end
    else begin
    PC <= PCtarget;
    end   
    end
    end  
    
endmodule
