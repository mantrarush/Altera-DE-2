module jump( input logic [15:0] keycode,
				 input logic [9:0] sprite0xr,sprite0yr,
				 input logic frame_clk, Reset,
				 output logic [9:0] up, down,
				 output logic on_gnd

				);
				
				
				enum logic [3:0] {IDLE, UP_1,UP_2,UP_3,DOWN_1,DOWN_2,DOWN_3} curr_state,next_state;
							int cnt;
							logic clk_div;
							parameter [31:0] num = 3;
						   
							always_ff @ ( posedge frame_clk or posedge Reset)   //slow down the vga clock to actually to jump a significant distance in real time
														begin 
														if(Reset == 1'b1)
															cnt <= 0;
														else if (cnt == num -1)
														 cnt  <= 0;
														else 
														cnt <= cnt +1;
														end
							always_ff @ (posedge(frame_clk), posedge(Reset))     
													begin
														 if (Reset == 1'b1)
															  clk_div <= 1'b0;
														 else if (cnt == num - 1)
															  clk_div <= ~clk_div;
														 else
															  clk_div <= clk_div;
													end
				always_ff @(posedge clk_div or posedge Reset)
							begin
											if(Reset)
												curr_state = IDLE;         //return to ground state if upon reset
											else 
												curr_state = next_state;
							end
							
				 always_comb 
						   
									begin
										
											next_state = curr_state;
												case(curr_state) //state assignments
														IDLE: if(keycode == 16'h0001 || keycode == 16'h0005 || keycode == 16'h0009)  //wait for jump key to be pressed even if up-left or up-right pressed
																		next_state = UP_1;
																else
																next_state = IDLE;
														UP_1: begin
																if( sprite0yr > 331 && sprite0yr < 363 && sprite0xr > 296 && sprite0xr < 345)
																	next_state = IDLE;
																else
																	next_state = UP_2;      //Take three clock cycles to come up and down
																end
														UP_2: begin
																if( sprite0yr > 331 && sprite0yr < 363 && sprite0xr > 296 && sprite0xr < 345)
																	next_state = IDLE;
																else
																	next_state = UP_3;      //Take three clock cycles to come up and down
																end
														UP_3: next_state = DOWN_1;
														DOWN_1: 	begin
																	if(down < 0)
																	next_state = IDLE;
																	else
																	next_state = DOWN_2;
																	end
																	
														DOWN_2: 	begin
																	if(down <0 )
																	next_state = IDLE;
																	else
																	next_state = DOWN_3;
																	end
														DOWN_3: 	begin
																	if(down < 0)
																	next_state = IDLE;
																	else
																	next_state = IDLE;
																	end
												endcase
									end
					
					always_comb
					begin
								up = 10'b0;
								down = 10'b0;
								on_gnd = 1'b0;
								case(curr_state)
								
								IDLE: begin
										on_gnd = 1'b1;
										up = 10'b0;
										if(sprite0yr < 368 && sprite0yr!= 331  && (sprite0xr <= 296 || sprite0xr >= 345))
										down = 3;
										else if(sprite0yr > 368)
										down = -4;
										else
										down = 10'b0;
										
										end
								UP_1: begin
										down = 10'b0;
										if(sprite0yr < 368 && sprite0yr!= 331 && (sprite0xr > 296 && sprite0xr < 345))
										begin
										up = 10'd2;
										end
										else
										begin
										up = ~10'd6+1'b1;
										end
										
										end
								UP_2: begin
										down = 10'b0;
										
										if(sprite0yr < 368 && sprite0yr!= 331 && (sprite0xr > 296 && sprite0xr < 345))
										begin
										up = 10'd2;
										end
										else
										begin
										up = ~10'd6+1'b1;
										end
										
										end
								   
								UP_3: begin
										down = 10'b0;
										
										if(sprite0yr < 368 && sprite0yr!= 331 && (sprite0xr > 296 && sprite0xr < 345))
										begin
										up = 10'd2;
										end
										else
										begin
										up = ~10'd6+1'b1;
										end
										end
								
							 DOWN_1: begin
										
										up = 10'b0;
										if( sprite0yr >= 331 && sprite0yr < 363 && sprite0xr >= 296 && sprite0xr < 345)
										down = -2;
										else 
										down = 10'd6;
										end
								
							 DOWN_2: begin
										
										up = 10'b0;
										if( sprite0yr >= 331 && sprite0yr < 363 && sprite0xr >= 296 && sprite0xr < 345)
										down = -1;
										else
										down = 10'd6;
										end
								
							 DOWN_3: begin
										down = 10'd6;
										up = 10'b0;
										if( sprite0yr >= 331 && sprite0yr < 363 && sprite0xr >= 296 && sprite0xr < 345)
										down = -1;
										else
										down = 10'd6;
										end
								
								
								endcase
					end
							
endmodule
									