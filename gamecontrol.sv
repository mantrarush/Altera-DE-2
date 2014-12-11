module gamecontrol(input logic frame_clk,reset,is_shot_1,is_shot_2,met1_col,on_gnd,
						 input logic [15:0] keycode,
						 input logic [2:0] curr_health,
						 input logic [9:0] ymotion,xmotion,
						 input logic [9:0] sprite0xr,sprite0yr,   //position inputs passed from movement modules
												 sprite1xr,sprite1yr,
												 sprite2xr,sprite2yr,
												 sprite3xr,sprite3yr,
												 sprite4xr,sprite4yr,
												 sprite5xr,sprite5yr,
												 sprite6xr,sprite6yr,
												 sprite7xr,sprite7yr,
												 sprite8xr,sprite8yr,
												 sprite9xr,sprite9yr,
												 sprite10xr,sprite10yr,
												 sprite11xr,sprite11yr,
												 sprite12xr,sprite12yr,
												 sprite13xr,sprite13yr,
												 sprite14xr,sprite14yr,
												 sprite15xr,sprite15yr,
												 sprite16xr,sprite16yr,
												 
															
														//sprite data passed from ROM file
								input logic [0:29][0:30][0:3] sprite0r,
							   input logic [0:15][0:7][0:3] sprite1r,
								input logic [0:22][0:30][0:3] sprite2r,
							   input logic [0:24][0:30][0:3] sprite3r,
							   input logic [0:21][0:30][0:3] sprite4r,
							   input logic [0:22][0:30][0:3] sprite5r,
							   input logic [0:24][0:30][0:3] sprite6r,
							   input logic [0:21][0:30][0:3] sprite7r,
								input logic [0:24][0:30][0:3] sprite8r,
							   input logic [0:27][0:30][0:3] sprite9r,
								input logic [0:29][0:30][0:3] sprite10r,
								input logic [0:29][0:30][0:3] sprite11r,
								input logic [0:6][0:6][0:3] sprite12r,
								input logic [0:6][0:6][0:3] sprite13r,
								input logic [0:6][0:6][0:3] sprite14r,
								input logic [0:79][0:79][0:3] sprite15r,
							   input logic [0:79][0:79][0:3] sprite16r,
								input logic [0:79][0:79][0:3] sprite17r,
								input logic [0:23][0:30][0:3] sprite18r,
								input logic [0:21][0:30][0:3] sprite19r,
								input logic [0:23][0:30][0:3] sprite20r,
								input logic [0:21][0:30][0:3] sprite21r,
								input logic [0:23][0:30][0:3] sprite22r,
								input logic [0:21][0:30][0:3] sprite23r,
								input logic [0:23][0:30][0:3] sprite24r,
								input logic [0:21][0:30][0:3] sprite25r,
								input logic [0:31][0:48][0:2] sprite37r,
								input logic [0:79][0:44][0:3] sprite26r,
								input logic [0:59][0:12][0:3] sprite27r,
								input logic [0:59][0:12][0:3] sprite28r,
								input logic [0:59][0:12][0:3] sprite29r,
								input logic [0:59][0:12][0:3] sprite30r,
								input logic [0:59][0:12][0:3] sprite31r,
								input logic [0:66][0:181][0:2] sprite32r,
								input logic [0:47][0:97][0:3] sprite38r,	
								
								
								/*input logic [0:18][0:17][0:1] sprite33r,
								input logic [0:18][0:17][0:1] sprite34r,
								input logic [0:18][0:17][0:1] sprite35r,
								input logic [0:18][0:17][0:1] sprite36r,
								input logic [0:15][0:7][0:3] sprite37r,
								input logic [0:15][0:7][0:3] sprite38r,
								input logic [0:15][0:7][0:3] sprite39r,*/
								
								
								//input logic sprite26r,sprite27r,sprite28r,sprite29r,sprite30r,sprite31r,sprite32r,
								
							 output logic [9:0] sprite0x,sprite0y,   //position inputs passed from movement modules
													  sprite1x,sprite1y,
													  sprite2x,sprite2y,
													  sprite3x,sprite3y,
													  sprite4x,sprite4y,
													  sprite5x,sprite5y,
													  sprite6x,sprite6y,
													  sprite7x,sprite7y,
													  sprite8x,sprite8y,
													  sprite9x,sprite9y,
													  sprite10x,sprite10y,
													  sprite11x,sprite11y,
													  sprite12x,sprite12y,
													  sprite13x,sprite13y,
													  sprite14x,sprite14y,
													  sprite15x,sprite15y,
													  sprite16x,sprite16y,
													//sprite data passed to color mapper
								output logic [0:29][0:30][0:3] sprite0,
								output logic [0:15][0:7][0:3] sprite1,
								output logic [0:22][0:30][0:3] sprite2,
								output logic [0:24][0:30][0:3] sprite3,
								output logic [0:21][0:30][0:3] sprite4,
								output logic [0:22][0:30][0:3] sprite5,
								output logic [0:24][0:30][0:3] sprite6,
								output logic [0:21][0:30][0:3] sprite7,
								output logic [0:24][0:30][0:3] sprite8,
								output logic [0:27][0:30][0:3] sprite9,
								output logic [0:29][0:30][0:3] sprite10,
								output logic [0:29][0:30][0:3] sprite11,
								output logic [0:6][0:6][0:3] sprite12,
								output logic [0:6][0:6][0:3] sprite13,
								output logic [0:6][0:6][0:3] sprite14,
								output logic [0:79][0:79][0:3] sprite15,
								output logic [0:79][0:79][0:3] sprite16,
								output logic [0:79][0:79][0:3] sprite17,
								output logic [0:23][0:30][0:3] sprite18,
								output logic [0:21][0:30][0:3] sprite19,
								output logic [0:23][0:30][0:3] sprite20,
								output logic [0:21][0:30][0:3] sprite21,
								output logic [0:23][0:30][0:3] sprite22,
								output logic [0:21][0:30][0:3] sprite23,
								output logic [0:23][0:30][0:3] sprite24,
								output logic [0:21][0:30][0:3] sprite25,
								output logic [0:31][0:48][0:2] sprite37,
								output logic [0:79][0:44][0:3] sprite26,
								output logic [0:59][0:12][0:3] sprite27,
								output logic [0:59][0:12][0:3] sprite28,
								output logic [0:59][0:12][0:3] sprite29,
								output logic [0:59][0:12][0:3] sprite30,
								output logic [0:59][0:12][0:3] sprite31,
								output logic [0:66][0:181][0:2] sprite32,
								output logic [0:47][0:97][0:3] sprite38,
								
								
								/*output logic [0:18][0:17][0:1] sprite33,
								output logic [0:18][0:17][0:1] sprite34,
								output logic [0:18][0:17][0:1] sprite35,
								output logic [0:18][0:17][0:1] sprite36,
								output logic [0:15][0:7][0:3] sprite37,
								output logic [0:15][0:7][0:3] sprite38,
								output logic [0:15][0:7][0:3] sprite39,*/
								
								//output logic sprite26,sprite27,sprite28,sprite29,sprite30,sprite31,sprite32,
								
								output logic m_isright,m_isleft,is_start,enemycol             //used to determine shooting direction
																				 );
						
                   enum logic [5:0] {START,LEVEL,STANDR,STANDL,RUN_LEFT1,RUN_LEFT2,RUN_LEFT3,RUN_RIGHT1,RUN_RIGHT2,RUN_RIGHT3,JUMPR,JUMPL,ENECOL,GAMEOVER} curr_state, next_state;
						 always_ff @ (posedge clk_div or posedge reset)
									begin
											if(reset)
												curr_state = START;         //Change to START when done debugging
											else 
												curr_state = next_state;
									end
							int cnt;
							logic clk_div;
							parameter [31:0] num = 4;
						   	 
							
							parameter [2:0] max_health = 4;
							
							always_ff @ ( posedge frame_clk or posedge reset)   //slow down the vga clock to actually see sprite animations
														begin 
														if(reset == 1'b1)
															cnt <= 0;
														else if (cnt == num -1)
														 cnt  <= 0;
														else 
														cnt <= cnt +1;
														end
							always_ff @ (posedge(frame_clk), posedge(reset))     
													begin
														 if (reset == 1'b1)
															  clk_div <= 1'b0;
														 else if (cnt == num - 1)
															  clk_div <= ~clk_div;
														 else
															  clk_div <= clk_div;
													end
					    always_comb 
						   
									begin
										
											next_state = curr_state;
												case(curr_state) //state assignments
												
												START: if(keycode ==  16'b0000000000010000)      //If start key is pressed begin the game
															next_state = LEVEL;
												LEVEL: if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
															next_state = RUN_LEFT1;
														 else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
														   next_state = RUN_RIGHT1;
														 else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
														   next_state = JUMPR;
														 else                            // If no key is pressed goto standing sprite state
														    next_state = STANDR;
												STANDR: if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
															next_state = RUN_LEFT1;
														 else if(enemycol == 1 || met1_col == 1)
														   next_state = ENECOL;
														 else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
														   next_state = RUN_RIGHT1;
														 else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
														   next_state = JUMPR;
														 else if(curr_health <= 0)
													       next_state = GAMEOVER;
														 else   // If no key is pressed goto standing sprite state
															next_state = STANDR;
												STANDL: if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
															next_state = RUN_LEFT1;
														 else if(enemycol == 1 || met1_col == 1)
														   next_state = ENECOL;
														 else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
														   next_state = RUN_RIGHT1;
														 else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
														   next_state = JUMPL;
														 else if(curr_health <= 0)
													       next_state = GAMEOVER;	
														 else   // If no key is pressed goto standing sprite state
															next_state = STANDL;			
												RUN_LEFT1: if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT2;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT1;
															  else if(enemycol == 1 || met1_col == 1)
																	next_state = ENECOL;		
														     else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
																	next_state = JUMPL;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDL;
												RUN_LEFT2:
															  if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT3;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT1;
															  else if(enemycol == 1 || met1_col == 1)
																   next_state = ENECOL;		
														     else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
																	next_state = JUMPL;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDL;
												RUN_LEFT3:
															  if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT1;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT1;
															  else if(enemycol == 1 || met1_col == 1)
																   next_state = ENECOL;		
														     else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
																	next_state = JUMPL;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDL;					
												
												RUN_RIGHT1: 
															  if(keycode == 8'b00000100 ||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT1;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT2;
															  else if(enemycol == 1 || met1_col == 1)
														         next_state = ENECOL;		
														     else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
																	next_state = JUMPR;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDR;
												RUN_RIGHT2:
															  if(keycode == 8'b00000100||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT1;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT3;
															  else if(enemycol == 1 || met1_col == 1)
														         next_state = ENECOL;
														     else if(keycode == 8'b00000001) //If up is pressed goto jump sprite state
																	next_state = JUMPR;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDR;
												RUN_RIGHT3:
															  if(keycode == 8'b00000100||keycode == 16'h0024)     //If left is pressed goto run_left sprite state 
																	next_state = RUN_LEFT1;
															  else if(keycode == 8'b00001000 || keycode == 16'h0028) //If right is pressed goto run right sprite state
																	next_state = RUN_RIGHT1;
															  else if(enemycol == 1 || met1_col == 1)
														         next_state = ENECOL;
														     else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
																	next_state = JUMPR;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDR;					
												
												JUMPR:
															  
															  if(enemycol == 1 || met1_col == 1)
																	next_state = ENECOL;
														     else if(keycode == 8'b00000001 || ( ymotion != 10'b0 && (sprite0xr != 368 || sprite0xr != 331)) || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state and main character sprite is on the ground.
																	next_state = JUMPR;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
															  else if(ymotion == 0 || on_gnd == 1'b1)
																	next_state = STANDR; 
															  
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDR;
												JUMPL:
															  
															  if(enemycol == 1 || met1_col == 1)
																	next_state = ENECOL;
														     else if(keycode == 8'b00000001 ||( ymotion != 10'b0 && (sprite0xr != 368 || sprite0xr != 331) ) || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state and main character sprite is on the ground.
																	next_state = JUMPL;
															  else if(curr_health <= 0)
																	next_state = GAMEOVER;
															  else if(ymotion == 0 || on_gnd ==1'b1 )
																	next_state = STANDL;
														     else   // If no key is pressed goto standing sprite state
																	next_state = STANDL;					
												
												ENECOL: begin
												         
															                             // display hurt sprite for a short time before resuming normal motion
															if(keycode == 8'b00000100 ||keycode == 16'h0024 )     //If left is pressed goto run_left sprite state 
															next_state = RUN_LEFT1;
															
														 else if(keycode == 8'b00001000 || keycode == 16'h0028 ) //If right is pressed goto run right sprite state
														   next_state = RUN_RIGHT1;
														 else if(keycode == 8'b00000001  || keycode == 16'h0021 || keycode == 16'h0009 || keycode == 16'h0005) //If up is pressed goto jump sprite state
														   next_state = JUMPR;
														 else if(keycode == 8'b00000000)                           // If no key is pressed goto standing sprite state
														    next_state = STANDR;
														 else if(curr_health <= 0)
													       next_state = GAMEOVER;	 
														 else
														    next_state = ENECOL;
														   end
												GAMEOVER: begin
															 if(keycode == 16'h0010)
																next_state = LEVEL;
															 else
															   next_state = GAMEOVER;
															 end
												
															
												
											  endcase
									
									end
								always_comb                  //Initilizations
									begin
												  
												  m_isright = 1'b0;
												  m_isleft = 1'b0;
												  sprite0 = 2500'b0;
																 
												  sprite1 = 512'b0;
																 
												  sprite2 = 2208'b0;
									
												  sprite3 = 2400'b0;
																 
												  sprite4 = 2112'b0;
																 
												  sprite5 = 2208'b0;
																 
												  sprite6 = 2400'b0;
																 
												  sprite7 = 2112'b0;
																 
												  sprite8 = 2400'b0;
																 
											     sprite9 = 2500'b0;
																 
												 sprite10 = 2500'b0;
																 
												 sprite11 = 2500'b0;
																 
												 sprite12 = 196'b0;
																 
												 sprite13 = 196'b0;
																 
												 sprite14 = 196'b0;
								
												 sprite15 = 2500'b0;
																 
												 sprite16 = 2500'b0;
												 				 
												 sprite17 = 2500'b0;
												 				 
												 sprite18 = 512'b0;
												 				 
												 sprite19 = 512'b0;
												 				 
												 sprite20 = 512'b0;
												 				 
												 sprite21 = 512'b0;
												 				 
												 sprite22 = 512'b0;
												 				 
												 sprite23 = 512'b0;
												 				 
												 sprite24 = 512'b0;
												 				 
												 sprite25 = 512'b0;
												 				 
												 sprite26 = 512'b0;
												 
												 sprite28 = 512'b0;
												 
												 sprite29 = 512'b0;
												 
												 sprite30 = 512'b0;
												 
												 sprite31 = 512'b0;
												 
												 				 
												 sprite32 = 36582'b0;
												 				 
												/* sprite33 = 512'b0;
												 				 
												 sprite34 = 512'b0;
												 				 
												 sprite35 = 512'b0;
												 				 
												 sprite36 = 512'b0;
												 				 
												 sprite37 = 512'b0;
												 				 
												 sprite38 = 512'b0;
												 				 
												 sprite39 = 512'b0;*/
												 sprite37 =  4704'b0;
												 sprite38 = 18816'b0;
												 
								
									  
									  enemycol = 0; 
									  is_start = 0;
									  
									  
									  case(curr_state)
											START:
											begin
											
											is_start = 1;
											sprite32 = sprite32r;
											end
											LEVEL:
											begin
											sprite0 = sprite0r;
											sprite1 = sprite1;
											sprite15 = sprite15r;
											sprite16 = sprite16r;
											sprite17 = sprite17r;
											sprite26 = sprite26r;
											sprite37 = sprite37r;
											sprite38 = sprite38r;
											end
											STANDR:
											begin
													   m_isright = 1'b1;
														if(keycode ==  16'b0000000000100000 )
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite22r; //display shooting right sprite
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_1 display
														  begin
														sprite0 = sprite22r;  
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														  
														  
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite22r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
														sprite1  = sprite1r;      //enemy sprite displayed currently  
														sprite15 = sprite15r;   //level block sprites are displayed
											         sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														
													if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
													else if(is_shot_1 == 1 || is_shot_2 == 1)
														sprite0 = sprite22r;   //megaman shoots right sprite
												   else
														sprite0 = sprite0r;   //megaman gets standing right sprite
														
														
											end
											STANDL:
											begin
														m_isleft = 1'b1;
														if(keycode ==  16'b0000000000100000)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite18r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite18r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
													   sprite1= sprite1r;
														sprite15 = sprite15r;
											         sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
													if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
														
															end
													else if(is_shot_1 == 1 || is_shot_2 == 1)   //megman shoots left sprite
														sprite0 = sprite18r;		
												   else
														sprite0 = sprite8r;   //megaman gets standing left sprite
														
														
											end
											RUN_LEFT1:
											begin
														m_isleft = 1'b1;
														if(keycode ==  16'b0000000000100000 || keycode == 16'h0024)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite19r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite19r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
														sprite0 = sprite2r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
											         sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite19r;   //shoot left_1 sprite	
												      else
														sprite0 = sprite2r;   //megaman gets running left 1 sprite
											end
											RUN_LEFT2:
											begin
														m_isleft = 1'b1;
														if(keycode ==  16'b0000000000100000 || keycode == 16'h0024)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite20r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite20r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
													   sprite0 = sprite3r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
														sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite20r;   //shoot left 2 sprite  
												      else
														sprite0 = sprite3r;   //megaman gets running left 2 sprite
											end
											RUN_LEFT3:
											begin
														m_isleft = 1'b1;
														if(keycode ==  16'b0000000000100000 || keycode == 16'h0024)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite21r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite21r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
													   sprite0 = sprite4r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
														sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite21r;   //shoot left 3 sprite	
												      else
														sprite0 = sprite4r;   //megaman gets running left 3 sprite
											end
											RUN_RIGHT1:
											begin
														m_isright = 1'b1;
														if(keycode ==  16'b0000000000100000 || keycode == 16'h0028)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite23r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite23r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
											         sprite0 = sprite5r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
														sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite23r;    //shoot right 1 sprite
												      else
														sprite0 = sprite5r;   //megaman gets running right 1 sprite
											end
											RUN_RIGHT2:
											begin
														m_isright = 1'b1;
														if(keycode ==  16'b0000000000100000 || keycode == 16'h0028)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite24r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite24r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
														sprite0 = sprite6r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
														sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite24r;    //shoot right 2 sprite   
												   else
														sprite0 = sprite6r;   //megaman gets running  right2 sprite
											end
											RUN_RIGHT3:
											begin
														m_isright = 1'b1;
														if(keycode ==  16'b0000000000100000  || keycode == 16'h0028)
															begin
															sprite12 = sprite12r; //display bullet_1
															sprite0 = sprite25r;
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite25r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
														sprite0 = sprite7r;
														sprite1= sprite1r;
														sprite15 = sprite15r;
														sprite16 = sprite16r;
														sprite17 = sprite17r;
														sprite26 = sprite26r;
														sprite37 = sprite37r;
														sprite38 = sprite38r;
														if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
														else if(is_shot_1 == 1)
														sprite0 = sprite25r;   // shoot right 3 sprite
												   else
														sprite0 = sprite7r;   //megaman gets running right3 sprite
											end
											JUMPR:
											begin
													  m_isright = 1'b1;
													  if(keycode ==  16'b0000000000100000 || keycode == 16'h0021)
															begin
															sprite12 = sprite12r; //display bullet_1
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite10r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
											        sprite0 = sprite10r;
													  sprite1= sprite1r;
													  sprite15 = sprite15r;
													  sprite16 = sprite16r;
													  sprite17 = sprite17r;
													  sprite26 = sprite26r;
													  sprite37 = sprite37r;
													  sprite38 = sprite38r;
													  if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
												   else
														sprite0 = sprite10r;   //megaman gets jumping right sprite
											end
											JUMPL:
											begin
													  m_isleft = 1'b1;
													  if(keycode ==  16'b0000000000100000 || keycode == 16'h0021)
															begin
															sprite12 = sprite12r; //display bullet_1
															end
													   
													   if(is_shot_1 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr)))
														  begin
														sprite12= sprite12r;     //bullet_1 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite12 = 196'b0;
														else
													     begin
														  sprite12 = 196'b0;  // stop drawing bullet_1
														  end 
														    
														  /////////////////////////////////////////////////
														if(is_shot_2 == 1 && ((sprite0xr+31< sprite12xr <= 640) || (0 <sprite12xr < sprite0xr))) //bullet_2 display
														  begin
														sprite0 = sprite11r;  
														sprite13= sprite13r;     //bullet_2 keeps displaying if it has already been drawn on screen 
														  end
														else if(xmotion == 0 || ymotion == 0)
														sprite13 = 196'b0;
														else
													     begin
														  sprite13 = 196'b0;  // stop drawing bullet_2
														  end 
														  
														 ///////////////////////////////////////////////// 
														 
											        sprite0 = sprite11r;    //megaman gets jumping left sprite
													  sprite1= sprite1r;
													  sprite15 = sprite15r;
													  sprite16 = sprite16r;
													  sprite17 = sprite17r;
													  sprite26 = sprite26r;
													  sprite37 = sprite37r;
													  sprite38 = sprite38r;
													  if((sprite1xr >= sprite0xr && sprite1xr+8 <= sprite0xr+21)&& (sprite1yr >= sprite0yr && sprite1yr+8 <= sprite0yr+25))  //if enemy is in bounds of main spirte diplay damage sprite, set flag to decrease health
															begin
											         enemycol = 1;
														sprite0 = sprite9r;      //megaman gets hurt sprite
															end
												   else
														sprite0 = sprite11r;   //megaman gets jumping left sprite
											end
											ENECOL:
											begin
													 
											       sprite0 = sprite9r;
													 sprite1 = sprite1r;
													 sprite15 = sprite15r;
													 sprite16 = sprite16r;
													 sprite17 = sprite17r;
													 sprite26 = sprite26r;
													 sprite37 = sprite37r;
													 sprite38 = sprite38r;
											end
											GAMEOVER:
											begin
											sprite38 = sprite38r;
											end
										endcase
									end
									
									always_comb
									
									begin
									
									if(curr_health == 4 && is_start != 1) begin
											sprite27 = sprite27r;
											end
									else if(curr_health == 3  && is_start != 1)
											begin
											sprite27 = sprite28r;
											end
									else if(curr_health == 2 && is_start != 1)
											begin
											sprite27 = sprite29r && is_start != 1&& is_start != 1;
											end
									else if(curr_health == 1 && is_start != 1)
											begin
											sprite27 = sprite30r;
											end
									else 	
											begin
											sprite27 = sprite31r;
											end
									
									end
								
									
									assign sprite0x = sprite0xr;
									assign sprite1x = sprite1xr;
									assign sprite2x = sprite2xr;
									assign sprite3x = sprite3xr;
									assign sprite4x = sprite4xr;
									assign sprite5x = sprite5xr;
									assign sprite6x = sprite6xr;
									assign sprite7x = sprite7xr;
									assign sprite8x = sprite8xr;
									assign sprite9x = sprite9xr;
									assign sprite10x = sprite10xr;
									assign sprite11x = sprite11xr;
									assign sprite12x = sprite12xr;
									assign sprite13x = sprite13xr;
									assign sprite14x = sprite14xr;
									assign sprite15x = sprite15xr;
									assign sprite16x = sprite16xr;
									
									assign sprite0y = sprite0yr;
									assign sprite1y = sprite1yr;
									assign sprite2y = sprite2yr;
									assign sprite3y = sprite3yr;
									assign sprite4y = sprite4yr;
									assign sprite5y = sprite5yr;
									assign sprite6y = sprite6yr;
									assign sprite7y = sprite7yr;
									assign sprite8y = sprite8yr;
									assign sprite9y = sprite9yr;
									assign sprite10y = sprite10yr;
									assign sprite11y = sprite11yr;
									assign sprite12y = sprite12yr;
									assign sprite13y = sprite13yr;
									assign sprite14y = sprite14yr;
									assign sprite15y = sprite15yr;
									assign sprite16y = sprite16yr;
									
									endmodule
						 