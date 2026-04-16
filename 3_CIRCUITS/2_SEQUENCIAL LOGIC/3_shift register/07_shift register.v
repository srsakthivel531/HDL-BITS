module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
 reg [3:0]d;
    always@(posedge clk)begin
        if(!resetn)
           d<=0;
        else 
            d<={in,d[3:1]};
    end 
 assign out=d[0];

endmodule
