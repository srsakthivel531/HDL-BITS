module top_module (
    input clk,
    input d,
    output  q
);
reg q1,q2;
    always@(posedge clk)begin
        q1<=d;
    end 
    always@(negedge clk)begin
        q2<=d;
    end 
    always@(*)begin
        case(clk)
            0:q=q2;
            1:q=q1;
        endcase
    end 
endmodule
