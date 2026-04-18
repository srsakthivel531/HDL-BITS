//WITH BUG IN THE CODE 
module top_module (input a, input b, input c, output out);//

    andgate inst1 ( a, b, c, out );

endmodule
//AFTER CLEAR THE BUG IN THE CODE
module top_module (
    input a,
    input b,
    input c,
    output out
);
wire outp;
    andgate inst1 (.out(outp),.a(a),.b(b),.c(c),.d(1'b1),.e(1'b1));
assign out = ~outp; 
endmodule
