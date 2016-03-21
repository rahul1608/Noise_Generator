//module to generate tausworthe URNG (unifrom random number generator) 
//two 32-bit URNG
//Rahul_Umrania
//***************************************************************************//

module tausworthe (clock, re_set, tausout);

//***Define the Parameter_width*****//
	parameter width = 32;
	
//***Define the inputs*********//
	input clock;
	input re_set;
	
//***Define the outputs********//
	output [width-1:0] tausout ;
	
	reg [width-1:0] Seed_0;
	reg [width-1:0] Seed_1;
	reg [width-1:0] Seed_2;
	reg [width-1:0] b;
//***Assigning tausout********//
	assign tausout = Seed_0 ^ Seed_1 ^ Seed_2;
	always @ (posedge clk ) begin
		if(!re_set) begin
	
			b = ((( Seed_0 << 13) ^ Seed_0) >> 19);

			Seed_0 = ((( Seed_0 & 32'hFFFFFFFE) << 12 ) ^ b);

			b = ((( Seed_1 << 2) ^ Seed_1) >> 25);

			Seed_1 = ((( Seed_1 & 32'hFFFF_FFF8) << 4 ) ^ b);

			b = ((( Seed_2 << 3) ^ Seed_2) >> 11);
	
			Seed_2 = ((( Seed_2 & 32'hFFFF_FFF0) << 17 ) ^ b);
		end
		else begin
			Seed_0 = 4;
			Seed_1 = 5;
			Seed_2 = 7;
		end
	end
endmodule
	
	