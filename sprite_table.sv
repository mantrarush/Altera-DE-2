module sprite_table( input logic clk,
							
							output logic [0:29][0:30][0:3] sprite0r,
							output logic [0:15][0:7][0:3] sprite1r,
							output logic [0:22][0:30][0:3] sprite2r,
							output logic [0:24][0:30][0:3] sprite3r,
							output logic [0:21][0:30][0:3] sprite4r,
							output logic [0:22][0:30][0:3] sprite5r,
							output logic [0:24][0:30][0:3] sprite6r,
							output logic [0:21][0:30][0:3] sprite7r,
							output logic [0:24][0:30][0:3] sprite8r,
							output logic [0:27][0:30][0:3] sprite9r,
							output logic [0:29][0:30][0:3] sprite10r,
							output logic [0:29][0:30][0:3] sprite11r,
							output logic [0:6][0:6][0:3] sprite12r,
							output logic [0:6][0:6][0:3] sprite13r,
							output logic [0:6][0:6][0:3] sprite14r,
							output logic [0:79][0:79][0:3] sprite15r,
							output logic [0:79][0:79][0:3] sprite16r,
							output logic [0:79][0:79][0:3] sprite17r,
							output logic [0:23][0:30][0:3] sprite18r,
							output logic [0:21][0:30][0:3] sprite19r,
							output logic [0:23][0:30][0:3] sprite20r,
							output logic [0:21][0:30][0:3] sprite21r,
							output logic [0:23][0:30][0:3] sprite22r,
							output logic [0:21][0:30][0:3] sprite23r,
							output logic [0:23][0:30][0:3] sprite24r,
							output logic [0:21][0:30][0:3] sprite25r,
							output logic [0:79][0:44][0:3] sprite26r,
							output logic [0:59][0:12][0:3] sprite27r,
							output logic [0:59][0:12][0:3] sprite28r,
							output logic [0:59][0:12][0:3] sprite29r,
							output logic [0:59][0:12][0:3] sprite30r,
							output logic [0:59][0:12][0:3] sprite31r,
							output logic [0:66][0:181][0:2] sprite32r, 
							output logic [0:18][0:17][0:1] sprite33r,
							output logic [0:18][0:17][0:1] sprite34r,
							output logic [0:18][0:17][0:1] sprite35r,
							output logic [0:18][0:17][0:1] sprite36r,
							output logic [0:31][0:48][0:2] sprite37r,
							output logic [0:47][0:97][0:3] sprite38r,
							output logic [0:15][0:7][0:3] sprite39r,
							output logic [0:15][0:7][0:1]      sprite40r,
							output logic [0:15][0:7][0:1]      sprite41r,
							output logic [0:15][0:7][0:1]      sprite42r,
							output logic [0:15][0:7][0:1]      sprite43r,
							output logic [0:15][0:7][0:1]      sprite44r,
							output logic [0:15][0:7][0:1]      sprite45r,
							output logic [0:15][0:7][0:1]      sprite46r,
							output logic [0:15][0:7][0:1]      sprite47r,
							output logic [0:15][0:7][0:1]      sprite48r,
							output logic [0:15][0:7][0:1]      sprite49r
							//output logic sprite26r,sprite27r,sprite28r,sprite29r,sprite30r,sprite31r,sprite32r    //to save compilation time when debugging
						 );
							parameter addr_width = 16;
							parameter data_width = 8;
							//logic [addr_width-1:0] addr_reg;
							
							
							//define colors
							parameter [3:0] c0 = 0;  //background
							parameter [3:0] c1 = 1;   //black
							parameter [3:0] c2 = 2;   // cyan
							parameter [3:0] c3 = 3; // blue
							parameter [3:0] c4 = 4;  // tanish
							parameter [3:0] c5 = 5;  // white
							parameter [3:0] c6 = 6;  // lighter green
							parameter [3:0] c7 = 7;  // poop green
							parameter [3:0] c8 = 8; //redish
							parameter [3:0] c9 = 9;
							parameter [3:0] c10 = 10;  //black
							parameter [3:0] c11 = 11;  //yellow
							parameter [3:0] c12 = 12;  //white
							//title screen colors
							parameter [2:0] c13 = 3'b001; //black
							parameter [2:0] c14 = 3'b010; //Dark Green
							parameter [2:0] c15 = 3'b011; //faded blue
							parameter [2:0] c16 = 3'b100; //maroon?
							parameter [2:0] c17 = 3'b101; //light red
							parameter [2:0] c18 = 3'b110; //white
							//mettaur colors
							parameter [1:0] c19 = 2'b00;
							parameter [1:0] c20 = 2'b01;
							parameter [1:0] c21 = 2'b10;
							parameter [1:0] c22 = 2'b11;
							//platform colors
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
							
							
							
							
							
							
							
							


		always_comb
		begin
		/*sprite26r <= 1'b0;
		sprite27r <= 1'b0;
		sprite28r <= 1'b0;
		sprite29r <= 1'b0;
		sprite30r <= 1'b0;
		sprite31r <= 1'b0;
		sprite32r <= 1'b0; */
		
		//sprite0 standing megaman
		sprite0r  <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c2, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c2, c2, c2, c2, c1, c1, c1, c1, c1, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c2, c1, c2, c2, c2, c2, c2, c2, c2, c1, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c1, c1, c1, c2, c2, c2, c2, c2, c2, c2, c1, c1, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c2, c2, c2, c2, c2, c2, c2, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c3, c3, c3, c3, c3, c3, c3, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c2, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c2, c2, c2, c1, c2, c2, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c3, c3, c3, c2, c1, c0, c1, c2, c3, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}
};

		sprite1r  <= '{
		 // code x01
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0} , // 0
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0} , // 1
    '{4'b0,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b0} , // 2  ******
    '{4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1} , // 3 ********
    '{4'b1,4'b1,4'b0,4'b1,4'b1,4'b0,4'b1,4'b1} , // 4 ** ** **
    '{4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1} , // 5 ********
    '{4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1} , // 6 ********
    '{4'b1,4'b1,4'b0,4'b0,4'b0,4'b0,4'b1,4'b1} , // 7 **    **
    '{4'b1,4'b1,4'b1,4'b0,4'b0,4'b1,4'b1,4'b1} , // 8 ***  ***
    '{4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1} , // 9 ********
    '{4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1} , // a ********
    '{4'b0,4'b1,4'b1,4'b1,4'b1,4'b1,4'b1,4'b0} , // b  ******
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0} , // c
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0} , // d
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0} , // e
    '{4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0,4'b0}  // f
	 };
	 
	 //megaman running left 1
		sprite2r  <= 
		'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c4, c5, c4, c5, c5, c5, c4, c4, c1, c2, c2, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c4, c1, c1, c1, c1, c4, c2, c2, c1, c2, c2, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c4, c4, c4, c3, c2, c2, c2, c2, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c1, c1, c1, c2, c2, c2, c2, c2, c1, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c3, c2, c2, c3, c1, c2, c3, c1, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c3, c2, c3, c1, c2, c3, c3, c1, c1, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c1, c1, c1, c1, c1, c3, c3, c3, c3, c2, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c2, c2, c2, c1, c1, c1, c2, c2, c2, c3, c3, c1, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c1, c2, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman running left 2
		sprite3r  <= 
		'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c4, c4, c4, c4, c4, c1, c2, c2, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c1, c2, c2, c2, c2, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c1, c2, c2, c1, c3, c3, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c1, c1, c3, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c1, c3, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c1, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c2, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman running left 3
		sprite4r  <= 
		'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c2, c2, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c2, c2, c1, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c1, c3, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c2, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c1, c0, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c1, c0, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c2, c2, c2, c1, c1, c1, c1, c1, c2, c2, c2, c3, c1, c0, c0, c1, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c2, c2, c1, c2, c2, c2, c2, c2, c3, c3, c3, c1, c0, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c2, c1, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c1, c2, c2, c2, c3, c3, c1, c1, c3, c3, c3, c3, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c3, c1, c1, c2, c3, c3, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c2, c1, c1, c2, c2, c2, c3, c3, c1, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c1, c2, c2, c3, c1, c1, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman running right 1
		sprite5r  <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c2, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c2, c2, c2, c1, c4, c4, c5, c5, c5, c4, c5, c4, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c3, c2, c2, c1, c2, c2, c4, c1, c1, c1, c1, c4, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c1, c1, c1, c2, c2, c2, c2, c3, c4, c4, c4, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c1, c0, c1, c2, c2, c2, c2, c2, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c0, c1, c3, c2, c1, c3, c2, c2, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c1, c1, c1, c3, c3, c2, c1, c3, c2, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c3, c1, c2, c3, c3, c3, c3, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c1, c3, c3, c2, c2, c2, c1, c1, c1, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c1, c3, c3, c2, c1, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman running right 2
		sprite6r  <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c2, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c2, c2, c2, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c2, c2, c2, c1, c2, c2, c1, c4, c4, c4, c4, c4, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c3, c1, c1, c2, c2, c2, c2, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c1, c3, c3, c1, c2, c2, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c1, c3, c1, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c2, c2, c1, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c2, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman running right 3
		sprite7r  <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c2, c2, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c1, c2, c2, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c1, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c1, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c3, c1, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c1, c3, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c0, c1, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c2, c1, c3, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c0, c1, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c1, c1, c3, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c0, c0, c1, c3, c2, c2, c2, c1, c1, c1, c1, c1, c2, c2, c2, c3, c3, c3, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c0, c1, c3, c3, c3, c2, c2, c2, c2, c2, c1, c2, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c1, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c1, c1, c3, c3, c2, c2, c2, c1, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c3, c3, c2, c1, c1, c3, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c1, c3, c3, c2, c2, c2, c1, c1, c2, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c1, c3, c2, c2, c1, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c1, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megaman standing left
		sprite8r  <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c2, c2, c1, c1, c1, c1, c1, c2, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c2, c1, c2, c2, c2, c2, c2, c2, c2, c1, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c1, c1, c1, c2, c2, c2, c2, c2, c2, c2, c1, c1, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c2, c2, c2, c2, c2, c2, c2, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c1, c1, c3, c3, c3, c3, c3, c3, c3, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c2, c2, c2, c2, c1, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c3, c3, c3, c2, c1, c0, c1, c2, c3, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};		
		//megman hurt
		sprite9r  <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c1, c2, c3, c3, c4, c4, c4, c4, c3, c3, c4, c1, c1, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c2, c2, c1, c2, c3, c4, c4, c4, c4, c4, c4, c4, c4, c1, c2, c2, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c2, c2, c2, c1, c3, c4, c4, c1, c1, c1, c4, c1, c1, c1, c2, c2, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c2, c2, c2, c1, c3, c4, c4, c4, c4, c4, c4, c4, c4, c1, c2, c2, c3, c3, c3, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c3, c1, c1, c2, c2, c1, c3, c4, c4, c1, c1, c1, c4, c1, c2, c1, c1, c3, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c0, c0, c1, c2, c2, c1, c4, c1, c1, c1, c1, c1, c2, c1, c0, c0, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c0, c0, c1, c2, c2, c2, c1, c4, c1, c1, c1, c2, c2, c1, c0, c0, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c1, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c1, c1, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c2, c1, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};
//megman jump right
		sprite10r <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c1, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c1, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c3, c3, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c3, c3, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c1, c1, c1, c3, c3, c3, c1, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c1, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c2, c2, c1, c3, c2, c2, c2, c1, c2, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c2, c2, c1, c3, c4, c4, c1, c1, c1, c4, c1, c2, c2, c2, c1, c3, c3, c3, c3, c1, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c2, c2, c1, c4, c1, c1, c1, c1, c1, c2, c2, c2, c2, c1, c3, c3, c3, c1, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c2, c2, c2, c1, c4, c1, c1, c1, c2, c2, c1, c1, c1, c0, c1, c1, c1, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c2, c1, c1, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c1, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c3, c1, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};		
//megaman jump left
		sprite11r <= 
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c1, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c1, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c1, c3, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c1, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c3, c3, c3, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c3, c3, c3, c1, c1, c1, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c3, c3, c1, c0, c0 , c0, c0, c0, c0, c0},
'{c2, c1, c2, c2, c2, c3, c1, c2, c2, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c1, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c3, c1, c3, c3, c3, c3, c1, c2, c2, c2, c1, c4, c1, c1, c1, c4, c4, c3, c1, c2, c2, c1, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c1, c1, c1, c3, c3, c3, c1, c2, c2, c2, c2, c1, c1, c1, c1, c1, c4, c1, c2, c2, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c1, c0, c1, c1, c1, c2, c2, c1, c1, c1, c4, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c2, c2, c2, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c2, c2, c2, c3, c3, c3, c3, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c1, c1, c1, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c1, c3, c2, c2, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c1, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0 , c0, c0, c0, c0, c0}

};		
//bullet_1 sprite
		sprite12r <= 
'{
'{c0, c0, c1, c1, c1, c0, c0 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c9, c9, c9, c9, c1 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c0, c0, c1, c1, c1, c0, c0 }

};
//bullet_2 sprite
		sprite13r <= 
'{
'{c0, c0, c1, c1, c1, c0, c0 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c9, c9, c9, c9, c1 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c0, c0, c1, c1, c1, c0, c0 }

};
//bullet_3 sprite
		sprite14r <= 
'{
'{c0, c0, c1, c1, c1, c0, c0 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c5, c5, c9, c9, c1 },
'{c1, c9, c9, c9, c9, c9, c1 },
'{c0, c1, c9, c9, c9, c1, c0 },
'{c0, c0, c1, c1, c1, c0, c0 }

};
		sprite15r <= 
		'{
'{c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c7, c7, c8, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c8, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c6, c6, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1}

};
		sprite16r <=
'{
'{c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c7, c7, c8, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c8, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c6, c6, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1}

};

sprite17r <=
'{
'{c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c7, c7, c8, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c8, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c1, c1, c6, c8, c8, c8, c8, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c7, c7, c7, c1, c1, c6, c6, c6, c1, c1, c6, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c6, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c1, c1, c7, c7, c7, c7, c7, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c7, c7, c7, c6, c6, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1}

};
// megaman stand shoot left
sprite18r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c2, c2, c1, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c1, c1, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c2, c2, c2, c3, c1, c0, c0, c0},
'{c1, c2, c1, c2, c2, c2, c3, c1, c2, c2, c1, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c1, c2, c3, c3, c3, c1, c0, c0, c0},
'{c1, c3, c1, c3, c3, c3, c3, c1, c2, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c1, c3, c1, c3, c3, c3, c1, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c2, c2, c2, c2, c2, c1, c1, c1, c1, c1, c2, c2, c1, c3, c3, c1, c3, c3, c1, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c1, c1, c1, c1, c1, c2, c2, c2, c2, c2, c2, c2, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c2, c2, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c3, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c2, c2, c2, c1, c1, c2, c2, c2, c2, c3, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c1, c2, c2, c3, c3, c3, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c1, c1, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1}

};
// megaman shoot left 1
sprite19r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c2, c2, c1, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c2, c2, c1, c3, c1, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c1, c1, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0},
'{c1, c2, c1, c2, c2, c2, c3, c1, c2, c2, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c1, c3, c3, c3, c3, c1, c0, c0},
'{c1, c3, c1, c3, c3, c3, c3, c1, c2, c2, c2, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c1, c0, c1, c3, c3, c3, c1, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c2, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c1, c0, c1, c3, c3, c3, c1, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c1, c1, c1, c1, c3, c1, c1, c1, c1, c1, c2, c2, c2, c3, c1, c0, c0, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c3, c3, c3, c1, c0, c1, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c3, c1, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c3, c1, c1, c2, c3, c3, c3, c3, c3, c1, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c2, c1, c1, c2, c2, c2, c3, c3, c1, c3, c3, c1, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c1, c2, c2, c3, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megaman shoot left 2
sprite20r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c1, c1, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0},
'{c1, c2, c1, c2, c2, c2, c3, c1, c2, c2, c1, c4, c5, c4, c5, c5, c5, c4, c4, c3, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0},
'{c1, c3, c1, c3, c3, c3, c3, c1, c2, c2, c2, c1, c4, c1, c1, c1, c1, c4, c3, c1, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c2, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c1, c2, c2, c2, c1, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c1, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c3, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c1, c3, c1, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c1, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c2, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megaman shoot left 3
sprite21r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c2, c2, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c5, c3, c3, c5, c5, c5, c4, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c0, c0, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c1, c1, c1, c5, c1, c4, c1, c1, c5, c5, c4, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c1, c2, c1, c2, c2, c2, c3, c1, c2, c2, c1, c4, c5, c4, c5, c5, c5, c4, c4, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c1, c3, c1, c3, c3, c3, c3, c1, c2, c2, c2, c1, c4, c1, c1, c1, c1, c4, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c1, c1, c3, c3, c3, c1, c2, c2, c1, c1, c1, c4, c4, c4, c3, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c0, c1, c1, c3, c3, c3, c1, c1, c1, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c2, c2, c3, c1, c2, c3, c1, c0, c0, c1, c1, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c2, c3, c1, c2, c3, c3, c1, c1, c1, c3, c3, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c3, c3, c3, c3, c2, c1, c3, c3, c3, c3, c1, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c3, c3, c1, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c2, c2, c2, c1, c1, c1, c2, c2, c2, c3, c3, c1, c3, c3, c1, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c1, c2, c3, c3, c1, c1, c1, c1, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c3, c3, c3, c1, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megaman  stand shoot right
sprite22r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c2, c2, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c1, c3, c2, c2, c2, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c1, c1, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c1, c3, c3, c3, c2, c1, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c1, c2, c2, c1, c3, c2, c2, c2, c1, c2, c1},
'{c0, c0, c0, c1, c3, c3, c3, c1, c3, c1, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c2, c1, c3, c3, c3, c3, c1, c3, c1},
'{c0, c0, c0, c0, c1, c3, c3, c1, c3, c3, c1, c2, c2, c1, c1, c1, c1, c1, c2, c2, c2, c2, c2, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c2, c2, c2, c2, c2, c2, c2, c1, c1, c1, c1, c1, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c1, c2, c2, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c3, c3, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c3, c2, c2, c2, c2, c1, c1, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c3, c3, c3, c2, c2, c1, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c1, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megaman shoot right 1
sprite23r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c2, c2, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c1, c2, c2, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c1, c1, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c1, c3, c3, c3, c3, c1, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c2, c2, c1, c3, c2, c2, c2, c1, c2, c1},
'{c0, c0, c1, c3, c3, c3, c1, c0, c1, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c2, c2, c2, c1, c3, c3, c3, c3, c1, c3, c1},
'{c0, c0, c1, c3, c3, c3, c1, c0, c1, c2, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c2, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c1, c1, c1, c0, c0, c1, c3, c2, c2, c2, c1, c1, c1, c1, c1, c3, c1, c1, c1, c1, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c1, c1, c0, c1, c3, c3, c3, c2, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c1, c3, c3, c1, c1, c3, c3, c3, c3, c3, c3, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c3, c3, c1, c1, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c3, c3, c2, c1, c1, c3, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c1, c3, c3, c2, c2, c2, c1, c1, c2, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c1, c1, c1, c3, c2, c2, c1, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megaman shoot right 2
sprite24r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c1, c1, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c1, c3, c4, c4, c5, c5, c5, c4, c5, c4, c1, c2, c2, c1, c3, c2, c2, c2, c1, c2, c1},
'{c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c1, c3, c4, c1, c1, c1, c1, c4, c1, c2, c2, c2, c1, c3, c3, c3, c3, c1, c3, c1},
'{c0, c0, c0, c0, c0, c1, c2, c2, c2, c1, c2, c2, c1, c4, c4, c4, c4, c4, c1, c2, c2, c2, c2, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c1, c2, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c1, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c1, c3, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c1, c3, c1, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c2, c2, c1, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c2, c2, c2, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};
//megman shoot right 3
sprite25r <=
'{
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c1, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c1, c2, c2, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c3, c3, c3, c3, c1, c1, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c3, c4, c5, c5, c5, c3, c3, c5, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c0, c0, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c4, c5, c5, c1, c1, c4, c1, c5, c1, c1, c1, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c4, c4, c5, c5, c5, c4, c5, c4, c1, c2, c2, c1, c3, c2, c2, c2, c1, c2, c1},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c4, c1, c1, c1, c1, c4, c1, c2, c2, c2, c1, c3, c3, c3, c3, c1, c3, c1},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c3, c4, c4, c4, c1, c1, c1, c2, c2, c1, c3, c3, c3, c1, c1, c1, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c2, c2, c2, c2, c2, c1, c1, c1, c3, c3, c3, c1, c1, c0, c1, c1, c1, c1, c0, c0, c0},
'{c0, c0, c0, c0, c1, c1, c0, c0, c1, c3, c2, c1, c3, c2, c2, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c1, c3, c3, c1, c1, c1, c3, c3, c2, c1, c3, c2, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c1, c3, c3, c3, c3, c1, c2, c3, c3, c3, c3, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c3, c3, c3, c2, c2, c2, c3, c3, c3, c3, c2, c2, c2, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c1, c3, c3, c1, c3, c3, c2, c2, c2, c1, c1, c1, c2, c2, c2, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c1, c1, c1, c1, c3, c3, c2, c1, c0, c0, c0, c1, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c1, c1, c1, c0, c0, c0, c0, c1, c3, c3, c3, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c3, c3, c3, c3, c3, c3, c3, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0},
'{c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0, c1, c1, c1, c1, c1, c1, c1, c1, c1, c0, c0, c0, c0, c0, c0, c0, c0, c0, c0}

};

//bottom level blocks small

sprite26r <=
'{
'{c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c1, c1, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c6, c7, c7, c8, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7, c7, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c8, c6, c6, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c6, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c7, c6, c6, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c8, c6, c1, c6, c7, c7, c6, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c8, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c7, c7, c7, c1, c1, c1, c1, c1, c1, c1, c6, c7, c7, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c8, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c6, c6, c7, c8, c8, c8, c8, c8, c7, c7, c1, c1, c6, c7, c7, c7},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c6, c6, c6, c7, c7, c8, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c8, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c1, c1, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c8, c6, c6, c6, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c7, c7, c6, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c6, c1, c6, c6, c6, c6, c1, c6, c7, c7, c7, c6, c6, c1, c1, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6, c6},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c1, c1, c6, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c6, c6, c6, c6, c6, c7, c7, c7, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c1, c1, c6, c6, c6, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c1, c1, c6, c6, c6, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7, c7},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1},
'{c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1, c1}

};
//full health bar sprite
sprite27r <=
'{
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10}

};
//health bar first hit
sprite28r <=
'{
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10}

};
//health bar 2nd hit
sprite29r <=
'{
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10}

};
//health bar 3rd hit
sprite30r <=
'{
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c11, c11, c11, c12, c12, c12, c12, c11, c11, c11, c11, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10}

};

//health bar death
sprite31r <=
'{
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10},
'{c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10, c10}

};

// title screen
sprite32r <=
'{
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c16, c16, c16, c16, c16, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c16, c16, c16, c16, c16, c13, c13, c13, c13, c13, c13, c18, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c13, c18, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c13, c13, c13, c13, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c18, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c16, c16, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c18, c16, c16, c16, c16, c16, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c16, c16, c16, c16, c16, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c16, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c18, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c18, c18, c18, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c18, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c18, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c18, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c18, c18, c18, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c18, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c17, c17, c17, c17, c18, c13, c13, c13, c13, c18, c17, c17, c17, c17, c17, c17, c17, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c18, c16, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c18, c18, c18, c14, c18, c14, c18, c18, c18, c18, c18, c14, c18, c18, c14, c18, c18, c14, c18, c18, c14, c18, c18, c18, c18, c18, c18, c18, c14, c18, c13, c13, c13, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c13, c18, c14, c18, c18, c18, c18, c18, c14, c18, c13, c18, c14, c18, c18, c18, c18, c18, c14, c18, c14, c14, c14, c14, c18, c14, c18, c18, c18, c14, c18, c14, c14, c13, c13, c18, c14, c18, c18, c18, c18, c18, c18, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c18, c14, c14, c14, c14, c14, c14, c14, c18, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c18, c14, c14, c14, c14, c18, c14, c14, c14, c14, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c18, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c15, c14, c18, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c18, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c18, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c18, c15, c15, c15, c15, c18, c18, c18, c18, c18, c18, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c18, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c13, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c18, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c14, c18, c15, c15, c18, c18, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c18, c15, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c18, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c15, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c13, c13, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c15, c18, c18, c15, c14, c18, c13, c13, c13, c13, c14, c18, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c18, c18, c13, c13, c14, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c14, c14, c14, c13, c13, c13, c13, c18, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c15, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c13, c13, c13, c14, c14, c14, c14, c18, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c14, c14, c14, c14, c14, c14, c18, c18, c18, c14, c15, c18, c18, c18, c18, c18, c18, c14, c18, c18, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c13, c14, c14, c18, c15, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c13, c13, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c15, c14, c14, c14, c14, c13, c13, c14, c14, c14, c14, c15, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c15, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c18, c13, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c13, c13, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c13, c13, c13, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c15, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c15, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c18, c13, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c18, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c14, c14, c14, c13, c13, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c14, c14, c14, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c15, c18, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13},
'{c13, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13},
'{c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13},
'{c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c18, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c14, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c18, c13, c18, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c18, c13, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c18, c18, c18, c18, c18, c13, c18, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c18, c18, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13},
'{c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c18, c18, c18, c18, c18, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c18, c18, c18, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c18, c18, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13, c13}

};

//mettaur_1L 
sprite33r <=
'{
'{c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21},
'{c21, c21, c21, c21, c19, c19, c20, c20, c20, c20, c20, c20, c19, c19, c21, c21, c21, c21},
'{c21, c21, c21, c19, c20, c22, c22, c22, c20, c20, c20, c20, c20, c20, c19, c21, c21, c21},
'{c21, c21, c19, c20, c22, c22, c22, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21, c21},
'{c21, c21, c19, c20, c22, c22, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21, c21},
'{c21, c19, c20, c20, c20, c20, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c19, c19, c20, c19, c19, c19, c20, c19, c19, c19, c19, c19, c19, c19, c19, c21},
'{c21, c19, c20, c20, c20, c20, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19},
'{c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19},
'{c21, c21, c19, c22, c19, c19, c22, c19, c22, c19, c19, c22, c22, c19, c19, c19, c21, c21},
'{c21, c21, c19, c22, c22, c22, c22, c19, c22, c22, c22, c22, c22, c19, c20, c22, c19, c21},
'{c21, c21, c21, c19, c22, c22, c19, c19, c19, c22, c22, c22, c19, c19, c19, c19, c19, c21},
'{c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c20, c20, c20, c19, c21, c21},
'{c21, c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c20, c20, c22, c22, c20, c19, c21},
'{c21, c21, c19, c20, c22, c20, c19, c19, c19, c19, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c19, c19, c19, c19, c19, c19, c19, c19, c19, c21},
'{c21, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21, c21, c21, c21}

};
//mettuar_2L
sprite34r <=
'{
'{c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21},
'{c21, c21, c21, c21, c19, c19, c20, c20, c20, c20, c20, c20, c19, c19, c21, c21, c21, c21},
'{c21, c21, c21, c19, c20, c22, c22, c22, c20, c20, c20, c20, c20, c20, c19, c21, c21, c21},
'{c21, c21, c19, c20, c22, c22, c22, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21, c21},
'{c21, c21, c19, c20, c22, c22, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21, c21},
'{c21, c19, c20, c20, c20, c20, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c19, c19, c20, c19, c19, c19, c20, c19, c19, c19, c19, c19, c19, c19, c19, c21},
'{c21, c19, c20, c20, c20, c20, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19},
'{c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19},
'{c21, c21, c19, c22, c19, c19, c22, c19, c22, c19, c19, c22, c22, c19, c19, c19, c21, c21},
'{c21, c21, c19, c22, c22, c22, c22, c19, c22, c22, c22, c22, c22, c19, c20, c22, c19, c21},
'{c21, c21, c21, c19, c22, c22, c19, c19, c19, c22, c22, c22, c19, c19, c20, c22, c19, c21},
'{c21, c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21},
'{c21, c21, c19, c22, c20, c19, c19, c19, c19, c19, c19, c19, c20, c20, c20, c19, c21, c21},
'{c21, c19, c20, c20, c20, c20, c20, c19, c19, c19, c19, c20, c20, c22, c22, c20, c19, c21},
'{c21, c19, c19, c19, c19, c19, c19, c21, c21, c19, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c21, c21, c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c21}

};
//mettaur_1R
sprite35r <=
'{
'{c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21},
'{c21, c21, c21, c21, c19, c19, c20, c20, c20, c20, c20, c20, c19, c19, c21, c21, c21, c21},
'{c21, c21, c21, c19, c20, c20, c20, c20, c20, c20, c22, c22, c22, c20, c19, c21, c21, c21},
'{c21, c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c22, c22, c22, c20, c19, c21, c21},
'{c21, c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c22, c22, c20, c19, c21, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c20, c20, c20, c20, c19, c21},
'{c21, c19, c19, c19, c19, c19, c19, c19, c19, c20, c19, c19, c19, c20, c19, c19, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19},
'{c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19},
'{c21, c21, c19, c19, c19, c22, c22, c19, c19, c22, c19, c22, c19, c19, c22, c19, c21, c21},
'{c21, c19, c22, c20, c19, c22, c22, c22, c22, c22, c19, c22, c22, c22, c22, c19, c21, c21},
'{c21, c19, c19, c19, c19, c19, c22, c22, c22, c19, c19, c19, c22, c22, c19, c21, c21, c21},
'{c21, c21, c19, c20, c20, c20, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21},
'{c21, c19, c20, c22, c22, c20, c20, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c19, c19, c19, c19, c20, c22, c20, c19, c21, c21},
'{c21, c19, c19, c19, c19, c19, c19, c19, c19, c19, c20, c20, c20, c20, c20, c20, c19, c21},
'{c21, c21, c21, c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c21}

};
//mettaur 2R
sprite36r <=
'{
'{c21, c21, c21, c21, c21, c21, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21},
'{c21, c21, c21, c21, c19, c19, c20, c20, c20, c20, c20, c20, c19, c19, c21, c21, c21, c21},
'{c21, c21, c21, c19, c20, c20, c20, c20, c20, c20, c22, c22, c22, c20, c19, c21, c21, c21},
'{c21, c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c22, c22, c22, c20, c19, c21, c21},
'{c21, c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c22, c22, c20, c19, c21, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c20, c20, c20, c20, c19, c21},
'{c21, c19, c19, c19, c19, c19, c19, c19, c19, c20, c19, c19, c19, c20, c19, c19, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19, c21},
'{c19, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c20, c19},
'{c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19},
'{c21, c21, c19, c19, c19, c22, c22, c19, c19, c22, c19, c22, c19, c19, c22, c19, c21, c21},
'{c21, c19, c22, c20, c19, c22, c22, c22, c22, c22, c19, c22, c22, c22, c22, c19, c21, c21},
'{c21, c19, c22, c20, c19, c19, c22, c22, c22, c19, c19, c19, c22, c22, c19, c21, c21, c21},
'{c21, c21, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21, c21},
'{c21, c21, c19, c20, c20, c20, c19, c19, c19, c19, c19, c19, c19, c20, c22, c19, c21, c21},
'{c21, c19, c20, c22, c22, c20, c20, c19, c19, c19, c19, c20, c20, c20, c20, c20, c19, c21},
'{c21, c19, c20, c20, c20, c20, c20, c20, c19, c21, c21, c19, c19, c19, c19, c19, c19, c21},
'{c21, c19, c19, c19, c19, c19, c19, c19, c19, c21, c21, c21, c21, c21, c21, c21, c21, c21}

};
//platform
sprite37r <= 

'{
'{c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25},
'{c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23},
'{c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c24, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23, c23, c23, c27, c27, c27, c27, c27, c27, c27, c23},
'{c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23},
'{c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23, c23},
'{c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25},
'{c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25},
'{c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25, c25},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26},
'{c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26, c26}

};
// wily castle back ground
sprite38r <=
'{
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c28, c31, c31, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c34, c38, c36, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c38, c31, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c34, c37, c37, c37, c36, c28, c28, c28, c28, c28, c31, c38, c37, c37, c37, c37, c34, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c34, c37, c37, c37, c37, c37, c36, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c30, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c31, c32, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c36, c28, c28, c28, c28, c28, c37, c37, c37, c31, c28, c32, c37, c32, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c34, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c31, c38, c38, c31, c28, c28, c28, c28, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c28, c28, c28, c37, c37, c37, c28, c37, c37, c37, c38, c30, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c38, c33, c28, c28, c28, c28, c28, c28, c33, c37, c38, c37, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c28, c28, c28, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c28, c28, c37, c37, c33, c28, c37, c37, c37, c38, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c37, c31, c28, c28, c28, c31, c37, c38, c37, c37, c37, c38, c32, c28, c28, c28, c28, c33, c37, c37, c37, c37, c34, c28, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c28, c37, c37, c33, c28, c37, c37, c37, c31, c28, c28, c31, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c33, c28, c37, c37, c37, c37, c37, c37, c37, c37, c31, c28, c28, c28, c28, c37, c37, c37, c37, c37, c37, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c36, c37, c34, c28, c38, c37, c33, c28, c37, c37, c34, c28, c33, c37, c38, c32, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c33, c37, c37, c37, c37, c37, c37, c37, c37, c31, c28, c28, c28, c33, c38, c37, c37, c37, c37, c37, c36, c28, c36, c38, c37, c37, c37, c32, c33, c33, c33, c33, c33, c33, c33, c37, c38, c36, c33, c33, c33, c31, c39, c33, c28, c37, c37, c33, c30, c38, c37, c37, c37, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c31, c33, c38, c33, c37, c37, c37, c37, c37, c37, c37, c31, c28, c28, c28, c33, c33, c32, c32, c32, c32, c33, c34, c34, c37, c31, c31, c31, c32, c37, c37, c37, c37, c37, c37, c34, c31, c28, c28, c30, c32, c37, c33, c33, c31, c33, c28, c37, c37, c32, c30, c37, c37, c37, c33, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c33, c37, c33, c31, c37, c28, c37, c37, c37, c28, c28, c28, c28, c31, c38, c37, c37, c37, c37, c37, c31, c30, c34, c36, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c38, c38, c39, c34, c33, c28, c28, c32, c28, c31, c30, c37, c37, c32, c30, c37, c37, c33, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c34, c38, c37, c28, c36, c37, c37, c33, c28, c28, c28, c37, c33, c38, c37, c37, c37, c37, c37, c36, c31, c36, c34, c37, c37, c37, c37, c37, c37, c37, c37, c33, c33, c33, c33, c32, c33, c33, c31, c28, c28, c28, c32, c28, c37, c37, c32, c30, c38, c36, c32, c28, c28, c28, c28, c28, c28, c28, c28, c28, c34, c31, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c37, c37, c37, c37, c33, c38, c31, c36, c37, c37, c38, c28, c28, c28, c37, c38, c32, c33, c33, c37, c37, c37, c37, c37, c34, c36, c37, c37, c37, c37, c37, c37, c37, c37, c34, c33, c33, c33, c36, c38, c38, c38, c37, c37, c34, c28, c33, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c34, c31, c36, c37, c37, c37, c37, c28, c28, c30, c33, c33, c33, c37, c33, c37, c37, c37, c37, c37, c36, c31, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c33, c33, c37, c37, c38, c33, c33, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c31, c38, c37, c37, c37, c32, c33, c37, c37, c37, c37, c37, c28, c37, c37, c28, c28, c28, c38, c37, c37, c33, c37, c37, c37, c33, c31, c31, c33, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c34, c31, c28, c34, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c28, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c37, c37, c37, c37, c36, c37, c37, c37, c37, c33, c37, c32, c28, c37, c28, c28, c33, c38, c37, c37, c31, c33, c32, c33, c36, c36, c36, c33, c32, c33, c37, c37, c37, c37, c37, c33, c31, c32, c36, c36, c36, c34, c36, c33, c28, c28, c28, c34, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c33, c37, c38, c30, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c38, c37, c37, c37, c37, c37, c38, c33, c28, c33, c37, c33, c36, c33, c28, c28, c37, c33, c33, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c34, c32, c34, c38, c37, c37, c37, c37, c33, c33, c33, c37, c38, c37, c38, c37, c31, c34, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c33, c37, c37, c30, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c32, c37, c37, c37, c33, c32, c33, c37, c31, c32, c28, c34, c28, c28, c28, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c28, c36, c38, c37, c37, c38, c37, c37, c36, c33, c33, c37, c38, c31, c33, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c28, c36, c37, c37, c32, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c36, c38, c37, c37, c37, c33, c33, c33, c33, c33, c37, c36, c32, c31, c36, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c38, c28, c28, c37, c32, c33, c33, c33, c33, c33, c37, c33, c31, c28, c34, c28, c37, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c30, c38, c37, c37, c37, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c37, c38, c37, c33, c37, c36, c37, c37, c38, c38, c37, c37, c34, c33, c32, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c28, c30, c37, c37, c38, c37, c36, c31, c31, c31, c28, c32, c28, c36, c37, c32, c30, c38, c33, c33, c28, c28, c28, c28, c28, c28, c28, c33, c37, c37, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c33, c37, c37, c33, c34, c33, c33, c32, c33, c36, c38, c37, c28, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c31, c28, c28, c28, c28, c33, c31, c37, c37, c37, c37, c37, c37, c37, c37, c32, c32, c28, c39, c33, c33, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c37, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c37, c37, c37, c32, c32, c37, c37, c37, c37, c38, c37, c37, c31, c28, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c31, c28, c28, c28, c37, c38, c38, c37, c33, c33, c33, c33, c37, c37, c37, c37, c37, c37, c32, c30, c33, c28, c28, c28, c28, c28, c28, c33, c38, c37, c37, c37, c37, c39, c30, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c38, c37, c37, c37, c37, c37, c37, c33, c38, c33, c33, c33, c33, c31, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c34, c36, c37, c33, c31, c28, c36, c38, c37, c36, c28, c31, c33, c33, c33, c33, c37, c37, c37, c37, c37, c37, c37, c38, c30, c28, c28, c28, c28, c28, c28, c37, c32, c33, c31, c30, c33, c32, c37, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c34, c37, c37, c36, c37, c37, c38, c37, c37, c37, c37, c39, c28, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c36, c34, c33, c28, c28, c38, c37, c33, c31, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c38, c36, c28, c28, c28, c28, c31, c36, c34, c37, c33, c33, c37, c37, c33, c30, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c38, c32, c37, c33, c34, c36, c33, c33, c33, c33, c37, c33, c31, c32, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c31, c31, c30, c33, c36, c37, c37, c37, c37, c37, c33, c37, c28, c28, c38, c37, c37, c37, c37, c37, c38, c38, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c31, c31, c31, c31, c31, c33, c33, c28, c34, c32, c31, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c31, c37, c36, c37, c37, c37, c37, c38, c33, c33, c33, c33, c31, c28, c37, c37, c38, c37, c31, c37, c37, c37, c37, c37, c37, c38, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c36, c31, c28, c38, c37, c37, c38, c37, c32, c28, c28, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c38, c38, c38, c38, c37, c31, c37, c37, c37, c37, c28, c28, c31, c30, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c37, c37, c37, c37, c36, c31, c38, c38, c32, c37, c33, c38, c37, c38, c30, c28, c28, c31, c37, c37, c37, c37, c37, c33, c28, c28, c28, c28, c28, c28, c28, c31, c37, c37, c37, c37, c33, c33, c28, c38, c37, c37, c28, c30, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c36, c38, c37, c31, c33, c32, c32, c32, c33, c32, c37, c37, c37, c38, c28, c28, c32, c30, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c37, c37, c36, c36, c38, c31, c33, c33, c28, c30, c38, c37, c37, c30, c28, c28, c28, c32, c37, c37, c37, c37, c37, c33, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c34, c33, c28, c38, c37, c37, c37, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c34, c28, c31, c37, c37, c38, c38, c38, c38, c38, c32, c37, c37, c36, c37, c28, c32, c32, c30, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c30, c37, c28, c28, c28, c28, c28, c28, c28, c33, c37, c37, c34, c33, c31, c37, c36, c33, c31, c37, c37, c37, c31, c28, c28, c28, c28, c37, c37, c37, c37, c37, c37, c33, c28, c28, c28, c28, c28, c28, c28, c28, c31, c37, c37, c37, c33, c33, c28, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c34, c28, c28, c37, c28, c31, c31, c31, c31, c36, c28, c37, c32, c37, c33, c28, c30, c31, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c28, c28, c28, c28, c28, c28, c33, c37, c37, c38, c37, c31, c33, c34, c31, c32, c37, c37, c37, c29, c28, c28, c28, c30, c37, c37, c37, c37, c37, c37, c37, c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c36, c37, c33, c28, c38, c37, c37, c37, c31, c30, c37, c37, c37, c33, c37, c37, c37, c37, c37, c37, c34, c28, c28, c37, c31, c28, c28, c28, c28, c28, c32, c37, c37, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c30, c33, c28, c28, c28, c33, c38, c37, c31, c32, c33, c33, c29, c31, c32, c37, c37, c37, c29, c28, c28, c28, c33, c37, c37, c37, c37, c37, c37, c37, c34, c28, c28, c28, c28, c28, c28, c28, c28, c38, c37, c33, c37, c31, c33, c37, c37, c37, c32, c32, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c30, c37, c28, c36, c33, c28, c28, c28, c32, c37, c37, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c39, c32, c38, c38, c33, c28, c32, c32, c31, c33, c33, c28, c33, c36, c28, c32, c37, c37, c37, c30, c28, c28, c30, c38, c37, c34, c37, c37, c37, c37, c37, c38, c34, c28, c28, c28, c28, c28, c28, c33, c38, c37, c33, c37, c30, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c38, c37, c28, c33, c28, c37, c33, c28, c28, c37, c37, c32, c33, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c32, c36, c36, c34, c31, c37, c37, c37, c37, c30, c33, c32, c36, c28, c33, c36, c37, c37, c33, c32, c37, c37, c37, c37, c34, c36, c38, c37, c36, c28, c36, c38, c37, c37, c32, c33, c37, c37, c28, c28, c28, c28, c31, c33, c33, c36, c37, c36, c28, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c28, c33, c28, c33, c30, c34, c31, c32, c34, c38, c37, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c38, c37, c37, c37, c33, c33, c37, c31, c33, c33, c36, c28, c31, c28, c37, c37, c32, c37, c37, c28, c37, c37, c37, c37, c37, c38, c37, c37, c28, c28, c31, c33, c34, c36, c37, c37, c34, c33, c37, c34, c28, c32, c37, c37, c37, c36, c33, c31, c28, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c32, c32, c34, c36, c30, c39, c37, c31, c30, c30, c32, c33, c37, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c34, c28, c33, c33, c32, c28, c31, c30, c37, c36, c37, c37, c32, c37, c38, c28, c37, c37, c37, c38, c33, c28, c39, c31, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c36, c33, c37, c37, c37, c37, c37, c37, c37, c38, c37, c30, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c38, c38, c37, c33, c30, c37, c37, c37, c37, c31, c31, c33, c38, c37, c37, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c36, c37, c37, c37, c37, c33, c37, c28, c32, c28, c31, c37, c38, c37, c34, c37, c36, c32, c37, c38, c31, c30, c36, c32, c32, c37, c37, c32, c33, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c37, c33, c34, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c38, c33, c32, c39, c28, c37, c37, c37, c37, c37, c37, c33, c32, c33, c32, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c33, c37, c37, c37, c37, c34, c33, c28, c31, c37, c38, c37, c37, c37, c34, c37, c37, c37, c38, c36, c28, c32, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c33, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c36, c34, c37, c37, c37, c37, c37, c37, c37, c33, c37, c37, c37, c37, c37, c32, c37, c37, c37, c38, c28, c37, c37, c37, c37, c37, c37, c32, c38, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c38, c33, c37, c37, c37, c37, c36, c31, c37, c38, c37, c37, c37, c37, c37, c34, c37, c38, c34, c29, c31, c32, c31, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c33, c34, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c36, c33, c36, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c37, c36, c33, c38, c28, c37, c37, c37, c37, c37, c37, c32, c37, c37, c38, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c28, c37, c37, c37, c37, c37, c28, c33, c28, c37, c37, c37, c37, c37, c38, c33, c37, c28, c32, c33, c28, c28, c32, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c33, c28, c31, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c37, c36, c33, c38, c30, c32, c37, c37, c37, c37, c37, c33, c37, c33, c33, c28, c28, c28, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c30, c38, c37, c37, c31, c31, c37, c38, c28, c38, c37, c37, c37, c37, c31, c28, c33, c33, c28, c28, c37, c37, c33, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c37, c37, c37, c37, c36, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c32, c33, c37, c37, c38, c28, c33, c37, c37, c37, c36, c32, c28, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c33, c37, c37, c37, c33, c38, c37, c38, c28, c38, c37, c37, c37, c37, c31, c33, c39, c28, c37, c37, c31, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c37, c37, c37, c37, c36, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c37, c37, c32, c33, c37, c28, c38, c37, c37, c37, c37, c38, c33, c28, c28},
'{c28, c28, c28, c28, c28, c28, c28, c28, c28, c36, c37, c37, c37, c33, c37, c37, c38, c28, c37, c36, c37, c37, c37, c31, c36, c37, c37, c30, c28, c31, c37, c38, c37, c37, c37, c37, c37, c37, c37, c37, c37, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c37, c37, c37, c37, c33, c28, c37, c37, c37, c37, c37, c37, c37, c28, c28},
'{c28, c28, c28, c28, c28, c28, c30, c28, c31, c34, c37, c37, c37, c33, c37, c37, c37, c28, c37, c28, c37, c37, c37, c28, c37, c38, c28, c31, c37, c39, c37, c33, c31, c32, c37, c37, c37, c37, c37, c37, c37, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c37, c33, c33, c33, c37, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c37, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c37, c37, c28, c28},
'{c37, c37, c37, c28, c31, c28, c36, c37, c37, c37, c37, c37, c32, c37, c37, c37, c38, c36, c37, c30, c37, c37, c36, c28, c38, c37, c37, c37, c33, c31, c32, c37, c39, c33, c37, c37, c37, c37, c37, c37, c37, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c36, c34, c37, c37, c28, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c37, c37, c37, c37, c37, c37, c31, c36, c37, c37, c37, c37, c37, c28, c28},
'{c38, c37, c37, c28, c34, c37, c37, c37, c32, c37, c37, c37, c33, c37, c37, c36, c28, c30, c37, c30, c37, c37, c32, c32, c38, c37, c37, c37, c28, c33, c37, c32, c28, c30, c37, c37, c37, c37, c37, c37, c38, c33, c31, c28, c32, c37, c37, c33, c28, c28, c37, c37, c37, c37, c37, c37, c37, c37, c33, c32, c37, c37, c34, c37, c37, c37, c36, c36, c37, c37, c33, c37, c37, c37, c37, c37, c32, c37, c37, c37, c37, c28, c37, c37, c37, c37, c37, c37, c37, c31, c36, c34, c31, c37, c37, c37, c28, c28},
'{c37, c36, c33, c37, c37, c37, c37, c37, c28, c37, c37, c38, c28, c37, c28, c31, c37, c38, c38, c28, c37, c38, c28, c36, c32, c30, c37, c31, c37, c28, c28, c28, c28, c30, c38, c37, c37, c37, c37, c35, c33, c34, c32, c28, c32, c38, c37, c32, c28, c28, c38, c37, c37, c33, c34, c37, c37, c37, c34, c32, c38, c37, c34, c37, c37, c37, c37, c37, c37, c37, c33, c38, c37, c37, c37, c38, c33, c37, c37, c37, c38, c28, c37, c38, c37, c37, c37, c37, c37, c31, c36, c36, c31, c37, c37, c37, c28, c28}

};
//zeros
sprite40r <=  '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 2  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0}, // 5 **  ***
    '{1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0}, // 6 ** ****
    '{1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0}, // 7 **** **
    '{1'b1,1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8 ***  **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // b  *****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}
};	// one
sprite41r <=  '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 2
    '{1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}, // 3
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}, // 4    **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 5   ***
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 6  ****
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 7    **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 8    **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 9    **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // a    **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // b    **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c    **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d  ******
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}
}	;
//two
sprite42r <= '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 2  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4      **
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 5     **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 6    **
    '{1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}, // 7   **
    '{1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}, // 8  **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 9 **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // b *******
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} };// f
sprite43r <=  '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 2  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 5      **
    '{1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 6   ****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 7      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9      **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // b  *****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} // f
	};
sprite44r <= '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 2     **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0}, // 3    ***
    '{1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 4   ****
    '{1'b0,1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0}, // 5  ** **
    '{1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 6 **  **
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // 7 *******
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 8     **
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 9     **
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // a     **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0}, // b    ****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} // f
	};
sprite45r <=
 '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // 2 *******
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 3 **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 4 **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 5 **
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 6 ******
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 7      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9      **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // b  *****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} // f
};	
sprite46r <=
	 '{ {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}, // 2   ***
    '{1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}, // 3  **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 4 **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 5 **
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 6 ******
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 7 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // b  *****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}}; // f
	
sprite47r <=  '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // 2 *******
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 5      **
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // 6     **
    '{1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}, // 7    **
    '{1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}, // 8   **
    '{1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}, // 9   **
    '{1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}, // a   **
    '{1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}, // b   **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}}; // f
sprite48r <= '{
	 '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 2  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 5 **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 6  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 7 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // a **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // b  *****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}}; // f
	
sprite49r <= 
 '{ '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b0,
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // 1'b1,
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0}, // 2  *****
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 3 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 4 **   **
    '{1'b1,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 5 **   **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0}, // 6  ******
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 7      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 8      **
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}, // 9      **
    '{1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}, // a     **
    '{1'b0,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}, // b  ****
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // c
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // d
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}, // e
    '{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} // f
	};
/*
//zeros
sprite40r <= {
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b01111100}, // 2  *****
   {8'b11000110}, // 3 **   **
   {8'b11000110}, // 4 **   **
   {8'b11001110}, // 5 **  ***
   {8'b11011110}, // 6 ** ****
   {8'b11110110}, // 7 **** **
   {8'b11100110}, // 8 ***  **
   {8'b11000110}, // 9 **   **
   {8'b11000110}, // a **   **
   {8'b01111100}, // b  *****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000}
};	// one
sprite41r <= {
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b00011000}, // 2
   {8'b00111000}, // 3
   {8'b01111000}, // 4    **
   {8'b00011000}, // 5   ***
   {8'b00011000}, // 6  ****
   {8'b00011000}, // 7    **
   {8'b00011000}, // 8    **
   {8'b00011000}, // 9    **
   {8'b00011000}, // a    **
   {8'b01111110}, // b    **
   {8'b00000000}, // c    **
   {8'b00000000}, // d  ******
   {8'b00000000}, // e
   {8'b00000000}
}	;
//two
sprite42r <={
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b01111100}, // 2  *****
   {8'b11000110}, // 3 **   **
   {8'b00000110}, // 4      **
   {8'b00001100}, // 5     **
   {8'b00011000}, // 6    **
   {8'b00110000}, // 7   **
   {8'b01100000}, // 8  **
   {8'b11000000}, // 9 **
   {8'b11000110}, // a **   **
   {8'b11111110}, // b *******
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000} };// f
sprite43r <= {
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b01111100}, // 2  *****
   {8'b11000110}, // 3 **   **
   {8'b00000110}, // 4      **
   {8'b00000110}, // 5      **
   {8'b00111100}, // 6   ****
   {8'b00000110}, // 7      **
   {8'b00000110}, // 8      **
   {8'b00000110}, // 9      **
   {8'b11000110}, // a **   **
   {8'b01111100}, // b  *****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000} // f
	};
sprite44r <={
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b00001100}, // 2     **
   {8'b00011100}, // 3    ***
   {8'b00111100}, // 4   ****
   {8'b01101100}, // 5  ** **
   {8'b11001100}, // 6 **  **
   {8'b11111110}, // 7 *******
   {8'b00001100}, // 8     **
   {8'b00001100}, // 9     **
   {8'b00001100}, // a     **
   {8'b00011110}, // b    ****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000} // f
	};
sprite45r <=
{
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b11111110}, // 2 *******
   {8'b11000000}, // 3 **
   {8'b11000000}, // 4 **
   {8'b11000000}, // 5 **
   {8'b11111100}, // 6 ******
   {8'b00000110}, // 7      **
   {8'b00000110}, // 8      **
   {8'b00000110}, // 9      **
   {8'b11000110}, // a **   **
   {8'b01111100}, // b  *****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000} // f
};	
sprite46r <=
	{{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b00111000}, // 2   ***
   {8'b01100000}, // 3  **
   {8'b11000000}, // 4 **
   {8'b11000000}, // 5 **
   {8'b11111100}, // 6 ******
   {8'b11000110}, // 7 **   **
   {8'b11000110}, // 8 **   **
   {8'b11000110}, // 9 **   **
   {8'b11000110}, // a **   **
   {8'b01111100}, // b  *****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000}}; // f
	
sprite47r <= {
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b11111110}, // 2 *******
   {8'b11000110}, // 3 **   **
   {8'b00000110}, // 4      **
   {8'b00000110}, // 5      **
   {8'b00001100}, // 6     **
   {8'b00011000}, // 7    **
   {8'b00110000}, // 8   **
   {8'b00110000}, // 9   **
   {8'b00110000}, // a   **
   {8'b00110000}, // b   **
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000}}; // f
sprite48r <={
	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b01111100}, // 2  *****
   {8'b11000110}, // 3 **   **
   {8'b11000110}, // 4 **   **
   {8'b11000110}, // 5 **   **
   {8'b01111100}, // 6  *****
   {8'b11000110}, // 7 **   **
   {8'b11000110}, // 8 **   **
   {8'b11000110}, // 9 **   **
   {8'b11000110}, // a **   **
   {8'b01111100}, // b  *****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000}}; // f
	
sprite49r <= 
{	{8'b00000000}, // 0
   {8'b00000000}, // 1
   {8'b01111100}, // 2  *****
   {8'b11000110}, // 3 **   **
   {8'b11000110}, // 4 **   **
   {8'b11000110}, // 5 **   **
   {8'b01111110}, // 6  ******
   {8'b00000110}, // 7      **
   {8'b00000110}, // 8      **
   {8'b00000110}, // 9      **
   {8'b00001100}, // a     **
   {8'b01111000}, // b  ****
   {8'b00000000}, // c
   {8'b00000000}, // d
   {8'b00000000}, // e
   {8'b00000000} // f
	};
*/
		end
endmodule
