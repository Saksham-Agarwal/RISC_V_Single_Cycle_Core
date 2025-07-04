
module  alu (
    A,B, ALUControl, Result
);

    input [31:0] A, B;
    input [2:0] ALUControl;

    output [31:0] Result;
    
    //declaring interim wires
    wire [31:0] a_and_b;
    wire[31:0] a_or_b;
    wire [31:0] not_b;

    wire [31:0] mux_1;

    wire [31:0] mux_2;

    wire cout;

    //flags
    wire Zero;
    wire  N;
    wire C;
    wire V;
    
    wire [31:0] slt;


    // assigning values
    assign a_and_b = A & B;
    assign a_or_b = A | B;
    assign not_b = ~B;


    // ternary
    assign mux_1 = (ALUControl[0] == 1'b0) ? B: not_b ;

    assign {cout, sum} = A + mux_1 + ALUControl[0];

    // designing 4by1

    assign mux_2 = (ALUControl[2:0] == 2'b000) ? sum : 
                   (ALUControl[2:0] == 2'b001) ? sum :
                   (ALUControl[2:0] == 2'b010) ? a_and_b : 
                   (ALUControl[2:0] == 2'b011) ? a_or_b:
                   (ALUControl[2:0] == 2'b101) ? slt:
                   32'h00000000;

    assign Result = mux_2;

    //flags
    assign Zero = &(~Result);
    assign N = Result[31];
    assign C = cout & (~ALUControl[1]);
    assign V = (~ALUControl[1]) & (A[31] ^ sum[31]) & (~(A[31] ^B[31] ^ ALUControl[0]));

    assign slt = {{31{1'b0}}, sum[31]}




    
endmodule