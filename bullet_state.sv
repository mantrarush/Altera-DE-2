module bullet_state(input logic frame_clk, Reset,
						  input logic [15:0] keycode,
						  input logic m_isright,m_isleft,
						  input logic [9:0]  sprite0xr,sprite0yr,
						  output logic [9:0] sprite12xr,sprite12yr,sprite13xr,sprite13yr,
						  output logic is_shot_1, is_shot_2 );
						   
							logic [9:0] bullet1x, bullet1y, bullet2x,bullet2y;  //postion
						  
						  enum logic [4:0] {WAIT,SHOT_1R,SHOT_1L,SHOT_2R,SHOT_2L} curr_state, next_state;
						  
						  always_ff @ (posedge frame_clk or posedge Reset)
								begin
									if(Reset == 1'b1)
										curr_state = WAIT;
									else
										curr_state = next_state;
									end
							
							always_comb 
								begin
									next_state = curr_state;
										case(curr_state)
											WAIT: begin
													if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isright == 1'b1)
															next_state = SHOT_1R;
													
													else if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isleft == 1'b1)
															next_state = SHOT_1L;
													
													else
															next_state = WAIT;
													end
											SHOT_1R: begin
														if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isright == 1'b1 && bullet1x >= (637 - sprite0xr)/2)  //wait until first shot is half-way between megaman and wall to shoot again
															next_state = SHOT_2R;
													
														else if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isleft == 1'b1 && bullet1x <= (sprite0xr)/2 )  
															next_state = SHOT_2L;
														else if(bullet1x >= 637 || bullet1x <= 0)
															next_state = WAIT;
													
														else
															next_state = SHOT_1R;
														end
											SHOT_1L: begin 
														if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isright == 1'b1 && bullet1x >= (637 - sprite0xr)/2)  //wait until first shot is half-way between megaman and wall to shoot again
															next_state = SHOT_2R;
													
														else if((keycode ==  16'b0000000000100000 ||keycode == 16'h0024 || keycode == 16'h0028 || keycode == 16'h0021) && m_isleft == 1'b1 && bullet1x <= (sprite0xr)/2 )
															next_state = SHOT_2L;
														else if(bullet1x >= 637 || bullet1x <= 0)
															next_state = WAIT;
													
														else
															next_state = SHOT_1L;
														end
											SHOT_2R:	begin
														if(bullet2x >= 637 || bullet2x <= 0)
															next_state = WAIT;
														else
															next_state = SHOT_2R;
														end
											SHOT_2L:	begin
														if(bullet2x >= 637 || bullet2x <= 0)
															next_state = WAIT;
														else
															next_state = SHOT_2L;
														end
										endcase
								end	
							always_ff @ (posedge frame_clk) 
								begin
									
									
									bullet1x <= sprite0xr + 10'd15;
									bullet1y <= sprite0yr + 10'd15;
									bullet2x <= sprite0xr + 10'd15;
									bullet2y <= sprite0yr + 10'd15;
									is_shot_1 <= 0;
									is_shot_2 <= 0;
										case(curr_state)
											WAIT: begin           
													bullet1x <= sprite0xr + 10'd15;   
													bullet1y <= sprite0yr + 10'd15;
													bullet2x <= sprite0xr + 10'd15;
													bullet2y <= sprite0yr + 10'd15;
													end
											SHOT_1R: begin
															bullet1x <= bullet1x + 10'd16;
															bullet1y <= bullet1y;
															if(  sprite0xr < bullet1x < 637)
															is_shot_1 <= 1;
															else
															is_shot_1 <= 0;
															
														end
											SHOT_1L: begin
															bullet1x <= bullet1x + ~10'd16 + 1'b1;
															bullet1y <= bullet1y;
															if(  0 < bullet1x < sprite0xr)
															is_shot_1 <= 1;
															else
															is_shot_1 <= 0;
														end
											SHOT_2R:	begin
														if(m_isright == 1)  
														bullet2x <= bullet2x + 10'd16;
														else if(m_isleft == 1)
														bullet2x <= bullet2x + ~10'd16 + 1'b1;
													   else
														begin
														bullet2x <= sprite0xr + 10'd15;
														bullet2y <= sprite0yr + 10'd15;
														end
															
															if(bullet1x >= 637 || bullet1x <= 0)
															begin
															is_shot_1 <= 0;
															bullet1x <= sprite0xr + 10'd15;
															bullet1y <= sprite0yr + 10'd15;
															end
															else
															begin
															is_shot_1 <= 1;
																	if(m_isright == 1)
																		begin
																		bullet1x <= bullet1x + 10'd16;
																		bullet1y <= bullet1y;
																		end
																	else if(m_isleft == 1)
																		begin
																		bullet1x <= bullet1x + ~10'd16 + 1'b1;
																		bullet1y <= bullet1y;
																		end
																	else
																		begin
																		bullet1x <= sprite0xr + 10'd15;
																		bullet1y <= sprite0yr + 10'd15;
																		end
															end
														
														if(  sprite0xr < bullet2x < 637)
															is_shot_2 <= 1;
															else
															is_shot_2 <= 0;
														if(  0 < bullet2x < sprite0xr)
															is_shot_2 <= 1;
															else
															is_shot_2 <= 0;
														end
											SHOT_2L:	begin
														   
														if(m_isright == 1)  
														bullet2x <= bullet2x + 10'd16;
														else if(m_isleft == 1)
														bullet2x <= bullet2x + ~10'd16 + 1'b1;
													   else
														begin
														bullet2x <= sprite0xr + 10'd15;
														bullet2y <= sprite0yr + 10'd15;
														end	
															
														if(bullet1x >= 637 || bullet1x <= 0)
															begin
															is_shot_1 <= 0;
															bullet1x <= sprite0xr + 10'd15;
															bullet1y <= sprite0yr + 10'd15;
															end
															else
															begin
															is_shot_1 <= 1;
																	if(m_isright == 1)
																		begin
																		bullet1x <= bullet1x + 10'd16;
																		bullet1y <= bullet1y;
																		end
																	else if(m_isleft == 1)
																		begin
																		bullet1x <= bullet1x + ~10'd16 + 1'b1;
																		bullet1y <= bullet1y;
																		end
																	else
																		begin
																		bullet1x <= sprite0xr + 10'd15;
																		bullet1y <= sprite0yr + 10'd15;
																		end
															end
														
														if(  sprite0xr < bullet2x < 637)
															is_shot_2 <= 1;
															else
															is_shot_2 <= 0;
														if(  0 < bullet2x < sprite0xr)
															is_shot_2 <= 1;
															else
															is_shot_2 <= 0;
														end
										endcase
								end	
							assign sprite12xr = bullet1x;
							assign sprite12yr = bullet1y;
							assign sprite13xr = bullet2x;
							assign sprite13yr = bullet2y;
							
endmodule
									