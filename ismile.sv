//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ismile ( input Reset, frame_clk, 
					input logic [9:0] eightx,eighty,
               output [9:0]  ismilex, ismiley );
    
    logic [9:0] ismiles;
    logic [9:0] Ball_X_Pos, Ball_X_Motion, Ball_Y_Pos, Ball_Y_Motion, Ball_Size,Ball,Ball_btm_Y_pos,Ball_btm_X_pos;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=2;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=637;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=2;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=477;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=3;      // Step size on the Y axis
	 parameter [9:0] gravity=0;
    parameter [9:0] Ball_Top_LeftX = 224;
	 parameter [9:0] Ball_Top_LeftY = 345;
	 parameter [9:0] Ball_Btm_RightX= 231;
	 parameter [9:0] Ball_Btm_RightY= 135;
  assign Ball_Size = 1;    // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
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
				 if ( (Ball_Y_Pos ) > Ball_Y_Max ) begin // Ball is at the bottom edge, sit the fuck down.
					   // 2's complement.
					  Ball_X_Motion <= 10'b0;
					  Ball_Y_Motion <= (~Ball_Y_Step)+1'b1;
					  
					  
					  end
					  
				 else if ( (Ball_Y_Pos - Ball_Size) <= Ball_Y_Min ) begin  // Ball is at the top edge, BOUNCE!
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
				  
			
			   else if(ismiley >= eighty && eightx < ismilex)
				begin//04-A x04 left D-pad
				 Ball_X_Motion <= ( ~(Ball_X_Step) + 1'b1); 
				 Ball_Y_Motion <= 10'b0; 
				 end
				 else if(ismiley >= eighty && eightx > ismilex)//07-D   x08 right D-pad
				 begin
				  Ball_X_Motion <= Ball_X_Step; 
				 Ball_Y_Motion <= 10'b0;
				 end
				 
				 else begin
					  Ball_Y_Motion <= Ball_Y_Motion;  // Ball is somewhere in the middle, don't bounce, just keep moving
					  Ball_X_Motion <= Ball_X_Motion;
					  end
				 
			
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion + gravity*Ball_Y_Step );  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
				 Ball_btm_X_pos <= (Ball_btm_X_pos + Ball_X_Motion);
				 Ball_btm_Y_pos <= (Ball_btm_Y_pos + Ball_Y_Motion + gravity*Ball_Y_Step );
				
			
			
	 
      
			
		end  
    end
       
    assign ismilex = Ball_X_Pos;
   
    assign ismiley = Ball_Y_Pos;
   
    assign ismiles = Ball_Size;
	 
	 
    

endmodule
