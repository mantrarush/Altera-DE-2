


module  lab7_usb 		( input         Clk,
                                     Reset,
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  output [8:0]  LEDG,
							  output [17:0] LEDR,
							  // VGA Interface 
                       output [7:0]  Red,
							                Green,
												 Blue,
							  output        VGA_clk,
							                sync,
												 blank,
												 vs,
												 hs,
							  // CY7C67200 Interface
							  inout [15:0]  OTG_DATA,						//	CY7C67200 Data bus 16 Bits
							  output [1:0]  OTG_ADDR,						//	CY7C67200 Address 2 Bits
							  output        OTG_CS_N,						//	CY7C67200 Chip Select
												 OTG_RD_N,						//	CY7C67200 Write
												 OTG_WR_N,						//	CY7C67200 Read
												 OTG_RST_N,						//	CY7C67200 Reset
							  input			 OTG_INT,						//	CY7C67200 Interrupt
							  // SDRAM Interface for Nios II Software
							  output [12:0] sdram_wire_addr,				// SDRAM Address 13 Bits
							  inout [31:0]  sdram_wire_dq,				// SDRAM Data 32 Bits
							  output [1:0]  sdram_wire_ba,				// SDRAM Bank Address 2 Bits
							  output [3:0]  sdram_wire_dqm,				// SDRAM Data Mast 4 Bits
							  output			 sdram_wire_ras_n,			// SDRAM Row Address Strobe
							  output			 sdram_wire_cas_n,			// SDRAM Column Address Strobe
							  output			 sdram_wire_cke,				// SDRAM Clock Enable
							  output			 sdram_wire_we_n,				// SDRAM Write Enable
							  output			 sdram_wire_cs_n,				// SDRAM Chip Select
							  output			 sdram_clk,					// SDRAM Clock
							  output [3:0]  LED                       // display direction on leds
											);
    logic [15:0] scancode;
    logic Reset_h, vssig;
    logic [9:0] drawxsig, drawysig, ballxsig0, ballysig0, ballsizesig,ballxsig1,ballysig1;
	 logic [15:0] keycode;
	 //position inputs passed from movement modules
	 logic [9:0] sprite0xr,sprite0yr,sprite1xr,sprite1yr,sprite2xr,sprite2yr,sprite3xr,sprite3yr,sprite4xr,sprite4yr,sprite5xr,sprite5yr,sprite6xr,sprite6yr,sprite7xr,sprite7yr,sprite8xr,sprite8yr,sprite9xr,sprite9yr,sprite10xr,sprite10yr,sprite11xr,sprite11yr,sprite12xr,sprite12yr,sprite13xr,sprite13yr,sprite14xr,sprite14yr,sprite15xr,sprite15yr,sprite16xr,sprite16yr,sprite33xr,sprite33yr;
    logic[9:0] ymotion,xmotion;
    assign {Reset_h}=~ (Reset);  // The push buttons are active low
	 assign OTG_FSPEED = 1'bz;
	 assign OTG_LSPEED = 1'bz;
	 initial
	 begin
	 sprite0xr = 0;
	 sprite0yr = 0;
	 sprite1xr = 0;
	 sprite1yr = 0;
	 sprite2xr = 0;
	 sprite2yr = 0;
	 sprite3xr = 0;
	 sprite3yr = 0;
	 sprite4xr = 0;
	 sprite4yr = 0;
	 sprite5xr = 0;
	 sprite5yr = 0;
	 sprite6xr = 0;
	 sprite6yr = 0;
	 sprite7xr = 0;
	 sprite7yr = 0;
	 sprite8xr = 0;
	 sprite8yr = 0;
	 sprite9xr = 0;
	 sprite9yr = 0;
	 sprite10xr = 0;
	 sprite10yr = 0;
	 sprite11xr = 0;
	 sprite11yr = 0;
	 sprite12xr = 0;
	 sprite12yr = 0;
	 sprite13xr = 0;
	 sprite13yr = 0;
	 sprite14xr = 0;
	 sprite14yr = 0;
	 sprite15xr = 0;
	 sprite15yr = 0;
	 sprite16xr = 0;
	 sprite16yr = 0;

	 end
	 always_ff @ (posedge Clk or posedge Reset_h)
				begin
					if(Reset_h)
						scancode <= 8'b0;
					else if(keycode != 8'b0)
							scancode <= keycode;
					else 
							scancode <= scancode;
					end
						
						
		 
	 usb_system usbsys_instance(
										 .clk_clk(Clk),         
										 .reset_reset_n(1'b1),   
										 .sdram_wire_addr(sdram_wire_addr), 
										 .sdram_wire_ba(sdram_wire_ba),   
										 .sdram_wire_cas_n(sdram_wire_cas_n),
										 .sdram_wire_cke(sdram_wire_cke),  
										 .sdram_wire_cs_n(sdram_wire_cs_n), 
										 .sdram_wire_dq(sdram_wire_dq),   
										 .sdram_wire_dqm(sdram_wire_dqm),  
										 .sdram_wire_ras_n(sdram_wire_ras_n),
										 .sdram_wire_we_n(sdram_wire_we_n), 
										 .sdram_out_clk_clk(sdram_clk),
										 .keycode_export(keycode),  
										 .usb_DATA(OTG_DATA),    
										 .usb_ADDR(OTG_ADDR),    
										 .usb_RD_N(OTG_RD_N),    
										 .usb_WR_N(OTG_WR_N),    
										 .usb_CS_N(OTG_CS_N),    
										 .usb_RST_N(OTG_RST_N),   
										 .usb_INT(OTG_INT) );
	
    vga_controller vgasync_instance(.*,
	                                 .Clk(Clk),
											   .Reset(Reset_h),
											   .pixel_clk(VGA_clk),
											   .DrawX(drawxsig),
								 			   .DrawY(drawysig) );

	
    /*ball ball_instance(.Reset(Reset_h),
	                    .frame_clk(vs),    // Vertical Sync used as an "ad hoc" 60 Hz clock signal//
	                    .BallX(ballxsig),  // (This is why we registered it in the vga controller!)
							  .BallY(ballysig),
							  .BallS(ballsizesig),
							  .keycode(keycode));
   
	
    color_mapper color_instance(.*,
	                             .BallX(ballxsig),
		 								  .BallY(ballysig),
		 								  .DrawX(drawxsig),
		 								  .DrawY(drawysig),
										  .Ball_size(ballsizesig) );
										  
					*/
					logic [0:7] data;
					logic [0:15] addr;
					logic[9:0] ball_size,up,down;
					
					
								
														//check which side megaman is facing 
													logic m_isright, m_isleft,enemycol,met1_col;	
													logic is_shot_1, is_shot_2,is_start,on_gnd,kill ;            //is there a shot on screen from bullet_1
													logic [2:0] curr_health;
													
														//sprite data passed from ROM file
							   logic [0:29][0:30][0:3] sprite0r;
								logic [0:15][0:7][0:3] sprite1r;
								logic [0:22][0:30][0:3] sprite2r;
								logic [0:24][0:30][0:3] sprite3r;
								logic [0:21][0:30][0:3] sprite4r;
								logic [0:22][0:30][0:3] sprite5r;
								logic [0:24][0:30][0:3] sprite6r;
								logic [0:21][0:30][0:3] sprite7r;
								logic [0:24][0:30][0:3] sprite8r;
								logic [0:27][0:30][0:3] sprite9r;
								logic [0:29][0:30][0:3] sprite10r;
								logic [0:29][0:30][0:3] sprite11r;
								logic [0:6][0:6][0:3] sprite12r;
								logic [0:6][0:6][0:3] sprite13r;
								logic [0:6][0:6][0:3] sprite14r;
								logic [0:79][0:79][0:3] sprite15r;
								logic [0:79][0:79][0:3] sprite16r;
								logic [0:79][0:79][0:3] sprite17r;
								logic [0:23][0:30][0:3] sprite18r;
								logic [0:21][0:30][0:3] sprite19r;
								logic [0:23][0:30][0:3] sprite20r;
								logic [0:21][0:30][0:3] sprite21r;
								logic [0:23][0:30][0:3] sprite22r;
								logic [0:21][0:30][0:3] sprite23r;
								logic [0:23][0:30][0:3] sprite24r;
								logic [0:21][0:30][0:3] sprite25r;
								logic [0:79][0:44][0:3] sprite26r;
								logic [0:59][0:12][0:3] sprite27r;
								logic [0:59][0:12][0:3] sprite28r;
								logic [0:59][0:12][0:3] sprite29r;
								logic [0:59][0:12][0:3] sprite30r;
								logic [0:59][0:12][0:3] sprite31r;
								logic [0:66][0:181][0:2] sprite32r;
								
								logic [0:18][0:17][0:1] sprite33r;
								logic [0:18][0:17][0:1] sprite34r;
								logic [0:18][0:17][0:1] sprite35r;
								logic [0:18][0:17][0:1] sprite36r;
								logic [0:31][0:48][0:2] sprite37r;
								logic [0:47][0:97][0:3] sprite38r;
								logic [0:15][0:7][0:3] sprite39r;
								logic [0:15][0:7][0:1]   	  sprite40r;
								logic [0:15][0:7][0:1]  	  sprite41r;
								logic [0:15][0:7][0:1]   	  sprite42r;
								logic [0:15][0:7][0:1] 		  sprite43r;
								logic [0:15][0:7][0:1]  	  sprite44r;
								logic [0:15][0:7][0:1] 		  sprite45r;
								logic [0:15][0:7][0:1]  	  sprite46r;
								logic [0:15][0:7][0:1]  	  sprite47r;
								logic [0:15][0:7][0:1] 		  sprite48r;
								logic [0:15][0:7][0:1] 		  sprite49r;
								
							  // logic sprite26r,sprite27r,sprite28r,sprite29r,sprite30r,sprite31r,sprite32r;
								
									  logic [9:0] sprite0x,sprite0y,   //position inputs passed from movement modules
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
													  sprite16x,sprite16y;
													//sprite data passed to color mapper
								logic [0:29][0:30][0:3] sprite0;
								logic [0:15][0:7][0:3] sprite1;
								logic [0:22][0:30][0:3] sprite2;
								logic [0:24][0:30][0:3] sprite3;
								logic [0:21][0:30][0:3] sprite4;
								logic [0:22][0:30][0:3] sprite5;
								logic [0:24][0:30][0:3] sprite6;
								logic [0:21][0:30][0:3] sprite7;
								logic [0:24][0:30][0:3] sprite8;
								logic [0:27][0:30][0:3] sprite9;
								logic [0:29][0:30][0:3] sprite10;
								logic [0:29][0:30][0:3] sprite11;
								logic [0:6][0:6][0:3] sprite12;
								logic [0:6][0:6][0:3] sprite13;
								logic [0:6][0:6][0:3] sprite14;
								logic [0:79][0:79][0:3] sprite15;
								logic [0:79][0:79][0:3] sprite16;
								logic [0:79][0:79][0:3] sprite17;
								logic [0:23][0:30][0:3] sprite18;
								logic [0:21][0:30][0:3] sprite19;
								logic [0:23][0:30][0:3] sprite20;
								logic [0:21][0:30][0:3] sprite21;
								logic [0:23][0:30][0:3] sprite22;
								logic [0:21][0:30][0:3] sprite23;
								logic [0:23][0:30][0:3] sprite24;
								logic [0:21][0:30][0:3] sprite25;
								logic [0:79][0:44][0:3] sprite26;
								logic [0:59][0:12][0:3] sprite27;
								logic [0:59][0:12][0:3] sprite28;
								logic [0:59][0:12][0:3] sprite29;
								logic [0:59][0:12][0:3] sprite30;
								logic [0:59][0:12][0:3] sprite31;
								logic [0:66][0:181][0:2] sprite32; 
								logic [0:18][0:17][0:1] sprite33;
								logic [0:18][0:17][0:1] sprite34;
								logic [0:18][0:17][0:1] sprite35;
								logic [0:18][0:17][0:1] sprite36;
								logic [0:31][0:48][0:2] sprite37;
								logic [0:47][0:97][0:3] sprite38;
								logic [0:15][0:7][0:3] sprite39;
								logic [0:15][0:7][0:1]      sprite40;
								logic [0:15][0:7][0:1]       sprite41;
								logic [0:15][0:7][0:1]       sprite42;
								logic [0:15][0:7][0:1]       sprite43;
								
								//logic sprite26,sprite27,sprite28,sprite29,sprite30,sprite31,sprite32;
eight eight_instance(.Reset(Reset_h),
	                    .frame_clk(vs),    // Vertical Sync used as an "ad hoc" 60 Hz clock signal//
	                    .eightx(sprite0xr),  // (This is why we registered it in the vga controller!)
							  .eighty(sprite0yr),
							  .eights(ball_size),
							  .ymotion(ymotion),
							  .xmotion(xmotion),
							  .keycode(keycode),
							 .up(up),
							 .down(down) );
ismile smile_instance(.Reset(Reset_h),
							 .frame_clk(vs),
							 .ismilex(sprite1xr),
							 .ismiley(sprite1yr),
							 .eightx(sprite0xr),
							 .eighty(sprite0yr));
							  
							  
					
color_mapper2    color_instance(.*,
										  .sprite0S(ball_size),
		 								  .DrawX(drawxsig),
		 								  .DrawY(drawysig),
										  .sprite0(sprite0),
										  .sprite1(sprite1),
										  .sprite2(sprite2),
										  .sprite33xr(sprite33xr),
										  .sprite33yr(sprite33yr),
										  .sprite33(sprite33),
										  .sprite37(sprite37)
										  
										  //.data(data),
										  //.addr(addr)
										  );
sprite_table     sprite_instance(.*,.clk(Clk),.sprite37r(sprite37r)
												//.data(data),
												//.addr(addr)
												);
gamecontrol      game_instance(.*,.frame_clk(vs),.reset(Reset_h),.ymotion(ymotion),.keycode(keycode),.curr_health(curr_health),.enemycol(enemycol),.sprite37r(sprite37r),.sprite37(sprite37));

bullet_state     bullet_state_instance(.*,.frame_clk(vs),.Reset(Reset_h));

jump 				jump_instance(.*,.Reset(Reset_h),.frame_clk(vs),.up(up),.down(down));

megahealth    m_health_instance(.*,.reset(Reset_h),.frame_clk(vs),.enemycol(enemycol),.curr_health(curr_health));

mettaur_1    met1_instance(.*,.reset(Reset_h),.frame_clk(vs),.sprite33xr(sprite33xr),.sprite33yr(sprite33yr),.sprite33(sprite33),.kill(kill));

kill_count    kill_instance(.*,.reset(Reset_h),.frame_clk(vs),.kill(kill));

	 HexDriver hex_inst_0 (scancode[3:0], HEX0);
	 HexDriver hex_inst_1 (scancode[7:4], HEX1);
	 HexDriver hex_inst_2 (scancode[11:8], HEX2);
	 HexDriver hex_inst_3 (scancode[15:12], HEX3);
    

	
endmodule
