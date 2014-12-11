//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper2 ( input        [9:0] sprite0x, sprite0y, DrawX, DrawY,sprite0S,sprite1x,sprite1y, 
														 sprite2x,sprite2y,sprite3x,sprite3y,sprite4x,sprite4y,sprite5x,sprite5y,
														 sprite6x,sprite6y,sprite7x,sprite7y,sprite8x,sprite8y,sprite9x,sprite9y,sprite10x,sprite10y,
														 sprite11x,sprite11y,sprite12x,sprite12y,sprite13x,sprite13y,sprite14x,sprite14y,sprite15x,sprite15y,
														 sprite16x,sprite16y,sprite33xr,sprite33yr,
													
							  //input  logic [7:0] data,
							   input logic [0:29][0:30][0:3] sprite0,
							   input logic [0:15][0:7][0:3] sprite1,
								input logic [0:22][0:30][0:3] sprite2,
							   input logic [0:24][0:30][0:3] sprite3,
							   input logic [0:21][0:30][0:3] sprite4,
							   input logic [0:22][0:30][0:3] sprite5,
							   input logic [0:24][0:30][0:3] sprite6,
							   input logic [0:21][0:30][0:3] sprite7,
								input logic [0:24][0:30][0:3] sprite8,
							   input logic [0:27][0:30][0:3] sprite9,
								input logic [0:29][0:30][0:3] sprite10,
								input logic [0:29][0:30][0:3] sprite11,
								input logic [0:6][0:6][0:3] sprite12,
								input logic [0:6][0:6][0:3] sprite13,
								input logic [0:6][0:6][0:3] sprite14,
								input logic [0:79][0:79][0:3] sprite15,
							   input logic [0:79][0:79][0:3] sprite16,
								input logic [0:79][0:79][0:3] sprite17,
								input logic [0:23][0:30][0:3] sprite18,
								input logic [0:21][0:30][0:3] sprite19,
								input logic [0:23][0:30][0:3] sprite20,
								input logic [0:21][0:30][0:3] sprite21,
								input logic [0:23][0:30][0:3] sprite22,
								input logic [0:21][0:30][0:3] sprite23,
								input logic [0:23][0:30][0:3] sprite24,
								input logic [0:21][0:30][0:3] sprite25,
								input logic [0:79][0:44][0:3] sprite26,
								input logic [0:59][0:12][0:3] sprite27,
								input logic [0:59][0:12][0:3] sprite28,
								input logic [0:59][0:12][0:3] sprite29,
								input logic [0:59][0:12][0:3] sprite30,
								input logic [0:59][0:12][0:3] sprite31,
								input logic [0:66][0:181][0:2] sprite32,
								input logic [0:18][0:17][0:1] sprite33,
								input logic [0:18][0:17][0:1] sprite34,
								input logic [0:18][0:17][0:1] sprite35,
								input logic [0:18][0:17][0:1] sprite36,
								input logic [0:31][0:48][0:2] sprite37,
								input logic [0:47][0:97][0:3] sprite38,
								input logic [0:15][0:7][0:3] 	sprite39,
								input logic [0:15][0:7][0:1] 	sprite40,
							   input logic [0:15][0:7][0:1]  sprite41,
							   input logic [0:15][0:7][0:1]  sprite42,
							   input logic [0:15][0:7][0:1]  sprite43,
							 
								
								//input logic sprite26,sprite27,sprite28,sprite29,sprite30,sprite31,sprite32,
							
							  
                       output logic [7:0]  Red, Green, Blue );
							  
							  parameter [2:0] c23 = 3'b000;
							parameter [2:0] c24 = 3'b001;
							parameter [2:0] c25 = 3'b010;
							parameter [2:0] c26 = 3'b011;
							parameter [2:0] c27 = 3'b100;
							//wily castle colors
							parameter [3:0] c28 = 4'b0000;
							parameter [3:0] c29 = 4'b0001;
							parameter [3:0] c30 = 4'b0010;
							parameter [3:0] c31 = 4'b0011;
							parameter [3:0] c32 = 4'b0100;
							parameter [3:0] c33 = 4'b0101;
							parameter [3:0] c34 = 4'b0110;
							parameter [3:0] c35 = 4'b0111;
							parameter [3:0] c36 = 4'b1000;
							parameter [3:0] c37 = 4'b1001;
							parameter [3:0] c38 = 4'b1010;
							parameter [3:0] c39 = 4'b1011;
							parameter [3:0] c40 = 4'b1100;
							parameter [3:0] c41 = 4'b1101;
    

	 logic [0:3] sprite_on0;
	 logic [0:3] sprite_on1;
	 logic [0:3] sprite_on2;
	 logic [0:3] sprite_on3;
	 logic [0:3] sprite_on4;
	 logic [0:3] sprite_on5;
	 logic [0:3] sprite_on6;
	 logic [0:3] sprite_on7;
	 logic [0:3] sprite_on8;
	 logic [0:3] sprite_on9;
	 logic [0:3] sprite_on10;
	 logic [0:3] sprite_on11;
	 logic [0:3] sprite_on12;
	 logic [0:3] sprite_on13;
	 logic [0:3] sprite_on14;
	 logic [0:3] sprite_on15;
	 logic [0:3] sprite_on16;
	 logic [0:3] sprite_on17;
	 logic [0:3] sprite_on18;
	 logic [0:3] sprite_on19;
	 logic [0:3] sprite_on20;
	 logic [0:3] sprite_on21;
	 logic [0:3] sprite_on22;
	 logic [0:3] sprite_on23;
	 logic [0:3] sprite_on24;
	 logic [0:3] sprite_on25;
	 logic [0:3] sprite_on26;
	 logic [0:3] sprite_on27;
	 logic [0:3] sprite_on28;
	 logic [0:3] sprite_on29;
	 logic [0:3] sprite_on30;
	 logic [0:3] sprite_on31;
	 logic [0:2] sprite_on32;
	 logic [0:1] sprite_on33;
	 logic [0:3] sprite_on34;
	 logic [0:3] sprite_on35;
	 logic [0:3] sprite_on36;
	 logic [0:2] sprite_on37;
	 logic [0:3] sprite_on38;
	 logic [0:3] sprite_on39;
	 logic [0:1] 		 sprite_on40;
	 logic [0:1]		 sprite_on41;
	 logic [0:1]		 sprite_on42;
	 logic [0:1]		 sprite_on43;
    
   //declare and assign bottom left and bottom right of a sprite if needed
	logic [9:0] btm0x,btm0y,btm1x,btm1y,
					btm2x,btm2y,btm3x,btm3y,
					btm4x,btm4y,btm5x,btm5y,
					btm6x,btm6y,btm7x,btm7y,
					btm8x,btm8y,btm9x,btm9y,
					btm10x,btm10y,btm11x,btm11y,
					btm12x,btm12y,btm13x,btm13y,
					btm14x,btm14y,btm15x,btm15y,
					btm16x,btm16y,btm17x,btm17y,
					btm18x,btm18y,btm19x,btm19y,
					btm20x,btm20y,btm21x,btm21y,
					btm22x,btm22y,btm23x,btm23y,
					btm24x,btm24y,btm25x,btm25y,
					btm26x,btm26y,btm27x,btm27y,
					btm28x,btm28y,btm29x,btm29y,
					btm30x,btm30y,btm31x,btm31y,
					btm32x,btm32y,btm33x,btm33y,
					btm34x,btm34y,btm35x,btm35y,
					btm36x,btm36y,btm37x,btm37y,
					btm38x,btm38y,btm39x,btm39y;
					
	assign btm0x = sprite0x + 10'd30;
	assign btm0y = sprite0y + 10'd30;
	assign btm1x = sprite1x + 10'd8;
	assign btm1y = sprite1y +10'd16;
	assign btm12x = sprite12x + 10'd7;
	assign btm12y = sprite12y +10'd7;
	assign btm13x = sprite13x +10'd7;
	assign btm13y = sprite13y +10'd7;
	assign btm14x = sprite14x +10'd7;
	assign btm14y = sprite14y +10'd7;
	assign btm15x = 639;
	assign btm16x = 80;
	assign btm16y = 80;
	// draw sprite0 megaman
	   always_comb
    begin:Ball_on_proc0
	     
        if (DrawX >= sprite0x && DrawX <= btm0x && DrawY >= sprite0y && DrawY <= btm0y) begin
		   
            sprite_on0 = sprite0[DrawY-sprite0y][DrawX-sprite0x];
			end
				
				else
				begin
				sprite_on0 = 4'b0;
				end
				
				
       
     end 
	  // draw sprite1 idk what it'll be in the end it's a smiley face right now maybe megabuster bullet
	  always_comb
	   begin:Ball_on_proc1
	     
        if (DrawX >= sprite1x && DrawX < btm1x && DrawY >= sprite1y && DrawY < btm1y) begin
		   
            sprite_on1 = sprite1[DrawY-sprite1y][DrawX-sprite1x];
			
				
				
				end
				else
				sprite_on1 = 4'b0;
				
       
     end 
	  //draw bullet_1 sprite
	    always_comb
    begin:Ball_on_proc12
	   if (DrawX >= sprite12x && DrawX <= btm12x && DrawY >= sprite12y && DrawY <= btm12y) begin
		   
            sprite_on12 = sprite12[DrawY-sprite12y][DrawX-sprite12x];
			end
				
				else
				begin
				sprite_on12 = 4'b0;
				end
				
				
       
     end 
	  //draw bullet_2 sprite
	    always_comb
    begin:Ball_on_proc13
	   if (DrawX >= sprite13x && DrawX <= btm13x && DrawY >= sprite13y && DrawY <= btm13y) begin
		   
            sprite_on13 = sprite13[DrawY-sprite13y][DrawX-sprite13x];
			end
				
				else
				begin
				sprite_on13 = 4'b0;
				end
				
				
       
     end 
	  //draw bullet_3 sprite
	    always_comb
    begin:Ball_on_proc14
	   if (DrawX >= sprite14x && DrawX <= btm14x && DrawY >= sprite14y && DrawY <= btm14y) begin
		   
            sprite_on14 = sprite14[DrawY-sprite14y][DrawX-sprite14x];
			end
				
				else
				begin
				sprite_on14 = 4'b0;
				end
				
				
       
     end 
	   // draw srpite15 column of level blocks on right side of screen
	  always_comb
	   begin:Ball_on_proc15
	     
        if (DrawX >= 559 && DrawX < btm15x && DrawY >= 0 && DrawY < 360 ) begin
		   
            sprite_on15 = sprite15[DrawY][DrawX-559];
			
				
				
				end
				else
				sprite_on15 = 4'b0;
				
       
     end 
	  
	  // draw srpite16 column of level blocks on left side of screen
	  always_comb
	   begin:Ball_on_proc16
	     
        if (DrawX >= 0 && DrawX < btm16x && DrawY >= 0 && DrawY < 360 ) begin
		   
            sprite_on16 = sprite16[DrawY][DrawX];
			
				
				
				end
				else
				sprite_on16 = 4'b0;
				
       
     end 
      
	   // draw srpite17 row of large level blocks on bottom of screen
	  always_comb
	   begin:Ball_on_proc17
	     
        if ( /* DrawX >= 0 && DrawX < 640  && */ DrawY >= 399 && DrawY < 480 ) begin
		   
            sprite_on17 = sprite17[DrawY-399][DrawX];
			
				
				
				end
				else
				sprite_on17 = 4'b0;
				
       
     end 
//draw sprite 26 row of small level blocks on screen spaced between large blocks
 always_comb
	   begin:Ball_on_proc26
	     
        if ( DrawX >= 82 && DrawX < 637  &&  DrawY >= 399 && DrawY < 480 ) begin
		   
            sprite_on26 = sprite26[DrawY-399][DrawX-82];
				//sprite_on26 = sprite26;
			
				
				
				end
				else
				sprite_on26 = 4'b0;
				
       
     end 
//draw sprites 27-31 health bar sprites from ROM
always_comb
			begin
			if(DrawX >= 85 && DrawX <98 && DrawY >= 10 && DrawY < 70)
					begin
					sprite_on27 = sprite27[DrawY -10][DrawX-85];
					//sprite_on27 = sprite27;
					end
			else
					sprite_on27 = 4'b0;
			end
//draw title screen
always_comb
			begin
			if(DrawX >= 229 && DrawX < 411 && DrawY >= 206 && DrawY < 273 )
					begin
					sprite_on32 = sprite32[DrawY - 206][DrawX - 229];
					//sprite_on32 = sprite32;
					end
			else
					sprite_on32 = 3'b0;
			end
//draw mettaur
always_comb
			begin
			if(DrawX >= sprite33xr && DrawX < (sprite33xr + 18) && DrawY >= sprite33yr && DrawY < (sprite33yr + 19))
						begin
						sprite_on33 = sprite33[DrawY-sprite33yr][DrawX - sprite33xr];
						end
			else
					sprite_on33 = 2'b0;
			end
//draw middle platform

 always_comb
    begin:Ball_on_proc37
	     
        if (DrawX >= 296 && DrawX < 345 && DrawY >= 331 && DrawY < 368) begin
		   
            sprite_on37 = sprite37[DrawY-331][DrawX-296];
			end
				
				else
				begin
				sprite_on37 = 3'b0;
				end
				
				
       
     end 
//draw wily castle
always_comb
begin
		if(DrawX >= 271 && DrawX < 369 && DrawY >= 80 && DrawY < 128 )
			sprite_on38 = sprite38[DrawY - 80][DrawX - 271];
		else
			sprite_on38 = 4'b0;
end

//draw thousands digit
always_comb
begin
		if(DrawX >=304 && DrawX < 312 && DrawY >= 10 && DrawY < 26 )
			sprite_on43 = sprite43[DrawY - 10][DrawX - 304];
		else
			sprite_on43 = 2'b0;
end
//draw hundreds digit
always_comb
begin
		if(DrawX >=313 && DrawX < 321 && DrawY >= 10 && DrawY < 26 )
			sprite_on42 = sprite42[DrawY - 10][DrawX - 313];
		else
			sprite_on42 = 2'b0;
end
//draw tens digit
always_comb
begin
		if(DrawX >=322 && DrawX < 330 && DrawY >= 10 && DrawY < 26 )
			sprite_on41 = sprite41[DrawY - 10][DrawX - 322];
		else
			sprite_on41 = 2'b0;
end
//draw ones digit
always_comb
begin
		if(DrawX >=331 && DrawX < 339 && DrawY >= 10 && DrawY < 26 )
			sprite_on40 = sprite40[DrawY - 10][DrawX - 331];
		else
			sprite_on40 = 2'b0;
end
 always_comb
  begin:RGB_Display0
//color sprite0 megaman
        if (sprite_on0 == 4'b0001)    //black
            begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
            end 
			else if(sprite_on0 == 4'b0010) //cyan
			begin
				Red = 8'h00;
            Green = 8'hFF;
            Blue = 8'hFF;
			end
			else if(sprite_on0 == 4'b0011)  //blue
			begin
				Red = 8'h7B;
            Green = 8'h68;
            Blue = 8'hEE;
			end
			else if(sprite_on0 == 4'b0100)  //tanish
			begin
				Red = 8'hff;
            Green = 8'hE7;
            Blue = 8'hBA;
			end
			else if(sprite_on0 == 4'b0101)  //white
			begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
			end
			
//color sprite1				
		  else if (sprite_on1 == 4'b1)  //light green
            begin 
            Red = 8'h55;
            Green = 8'hff;
            Blue = 8'h00;
            end 
//color sprite 12 bullet_1
		  else if(sprite_on12 == 4'b0001)  // 
				begin
				Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
				end
		  else if(sprite_on12 == 4'b0101)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
		  else if(sprite_on12 == 4'b1001)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00;
				end
//color sprite 13 bullet_2
		  else if(sprite_on13 == 4'b0001)  // 
				begin
				Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
				end
		  else if(sprite_on13 == 4'b0101)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
		  else if(sprite_on13 == 4'b1001)
				begin
				Red = 8'h00;    //change back to yellow
            Green = 8'hff;
            Blue = 8'hff;
				end
//color sprite 14 bullet_1
		  else if(sprite_on14 == 4'b0001)  // 
				begin
				Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
				end
		  else if(sprite_on14 == 4'b0101)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
		  else if(sprite_on14 == 4'b1001)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00;
				end
//color sprite15 right column of level blocks
		  else if(sprite_on15 == 4'b0001)
				begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
            end 
			else if(sprite_on15==4'b0110 )
			begin
			   Red = 8'h60;
            Green = 8'he0;
            Blue = 8'h80;
			end
			else if(sprite_on15==4'b0111 )
			begin
			   Red = 8'ha0;
            Green = 8'h80;
            Blue = 8'h00;
			end
			else if(sprite_on15==4'b1000 )
			begin
			   Red = 8'he0;
            Green = 8'h40;
            Blue = 8'h00;
			end
//color sprite16 left column of level blocks
		  else if(sprite_on16 == 4'b0001)
				begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
            end 
			else if(sprite_on16==4'b0110 )
			begin
			   Red = 8'h60;
            Green = 8'he0;
            Blue = 8'h80;
			end
			else if(sprite_on16==4'b0111 )
			begin
			   Red = 8'ha0;
            Green = 8'h80;
            Blue = 8'h00;
			end
			else if(sprite_on16==4'b1000 )
			begin
			   Red = 8'he0;
            Green = 8'h40;
            Blue = 8'h00;
			end
//color sprite17 bottom rows of large level blocks	
  else if(sprite_on17 == 4'b0001)
				begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
            end 
			else if(sprite_on17==4'b0110 )
			begin
			   Red = 8'h60;
            Green = 8'he0;
            Blue = 8'h80;
			end
			else if(sprite_on17==4'b0111 )
			begin
			   Red = 8'ha0;
            Green = 8'h80;
            Blue = 8'h00;
			end
			else if(sprite_on17==4'b1000 )
			begin
			   Red = 8'he0;
            Green = 8'h40;
            Blue = 8'h00;
			end	
//color sprite 26 small bottom row level blocks	
else if(sprite_on26 == 4'b0001)
				begin 
            Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
            end 
			else if(sprite_on26==4'b0110 )
			begin
			   Red = 8'h60;
            Green = 8'he0;
            Blue = 8'h80;
			end
			else if(sprite_on26==4'b0111 )
			begin
			   Red = 8'ha0;
            Green = 8'h80;
            Blue = 8'h00;
			end
			else if(sprite_on26==4'b1000 )
			begin
			   Red = 8'he0;
            Green = 8'h40;
            Blue = 8'h00;
			end
//color sprite 27 health bars
			else if(sprite_on27 == 4'b1010)
				begin
				 Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
				end
			else if(sprite_on27 == 4'b1011)
				begin
				 Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00;
				end
			else if(sprite_on27 == 4'b1100)
				begin
				 Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
// color title screen sprite 32
			else if(sprite_on32 == 3'b010)
				begin
				Red = 8'h00;
            Green = 8'h40;
            Blue = 8'h00;
				end
			else if(sprite_on32 == 3'b011)
				begin
				Red = 8'h60;
            Green = 8'hc0;
            Blue = 8'hc0;
				end
			else if(sprite_on32 == 3'b100)
				begin
				Red = 8'h80;
            Green = 8'h00;
            Blue = 8'h00;
				end	
			else if(sprite_on32 == 3'b101)
				begin
				Red = 8'hc0;
            Green = 8'h20;
            Blue = 8'h80;
				end
			else if(sprite_on32 == 3'b110)
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
//draw mettaur sprites 33r - 36r
			/*else if(sprite_on33 == 2'b00)  //black
				begin
				Red = 8'h00;
            Green = 8'h00;
            Blue = 8'h00;
				end
				*/
			else if(sprite_on33 == 2'b01) //yellow
				begin
				Red = 8'hE0;
            Green = 8'hA0;
            Blue = 8'h40;
				end
			else if(sprite_on33 == 2'b11) // white
				begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				end
			
//sprite 37 platfroms
			
		else if(sprite_on37 == 3'b001)  //faint red
				begin
				Red = 8'h40;
            Green = 8'h20;
            Blue = 8'h00;
				end             
			else if(sprite_on37 == 3'b010)  //green
				begin
				Red = 8'h60;
            Green = 8'hE0;
            Blue = 8'h80;
				end
			else if(sprite_on37 == 3'b011)  //poop green
				begin
				Red = 8'hA0;
            Green = 8'h80;
            Blue = 8'h00;
				end
			else if(sprite_on37 == 3'b100)  //red
				begin
				Red = 8'hE0;
            Green = 8'h40;
            Blue = 8'h00;
				end
 //sprite 38 wily castle
		else if(sprite_on38 == c28)
		begin
		Red = 8'h00;
		Green = 8'h00;
		Blue = 8'h00;
		end
		else if(sprite_on38 == c29)
		begin
		Red = 8'h00;
		Green = 8'h00;
		Blue = 8'h40;
		end
		else if(sprite_on38 == c30)
		begin
		Red = 8'h00;
		Green = 8'h20;
		Blue = 8'h40;
		end
		else if(sprite_on38 == c31)
		begin
		Red = 8'h20;
		Green = 8'h20;
		Blue = 8'h40;
		end
		else if(sprite_on38 == c32)
		begin
		Red = 8'h20;
		Green = 8'h20;
		Blue = 8'h80;
		end
		else if(sprite_on38 == c33)
		begin
		Red = 8'h20;
		Green = 8'h40;
		Blue = 8'h80;
		end
		else if(sprite_on38 == c34)
		begin
		Red = 8'h20;
		Green = 8'h40;
		Blue = 8'hc0;
		end
		else if(sprite_on38 == c35)
		begin
		Red = 8'h20;
		Green = 8'h60;
		Blue = 8'hc0;
		end
		else if(sprite_on38 == c36)
		begin
		Red = 8'h40;
		Green = 8'h40;
		Blue = 8'hc0;
		end
		else if(sprite_on38 == c37)
		begin
		Red = 8'h40;
		Green = 8'h60;
		Blue = 8'hc0;
		end
		else if(sprite_on38 == c38)
		begin
		Red = 8'h40;
		Green = 8'h80;
		Blue = 8'hc0;
		end
		else if(sprite_on38 == c39)
		begin
		Red = 8'h60;
		Green = 8'h80;
		Blue = 8'hc0;
		end
//color score
		else if(sprite_on40 == 1'b1)
			begin
			Red = 8'hF0;
			Green = 8'hF0;
			Blue = 8'hF0;
			end
		else if(sprite_on41 == 1'b1)
			begin
			Red = 8'hF0;
			Green = 8'hF0;
			Blue = 8'hF0;
			end
		else if(sprite_on42 == 1'b1)
			begin
			Red = 8'hF0;
			Green = 8'hF0;
			Blue = 8'hF0;
			end
		else if(sprite_on43 == 1'b1)
			begin
			Red = 8'hF0;
			Green = 8'hF0;
			Blue = 8'hF0;
			end
			
//color background				
        else 
            begin 
            Red = 8'h00;  //44
            Green = 8'h00; //25
            Blue = 8'h00; // 55
            end 
	
  end 


       
       
	
  
    
endmodule
