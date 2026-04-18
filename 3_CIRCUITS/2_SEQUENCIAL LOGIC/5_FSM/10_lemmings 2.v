module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
parameter LEFT=2'b00,RIGHT=2'b01,FALL_LEFT=2'b10,FALL_RIGHT=2'b11;
    reg [1:0]state,next_state;
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
            else if(bump_left==1 && ground==1)
            next_state=RIGHT;
            else 
                next_state=LEFT;
        end 
        RIGHT:begin
            if((ground==0) && (bump_right==0||bump_right==1))
            next_state=FALL_RIGHT;
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
        endcase
      end
            assign walk_left=(state==LEFT);
            assign walk_right=(state==RIGHT);
    assign aaah=(state==FALL_LEFT)||(state==FALL_RIGHT);
endmodule
