module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    wire [3:0]d0,d1,d2,d3;
    assign ena[1]=(d0==4'b1001);
    assign ena[2]=(d0==4'b1001)&&(d1==4'b1001);
    assign ena[3]=(d0==4'b1001)&&(d1==4'b1001)&&(d2==4'b1001);
    syncounter_module s0(clk,reset,1'b1,d0);
    syncounter_module s1(clk,reset,ena[1],d1);
    syncounter_module s2(clk,reset,ena[2],d2);
    syncounter_module s3(clk,reset,ena[3],d3);
    assign q={d3,d2,d1,d0};
endmodule
module syncounter_module (
    input clk,
    input reset, 
    input enable,
    output [3:0] q);
    always@(posedge clk)begin
        if(reset)
            q<=0;
        else if(enable)begin
            if(q==4'b1001)
                q<=0;
            else 
            q<=q+1;
        end 
    end 
endmodule
