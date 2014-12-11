


module  eight ( input Reset, frame_clk, 
					input logic [15:0] keycode,
					input logic [9:0] up, down,
               output [9:0]  eightx, eighty,eights,xmotion,ymotion);
    
    
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size,Ball,Ball_btm_Y_pos,Ball_btm_X_pos;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=2;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=637;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=2;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=477;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=3;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=3;      // Step size on the Y axis
	 parameter [9:0] gravity=0;
    parameter [9:0] Ball_Top_LeftX = 300;
	 parameter [9:0] Ball_Top_LeftY = 368;
	 parameter [9:0] Ball_Btm_RightX= 356;
	 parameter [9:0] Ball_Btm_RightY= 255;
  assign Ball_Size = 1;    // assigns the value 4 as a 10-digit binary number, ie "0000000100"
    logic [4:0] cnt;
	 
	 parameter [2:0] max = 5;
	 /*always_ff @ (posedge frame_clk)
			begin
			
			if(keycode ==  16'b0000000000000001)
			begin
					up <= 1'b1;
			      cnt <= cnt + 1'b1;
			end
			else if(0 < cnt )
					cnt <= cnt +1'b1;
			else if(cnt == max)
					begin
					up <= 1'b0;
			      cnt <= 0;
					end
			else 
			      cnt <= 0;
			end
		*/		  
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
       if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Top_LeftY;
				Ball_X_Pos <= Ball_Top_LeftX;
				Ball_btm_Y_pos <= Ball_Btm_RightY;
				Ball_btm_X_pos <= Ball_Btm_RightX;
				
        end
           
        else 
        begin 
				 if ( (Ball_Y_Pos ) >= 369 ) begin // Ball is at the bottom edge, sit the fuck down.
					   // 2's complement.
					  Ball_X_Motion <= 10'b0;
					  Ball_Y_Motion <= -1;
					  Ball_Y_Pos <= 368;
					  Ball_X_Pos <= Ball_X_Pos;
					  
					  
					  end
				
					  
				 else if ( Ball_Y_Pos  < Ball_Y_Min ) begin  // Ball is at the top edge, BOUNCE!
					  Ball_Y_Motion <= Ball_Y_Step;
					  Ball_X_Motion <= 10'b0;
					  end
				 else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max ) begin // Ball is at the bottom edge, BOUNCE!
					  Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  Ball_Y_Motion <= 10'b0;
					  end
				 else if ( (Ball_X_Pos - Ball_Size) <= Ball_X_Min ) begin // Ball is at the top edge, BOUNCE!
					  Ball_X_Motion <= Ball_X_Step;
					  Ball_Y_Motion <= 10'b0;
					  end
				  
			
			   else if(keycode ==  16'h0004 || keycode == 16'h0024 || keycode == 16'h0005 )
				begin														//04-A x04 left D-pad
				 Ball_X_Motion <= ( ~(Ball_X_Step) + 1'b1); 
				 Ball_Y_Motion <= Ball_Y_Motion; 
				 end
				 else if(keycode ==  16'b0000000000001000 || keycode == 16'h0028 || keycode == 16'h0009)//07-D   x08 right D-pad
				 begin
				  Ball_X_Motion <= Ball_X_Step; 
				 Ball_Y_Motion <= Ball_Y_Motion;
				 end
				 /*else if(keycode ==  16'b0000000000000010)//16-S x02 down D-pad
				 begin
				  Ball_Y_Motion <= Ball_Y_Step; 
				 Ball_X_Motion <= Ball_X_Motion;
				 end
				 */
				/* else if(keycode ==  16'b0000000000000001)//1A-W x01 up on D-pad
				 begin
				  Ball_Y_Motion <= ( (~(Ball_Y_Step) + 1'b1) );
				
	    		 
				 Ball_X_Motion <= Ball_X_Motion;
				 end
				 */
				/*
			  	 else if( keycode == 16'h0001 &&  Ball_Y_Pos >= 300 )
				 begin
				 Ball_Y_Motion <= (~10'd6 + 1'b1);
				 Ball_X_Motion <= Ball_X_Motion;
				 end
				 else if(Ball_Y_Pos < 368)
				 begin
				 Ball_Y_Motion <= Ball_Y_Step ;
				 Ball_X_Motion <= Ball_X_Motion;
				 end
				 */
				 else if(keycode ==  16'b0000000000000000)             //stop moving if no button is pressed
				 begin
				 Ball_X_Motion <= 10'b0;
				 Ball_Y_Motion <= Ball_Y_Motion;
				 end
				 else begin
					  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Ball_X_Motion <= 10'b0;  //--
					  end
				 
			
				 Ball_Y_Pos <= (Ball_Y_Pos + up + down );  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
				 Ball_btm_X_pos <= (Ball_btm_X_pos + Ball_X_Motion);
				 Ball_btm_Y_pos <= (Ball_btm_Y_pos + Ball_Y_Motion + gravity*Ball_Y_Step );
				
			
	
			
		end  
    end
       
    assign eightx = Ball_X_Pos;
   
    assign eighty = Ball_Y_Pos;
   
    assign eights = Ball_Size;
	 
	 assign ymotion = Ball_Y_Motion;
	 
	 assign xmotion = Ball_X_Motion;
    

endmodule
