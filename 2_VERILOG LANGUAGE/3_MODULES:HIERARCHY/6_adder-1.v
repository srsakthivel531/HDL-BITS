module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire w1,w2,w3;
    add16 a1(.a(a[15:0]),.b(b[15:0]),.cin(w1),.sum(sum[15:0]),.cout(w2));
    add16 a2(.a(a[31:16]),.b(b[31:16]),.cin(w2),.sum(sum[31:16]),.cout(w3));
endmodule
