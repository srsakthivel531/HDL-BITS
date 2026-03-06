module top_module ( input clk, input d, output q );
    wire q1,q2;
    my_dff uut1(clk,d,q1);
    my_dff uut2(clk,q1,q2);
    my_dff uut3(clk,q2,q);
endmodule
