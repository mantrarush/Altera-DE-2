module megahealth(input logic frame_clk,reset, enemycol,met1_col,
					input logic [15:0] keycode,
					output logic [2:0] curr_health);
					enum logic [2:0] {MAX_HEALTH, HIT_1,HIT_2,HIT_3, DEAD} curr_state, next_state;
					 int cnt;
					 logic clk_div;
					 always_ff @(posedge frame_clk or posedge reset)
						begin
						if(reset == 1'b1)
							cnt <= 0;
						else if( cnt == 3)
						   cnt <= 0;
						else 
							cnt <= cnt +1;
						end
					always_ff @ (posedge frame_clk or posedge reset)
						begin
						if(reset == 1'b1)
						   clk_div <= 1'b0;
						else if(cnt == 3)
							clk_div <= ~clk_div;
						else 
							clk_div <= clk_div;
						end
					 always_ff @ (posedge clk_div or posedge reset)
						begin 
						if(reset)
						 curr_state = MAX_HEALTH;
						else
						 curr_state = next_state;
						end
						
						
						 always_comb
								begin
									next_state = curr_state;
									case(curr_state)
									MAX_HEALTH:
									begin
										if( enemycol == 1'b1 || met1_col == 1'b1)
											next_state = HIT_1;
										else
											next_state = MAX_HEALTH;
									end
									HIT_1:
									begin
										if( enemycol == 1'b1 || met1_col == 1'b1)
											next_state = HIT_2;
										else
											next_state = HIT_1;
											
									end
									HIT_2:
									begin
										if( enemycol == 1'b1 || met1_col == 1'b1)
											next_state = HIT_3;
										else
											next_state = HIT_2;
									end
									HIT_3:
									begin
										if( enemycol == 1'b1 || met1_col == 1'b1)
											next_state = DEAD;
										else
											next_state = HIT_3;
									end
									DEAD:
									begin
										if(keycode == 16'h0010)
											next_state = MAX_HEALTH;
										else
											next_state = DEAD;
									end
									endcase
								end
							always_comb
								begin
									case(curr_state)
								 MAX_HEALTH: curr_health = 4;
								 HIT_1: curr_health =3;
								 HIT_2: curr_health=2;
								 HIT_3: curr_health =1;
								 DEAD: curr_health = 0;
									endcase
								end
									
					 
endmodule
