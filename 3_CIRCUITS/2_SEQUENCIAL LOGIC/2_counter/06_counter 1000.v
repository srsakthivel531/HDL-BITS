module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
reg [3:0]count0,count1,count2;
    assign c_enable[0]=1'b1;
    assign c_enable[1]=(count0==9);
    assign c_enable[2]=(count0==9)&&(count1==9);
    bcdcount counter0 (clk, reset, c_enable[0],count0);
    bcdcount counter1 (clk, reset, c_enable[1],count1);
    bcdcount counter2 (clk, reset, c_enable[2],count2);
    assign OneHertz=(count0==9)&&(count1==9)&&(count2==9);
endmodule
