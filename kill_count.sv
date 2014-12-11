module kill_count( input logic frame_clk, reset,kill,
				  input logic [0:15][0:7][0:1] sprite40r,
				  input logic [0:15][0:7][0:1] sprite41r,
				  input logic [0:15][0:7][0:1] sprite42r,
				  input logic [0:15][0:7][0:1] sprite43r,
				  input logic [0:15][0:7][0:1] sprite44r,
				  input logic [0:15][0:7][0:1] sprite45r,
				  input logic [0:15][0:7][0:1] sprite46r,
				  input logic [0:15][0:7][0:1] sprite47r,
				  input logic [0:15][0:7][0:1] sprite48r,
				  input logic [0:15][0:7][0:1] sprite49r,
				  output logic [0:15][0:7][0:1]sprite40,
				  output logic [0:15][0:7][0:1]sprite41,
				  output logic [0:15][0:7][0:1]sprite42,
				  output logic [0:15][0:7][0:1]sprite43
				  
				  );
				  
		logic[15:0] kcnt;
		logic[3:0] thou, hund, ten, one;
		always_ff @(  posedge frame_clk or posedge reset)
		begin
			if(reset == 1'b1)
				kcnt <= 16'b0;
			else if( kill == 1'b1)
			kcnt <= kcnt + 1'b1;
			else
			kcnt = kcnt;
			
		end

BIN2BCD   binary_2_BCD(.binary(kcnt),.THOU(thou),.HUND(hund),.TEN(ten),.ONE(one));
			always_comb
			begin
			sprite40 = 128'b0;
			sprite41 = 128'b0;
			sprite42 = 128'b0;
			sprite43 = 128'b0;
						case(thou)            //set thousand's place
			4'b0000: sprite43 = sprite40r;
			4'b0001:	sprite43 = sprite41r;
			4'b0010:	sprite43 = sprite42r;
			4'b0011:	sprite43 = sprite43r;
			4'b0100:	sprite43 = sprite44r;
			4'b0101:	sprite43 = sprite45r;
			4'b0110:	sprite43 = sprite46r;
			4'b0111:	sprite43 = sprite47r;
			4'b1000:	sprite43 = sprite48r;
			4'b1001:	sprite43 = sprite49r;
			    //if some other number retain score
						endcase
						case(hund)
			4'b0000: sprite42 = sprite40r;
			4'b0001:	sprite42 = sprite41r;
			4'b0010:	sprite42 = sprite42r;
			4'b0011:	sprite42 = sprite43r;
			4'b0100:	sprite42 = sprite44r;
			4'b0101:	sprite42 = sprite45r;
			4'b0110:	sprite42 = sprite46r;
			4'b0111:	sprite42 = sprite47r;
			4'b1000:	sprite42 = sprite48r;
			4'b1001:	sprite42 = sprite49r;
			
						endcase
						case(ten)
			4'b0000: sprite41 = sprite40r;
			4'b0001:	sprite41 = sprite41r;
			4'b0010:	sprite41 = sprite42r;
			4'b0011:	sprite41 = sprite43r;
			4'b0100:	sprite41 = sprite44r;
			4'b0101:	sprite41 = sprite45r;
			4'b0110:	sprite41 = sprite46r;
			4'b0111:	sprite41 = sprite47r;
			4'b1000:	sprite41 = sprite48r;
			4'b1001:	sprite41 = sprite49r;
			
						endcase
						case(one)
			4'b0000: sprite40 = sprite40r;
			4'b0001:	sprite40 = sprite41r;
			4'b0010:	sprite40 = sprite42r;
			4'b0011:	sprite40 = sprite43r;
			4'b0100:	sprite40 = sprite44r;
			4'b0101:	sprite40 = sprite45r;
			4'b0110:	sprite40 = sprite46r;
			4'b0111:	sprite40 = sprite47r;
			4'b1000:	sprite40 = sprite48r;
			4'b1001:	sprite40 = sprite49r;
			
																	//if some other number retain score
						endcase
			end
			

		
		
endmodule
