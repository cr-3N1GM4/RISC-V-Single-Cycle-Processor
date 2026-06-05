`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2025 19:27:39
// Design Name: 
// Module Name: riscvsinglecycle
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


module riscsinglecycle(
    input clk,
    input reset
);
    
    wire [31:0] PC_out, PC_target, instr, immExt, RD1, RD2, srcB, ALUresult, Readdata;
    wire [3:0] ALUControl;
    wire [1:0] type;
    wire PCsrc, zero, WE, wrendm, rescontrol;
    wire [4:0] A1, A2, A3;

    
    PC pc_unit (
        .reset(reset),
        .clk(clk),
        .PCsrc(PCsrc),
        .PCtarget(PC_target),
        .PC(PC_out)
    );

   
    Instructionmemreg imem (
        .A(PC_out),
        .RD(instr)
    );

    
    controlunit cu (
        .instr(instr),
        .zero(zero),
        .PCsrc(PCsrc),
        .ALUControl(ALUControl),
        .WE(WE),
        .type(type),
        .wrendm(wrendm),
        .rescontrol(rescontrol)
    );

    
    extDm extension (
        .inst(instr),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .type(type),
        .immExt(immExt)
    );

    
    regfile rf (
        .clk(clk),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(Readdata), 
        .WE(WE),
        .type(type),
        .immExt(immExt),
        .srcB(srcB),
        .RD1(RD1),
        .RD2(RD2)
    );

    
    pcbeq branch_adder (
        .immExt(immExt),
        .PC(PC_out),
        .PCtarget(PC_target)
    );

    
    ALU alu_unit (
        .ALUcontrol(ALUControl),
        .srcA(RD1),
        .srcB(srcB),
        .zero(zero),
        .ALUresult(ALUresult)
    );

    
    datamem dmem (
        .ALUresult(ALUresult),
        .WD(RD2),
        .clk(clk),
        .rescontrol(rescontrol),
        .Readdata(Readdata),
        .wrendm(wrendm)
    );

endmodule