module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0]prev;
    always@(posedge clk)begin
        prev<=in;
            if(reset)
                out<=0;
            else
                out<=out|(~(~prev|in));
    end           
endmodule
