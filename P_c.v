module P_C (PC_NEXT, PC, rst, clk);

    input [31:0] PC_NEXT;
    output [31:0] PC;
    input clk, rst;


    always @(posedge clk)begin
       if (rst == 1'b0)
        begin
            PC <= 31'h00000000;
        end
        ELSE
        begin
            PC <= PC_NEXT;
        end


    end
endmodule