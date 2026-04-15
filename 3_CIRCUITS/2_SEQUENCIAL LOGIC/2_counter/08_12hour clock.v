module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
//SECONDS
 wire [3:0]ss_10,ss_6;
 wire ss_en;
 assign ss_en=ena && (ss_10==9);
 mod_10counter m0(clk,reset,ena,ss_10);   
 mod_6counter  m1(clk,reset,ss_en,ss_6); 
 assign ss={ss_6,ss_10};
//MINUTES    
 wire [3:0]mm_10,mm_6;
 wire mm_ena10,mm_ena6;
 assign mm_ena10=ena && (ss_10==9)&&(ss_6==5);
 assign mm_ena6=mm_ena10 && (mm_10==9);
 mod_10counter m2(clk,reset,mm_ena10,mm_10);   
 mod_6counter  m3(clk,reset,mm_ena6,mm_6); 
 assign mm={mm_6,mm_10};
 //HOURS
wire hh_en;
reg [3:0]hh_10_reg,hh_1_reg;
assign hh_en=ena && (ss_10==9)&&(ss_6==5) && (mm_10==9)&&(mm_6==5);
    always@(posedge clk)
        begin
            if(reset)begin
                hh_10_reg<=1;
                hh_1_reg<=2;
            end 
      else if(hh_en)begin
        if(hh_10_reg==1 && hh_1_reg==2) begin
            hh_10_reg<=0;
            hh_1_reg<=1;
        end
        else if(hh_1_reg==9) begin
            hh_1_reg<=0;
            if(hh_10_reg==0)
                hh_10_reg<=1;
           end
        else begin
            hh_1_reg<= hh_1_reg+1;
            end 
        end 
    end 
    assign hh={hh_10_reg,hh_1_reg};
                
 reg pm_reg;
  always@(posedge clk) begin
        if(reset)
            pm_reg<=0;
      else if (ena && hh==8'h11 && mm==8'h59 && ss==8'h59)
            pm_reg<=~pm_reg;
    end
assign pm=pm_reg;
endmodule
module mod_6counter(input clk,reset,enable,output reg [3:0]count1);
    always@(posedge clk)begin
        if(reset)
            count1<=0;
        else if(enable)begin
            if(count1==5)
                count1<=0;
            else 
                count1<=count1+1;
        end 
    end 
endmodule
module mod_10counter(input clk,reset,enable,output reg [3:0]count1);
    always@(posedge clk)begin
        if(reset)
            count1<=0;
        else if(enable)begin
            if(count1==9)
                count1<=0;
            else 
                count1<=count1+1;
        end 
    end 
endmodule
