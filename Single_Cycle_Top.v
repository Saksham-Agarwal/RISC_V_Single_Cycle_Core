`include "P_c.v"
`include "Instruction_Memory.v"
`include "Register_files.v"
`include "Sign_extend.v"

module Single_Cycle_Top (clk, rst);

    input clk, rst;


    wire [31:0] PC_Top, RD_Instr;

    P_c PC(
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_NEXT()
    );

    Instr_Mem Instr_Memory(
        .rst(rst),
        A(PC_Top),
        RD(RD_Instr)

    );

    Reg_file Register_file (
        .A1(RD_Instr[19:15]),
        .A2(),
        .A3(), 
        .WD3(), 
        .WE3(), 
        .clk(clk), 
        .rst(rst), 
        .RD1(), 
        .RD2()
    )
endmodule