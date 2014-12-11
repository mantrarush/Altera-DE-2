module BIN2BCD(input logic [15:0] binary,
					output logic [3:0] THOU,
					output logic [3:0] HUND,
					output logic [3:0] TEN,
					output logic [3:0] ONE);
			int i;
			always @ (binary)
				begin
					THOU = 4'b0;
					HUND = 4'b0;
					TEN = 4'b0;
					ONE = 4'b0;
					
						for(i=15; i >= 0 ; i = i-1)
							begin
								if(THOU >= 5)
									begin
									THOU = THOU +3;
									end
									
								if(HUND >=5 )
									begin
									HUND = HUND +3;
									end
									
								if(TEN >= 5)
									begin
									TEN = TEN +3;
									end
									
								if(ONE >=5)
									begin
									ONE = ONE +3;
									end
									
									
								THOU = THOU << 1;
								THOU[0] = HUND[3];
								HUND = HUND <<1;
								HUND[0] = TEN[3];
								TEN = TEN <<1;
								TEN[0] = ONE[3];
								ONE = ONE <<1;
								ONE[0] = binary[i];
							end
				end
		endmodule
					