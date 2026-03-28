module top_module (input x, input y, output z);
wire w1,w2,w3,w4,w5,w6;
    assign w1=(x^y)&x;
    assign w2=(~x&~y)|(x&y);
    assign w5=w1|w2;
    assign w3=(x^y)&x;
    assign w4=(~x&~y)|(x&y);
    assign w6=w3&w4;
    assign z=(~w5 & w6)|(w5 & ~w6);
endmodule
