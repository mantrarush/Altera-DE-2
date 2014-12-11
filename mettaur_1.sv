module mettaur_1(input logic frame_clk, reset,is_shot_1,is_shot_2,is_start,
					input logic [9:0] sprite12xr, sprite12yr,sprite13xr,sprite13yr, sprite0xr,sprite0yr,
					input logic [0:18][0:17][0:1] sprite33r,
															sprite34r,
															sprite35r,
															sprite36r,
					output logic[0:18][0:17][0:1] sprite33,
					output logic [9:0]            sprite33xr,sprite33yr,
					output logic 						kill, met1_col
					
					
																);
						enum logic [3:0] {GEN,MOVE_R1,MOVE_R2,MOVE_L1,MOVE_L2,DEAD} curr_state,next_state;
						
							int cnt;
							logic clk_div;
						
							logic [9:0] gencnt;
							parameter [2:0] num = 4;
							parameter [31:0] gennum = 3000;  //generate clock time
							always_ff @ ( posedge frame_clk or posedge reset)   //slow down the vga clock to actually see sprite animations
														begin 
														if(reset == 1'b1)
															begin
															cnt <= 0;
															gencnt <= 0;
															end
														else if (cnt == num -1)
														 cnt  <= 0;
														else if(gencnt == gennum -1)
														 gencnt <=0;
														else 
														begin
														cnt <= cnt +1;
														gencnt <= gencnt + 1;
														end
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

						
							always_ff @ (posedge clk_div or posedge reset)
									begin
											if(reset)
												curr_state = GEN;        //GOTO generate state
											else 
												curr_state = next_state;
									end
						
							logic [9:0] xpos,ypos,vx,vy;   // mettaur  and postions 
						   	 
							always_comb
								begin
									case(curr_state)
								GEN: 		  begin
												if(is_start == 0)
												next_state = MOVE_R1;		//When enemy is genreated begin movement
												else
												next_state = GEN;
											  end
								MOVE_R1:	  begin                       //right animation 1
											  if(kill == 1)
													next_state = DEAD;
											  else if( vx >= 0)
													next_state = MOVE_R2;
											  else if(xpos >= 637)
													next_state = MOVE_L1;
											  else
													next_state = MOVE_R2;
											  
											  end
								MOVE_R2:	  begin                      //right animation 2
											  if(kill == 1)
													next_state = DEAD;
											  else if( vx >= 0)
													next_state = MOVE_R1;
											  else if( xpos  >= 637) 
													next_state = MOVE_L1;
											  else
												   next_state = MOVE_R1;
											  end
								MOVE_L1:	  begin									//left animation 1
											  if(kill == 1)
													next_state = DEAD;
											  else if( vx <= 0)
													next_state = MOVE_L2;
											  else if(xpos <= 0)
													next_state = MOVE_R1;
											  else 
													next_state = MOVE_L2;
											  end
								MOVE_L2:	  begin											//left animation 2
											  if(kill == 1)
													next_state = DEAD;
											  else if( vx >= 0)
													next_state = MOVE_L1;
											  else if(xpos <= 0)
													next_state = MOVE_R1;
											  else
													next_state = MOVE_L1;
											  end
								DEAD:	     begin										//if it has been shot wait for respwan time
											  if(gencnt  >= 1000)
													next_state = GEN;
											  else
													next_state = DEAD;
											  end
									endcase
								end
							
								always_ff @ (posedge clk_div)
									begin
											sprite33 <= 684'b0;
											met1_col <= 1'b0;
											xpos <= xpos;
											ypos <= ypos;
											vx <= 10'd1;
											vy <= 10'd1;
											
											kill <= 1'b0;
											case(curr_state)
											GEN:  	begin              //genreate enemy at spawn point (bottom left of screen
														if(is_start == 0)
															begin
															sprite33 <= sprite35r;
															end
														else
															begin
															sprite33 <= 684'b0;
															end
														if(gencnt % 3 == 0)
															begin
															xpos <= 10'd3;
															ypos <= 10'd380;
															end
														else if(gencnt % 2 == 0 || gencnt %4 == 0 || gencnt% 5 ==0)
															begin
															xpos<=10'd636;
															ypos <= 10'd380;
															end
														else
															begin
															xpos <= 10'd3;
															ypos <= 10'd380;
															end
														
														
														end
											MOVE_R1:	begin
														sprite33 <= sprite35r;
														if(xpos  < sprite0xr)
														begin
														xpos <= xpos + 10'd3;
														vx <= 10'd3;
														end
														else
														begin
														xpos <= xpos + ~10'd3+ 1'b1;
														vx <= ~10'd3+ 1'b1;
														end
														if( xpos >= sprite0xr && xpos+ 10'd18  <= sprite0xr + 10'd31  && sprite0yr+10'd30 >= ypos  )  
																met1_col <= 1'b1;
														else 
																met1_col <= 1'b0;
														if((((sprite12xr >= xpos  &&  xpos + 10'd18 >= sprite12xr ) ||((sprite13xr >= xpos &&  xpos + 10'd18 >= sprite13xr ) )))&& (is_shot_1 == 1 || is_shot_2 == 1))
																kill <= 1'b1;
														else
																kill <= 1'b0;
														end
											MOVE_R2:	begin
														sprite33 <= sprite36r;
														if(xpos  < sprite0xr)
														begin
														xpos <= xpos + 10'd3;
														vx <= 10'd3;
														end
														else
														begin
														xpos <= xpos + ~10'd3+ 1'b1;
														vx <= ~10'd3+ 1'b1;
														end
														if( xpos >= sprite0xr && xpos+ 10'd18  <= sprite0xr + 10'd31 && sprite0yr+10'd30 >= ypos  )  
																met1_col <= 1'b1;
														else 
																met1_col <= 1'b0;
														if((((sprite12xr >= xpos &&  xpos + 10'd18 >= sprite12xr ) ||((sprite13xr >= xpos &&  xpos + 10'd18 >= sprite13xr ) )))&& (is_shot_1 == 1 || is_shot_2 == 1))
																kill <= 1'b1;
														else
																kill <= 1'b0;
														end
											MOVE_L1:	begin
														sprite33 <= sprite33r;
														if(xpos  >= sprite0xr)
														begin
														xpos <= xpos + ~10'd3 + 1'b1;
														vx <= ~10'd3 + 1'b1;
														end
														else
														begin
														xpos <= xpos + 10'd3;
														vx <= 10'd3;
														end
														if( xpos >= sprite0xr && xpos+ 10'd18  <= sprite0xr + 10'd31  && sprite0yr+10'd30 >= ypos  )  
																met1_col <= 1'b1;
														else 
																met1_col <= 1'b0;
														if((((sprite12xr >= xpos &&  xpos + 10'd18 >= sprite12xr ) ||((sprite13xr >= xpos &&  xpos + 10'd18 >= sprite13xr ) )))&& (is_shot_1 == 1 || is_shot_2 == 1))
																kill <= 1'b1;
														else
																kill <= 1'b0;
														end
											MOVE_L2:	begin
														sprite33 <= sprite34r;
														if(xpos  >= sprite0xr)
														begin
														xpos <= xpos + ~10'd3 + 1'b1;
														vx <= ~10'd3 + 1'b1;
														end
														else
														begin
														xpos <= xpos + 10'd3;
														vx <= 10'd3;
														end
														if( xpos >= sprite0xr && xpos+ 10'd18  <= sprite0xr + 10'd31  && sprite0yr+10'd30 >= ypos  )  
																met1_col <= 1'b1;
														else 
																met1_col <= 1'b0;
														if((((sprite12xr >= xpos &&  xpos + 10'd18 >= sprite12xr ) ||((sprite13xr >= xpos &&  xpos + 10'd18 >= sprite13xr ) )))&& (is_shot_1 == 1 || is_shot_2 == 1))
																kill <= 1'b1;
														else
																kill <= 1'b0;
														end
											DEAD:		begin
														kill <= 1'b1;
														sprite33 <= 684'b0;
														xpos <= 2;
														end
											 
											endcase
									end
								assign sprite33xr = xpos;
								assign sprite33yr = ypos;
								
endmodule
								
						
							
						