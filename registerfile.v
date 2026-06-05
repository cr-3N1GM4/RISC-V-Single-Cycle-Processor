`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2025 11:10:12
// Design Name: 
// Module Name: registerfile
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


module regfile(
input wire [4:0] A1,
input clk,
input [1:0] type,
input [31:0] immExt,
output [31:0] srcB ,
input wire [4:0] A2,
input wire [4:0] A3,
input wire [31:0] WD3,
input wire WE,
output [31:0] RD1,
output [31:0] RD2 
    );
    reg [31:0] regfile [31:0];
    integer i;
    initial begin 
    for(i=0;i<32;i=i+1) begin 
     regfile[i] = 0;
    end 
    end 

    assign RD1 = regfile[A1];
    assign RD2 = regfile[A2];
    assign srcB = (type==2'b01)? RD2:immExt;
    always @(posedge clk) begin 
    if(WE && A3 != 5'd0) begin 
    regfile[A3] <= WD3;
    $display("WRITE: x%0d = %h", A3, WD3);
    end 
 
    end 
endmodule
