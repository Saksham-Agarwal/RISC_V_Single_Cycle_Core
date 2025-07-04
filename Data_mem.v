module Data_memory (A, WD3, clk, WE, RD);

input [31:0] A, WD;
input clk, WE;

output [31:0] RD;


//assign memory
reg [31:0] Data_MEM [1023:0];

assign RD = (WE == 1'b0) ? Data_MEM[A]: 32'h00000000;

//write 
always @(posedge clk) begin
    if (WE)
    begin
        Data_MEM[A] <= WD;
    end

end

endmodule