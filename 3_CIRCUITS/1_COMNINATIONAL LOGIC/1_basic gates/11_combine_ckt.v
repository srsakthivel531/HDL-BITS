module top_module (input x, input y, output z);
wire z1,z2,z3,z4;
    module_A a1(x,y,z1);
    module_B b1(x,y,z2);
    module_A a2(x,y,z3);
    module_B b2(x,y,z4);
assign z=(z1|z2)^(z3&z4);
endmodule
module module_A (input x, input y, output z);
    assign z=(x^y)&x;
endmodule
module module_B ( input x, input y, output z );
assign z=~(x^y);
endmodule
