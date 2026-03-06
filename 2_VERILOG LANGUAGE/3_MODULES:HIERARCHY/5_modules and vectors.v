module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output  [7:0] q 
);
    wire [7:0]q1,q2,q3;
    reg [7:0]qout;
    my_dff8 a1(clk,d,q1);
    my_dff8 a2(clk,q1,q2);
    my_dff8 a3(clk,q2,q3);
    always @(*)
        begin 
            case(sel)
                2'b00:qout=d;
                2'b01:qout=q1;
                2'b10:qout=q2;
                2'b11:qout=q3;
                default:qout=0;
            endcase
        end 
    assign q=qout;
endmodule
