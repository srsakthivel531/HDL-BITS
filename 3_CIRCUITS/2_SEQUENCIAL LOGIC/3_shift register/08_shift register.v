module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg [3:0] LEDR
); 
    
    MUXDFF m0(KEY[0],KEY[3],SW[3],KEY[1],KEY[2],LEDR[3]);
    MUXDFF m1(KEY[0],LEDR[3],SW[2],KEY[1],KEY[2],LEDR[2]);
    MUXDFF m2(KEY[0],LEDR[2],SW[1],KEY[1],KEY[2],LEDR[1]);
    MUXDFF m3(KEY[0],LEDR[1],SW[0],KEY[1],KEY[2],LEDR[0]);
endmodule
module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
);
reg mux_1,mux_2; 
    always@(*)begin
     case(E)
         0:mux_1=Q;
         1:mux_1=w;
         default:mux_1=0;
     endcase
     case(L)
         0:mux_2=mux_1;
         1:mux_2=R;
         default:mux_1=0;
     endcase
 end
    always@(posedge clk)begin
        Q<=mux_2;
    end 
endmodule
