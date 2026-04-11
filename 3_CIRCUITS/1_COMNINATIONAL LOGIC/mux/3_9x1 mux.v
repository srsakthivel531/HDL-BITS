module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always@(*)begin
        case(sel)
            4'b0:out=a;
            4'b1:out=b;
            4'b10:out=c;
            4'b11:out=d;
            4'b100:out=e;
            4'b101:out=f;
            4'b110:out=g;
            4'b111:out=h;
            4'b1000:out=i;
            default:out=16'hffff;
        endcase
    end 
endmodule
