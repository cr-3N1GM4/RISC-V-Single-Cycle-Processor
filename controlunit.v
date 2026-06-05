`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2025 20:21:22
// Design Name: 
// Module Name: controlunit
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


module controlunit(
input [31:0] instr,
input zero,
output PCsrc,
output reg [3:0] ALUControl,
output WE,
output reg [1:0] type,
output wrendm,
output rescontrol
    );
    parameter I =2'b00;
    parameter R=2'b01;
    parameter S= 2'b10;
    parameter B= 2'b11;
    wire [6:0] opcode= instr[6:0];
    wire [6:0] funcn7=  instr[31:25] ;
    wire [2:0] funcn3= instr[14:12];
    
    assign WE = (opcode == 7'b0010011) || (opcode == 7'b0000011)||(opcode==7'b0110011);
    assign PCsrc= zero && (type==B);
    always @(*) begin 
    case(opcode) 
    7'b0110011: type =R;
    7'b0010011: type =I;
    7'b0000011: type= I;
    7'b0100011: type= S;
    7'b1100011: type= B;
    default: type =R;
    endcase 
    end
    
    assign wrendm= (opcode==7'b0100011); // write enable for data memory 
    always @(*) begin 
    ALUControl = 4'b0000;
    if((opcode==7'b1100011 ) && (funcn3==3'b000)) begin 
    ALUControl = 4'b0001;
    end 
    if((opcode==7'b0000011 ) && (funcn3==3'b010)) begin 
    ALUControl = 4'b0000;
    end 
    else if((opcode==7'b0100011 ) && (funcn3==3'b010)) begin 
    ALUControl = 4'b0000;
    end 
    else if(opcode==7'b0010011) begin 
    case(funcn3) 
        3'b000: ALUControl = 4'b0000; 
        3'b111: ALUControl = 4'b0010; 
        3'b110: ALUControl = 4'b0011; 
        3'b010: ALUControl = 4'b0101; 
        3'b011: ALUControl = 4'b0110; 
        3'b100: ALUControl = 4'b0111; 
        default: ALUControl = 4'b0000;
      endcase
    end   
    
    else if (opcode == 7'b0110011) begin   
        case (funcn3)
            3'b000: ALUControl = (funcn7 == 7'b0100000) ? 4'b0001 : 4'b0000; 
            3'b001: ALUControl = 4'b1010; 
            3'b010: ALUControl = 4'b0101; 
            3'b011: ALUControl = 4'b0110; 
            3'b100: ALUControl = 4'b0111; 
            3'b101: ALUControl = (funcn7 == 7'b0100000) ? 4'b1001 : 4'b1000; 
            3'b110: ALUControl = 4'b0011; 
            3'b111: ALUControl = 4'b0010; 
            default: ALUControl = 4'b0000;
        endcase
    end
end

   assign rescontrol = ((opcode==7'b0000011 ) && (funcn3==3'b010)) ;
  
   
endmodule
