module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );

parameter LEFT=3'b00,RIGHT=3'b01,FALL_LEFT=3'b10,FALL_RIGHT=3'b11,DIG_LEFT=3'b100,DIG_RIGHT=3'b101;
    reg [2:0]state,next_state;
    always@(posedge clk,posedge areset)begin
        if(areset)
            state<=LEFT;
        else 
            state<=next_state;
    end 
    always@(*)begin
        case(state)
        LEFT:begin
            if((ground==0 )&& (bump_left==0||bump_left==1))
            next_state=FALL_LEFT;
            else if(dig==1 && ground==1)
            next_state=DIG_LEFT;
            else if(bump_left==1 && ground==1)
            next_state=RIGHT;
            else 
             next_state=LEFT;
        end 
        RIGHT:begin
            if((ground==0) && (bump_right==0||bump_right==1))
            next_state=FALL_RIGHT;
            else if(dig==1 && ground==1)
            next_state=DIG_RIGHT;
            else if(bump_right==1 && ground==1)
            next_state=LEFT;
            else 
            next_state=RIGHT;
        end  
        FALL_LEFT:begin
            if(ground==1)
                next_state=LEFT;
            else 
                next_state=FALL_LEFT;
        end 
        FALL_RIGHT:begin
            if(ground==1)
                next_state=RIGHT;
            else 
                next_state=FALL_RIGHT;
        end 
        DIG_LEFT:begin
            if(ground==0)
                next_state=FALL_LEFT;
            else 
                next_state=DIG_LEFT;
        end
         DIG_RIGHT:begin
            if(ground==0)
                next_state=FALL_RIGHT;
            else 
                next_state=DIG_RIGHT;
        end
        endcase
      end
      assign walk_left=(state==LEFT);
      assign walk_right=(state==RIGHT);
    assign aaah=(state==FALL_LEFT)||(state==FALL_RIGHT);
    assign digging=(state==DIG_LEFT)||(state==DIG_RIGHT);
endmodule

