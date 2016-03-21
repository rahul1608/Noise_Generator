
module Poly_sqrt(clock, reset, Datain, DataOut);
input clock;
input reset;
input [30:0] Datain;
output reg [16:0] DataOut;

//initialization of registers
reg [42:0] numb1;
reg [19:0] numb2;
reg [13:0] Fraction_bit;
reg [3:0] Integer_bit;
reg [11:0] sqrt_coeff1[64];
reg [19:0] sqrt_coeff0[64];

always @(posedge clock)
begin
	if(!reset)
	begin

		numb1 = Datain * sqrt_coeff1[Datain[30:25]];
		numb2 = sqrt_coeff0[Datain[30:25]];

		Fraction_bit = numb1[35:23] + numb2[16:4];
		Integer_bit =  numb1[39:36] + numb2[19:17] + Fraction_bit[13];
		DataOut[12:0] <=  Fraction_bit[12:0];
		DataOut[16:13] <= Integer_bit[3:0];

	end

	else begin

	//Coefficient 1 Table by poly method from matlab

		sqrt_coeff1[0] <= 12'b100100010001;
		sqrt_coeff1[1] <= 12'b010010101001;
		sqrt_coeff1[2] <= 12'b001110010111;
		sqrt_coeff1[3] <= 12'b001100000111;
		sqrt_coeff1[4] <= 12'b001010101011;
		sqrt_coeff1[5] <= 12'b001001101010;
		sqrt_coeff1[6] <= 12'b001000111000;
		sqrt_coeff1[7] <= 12'b001000010001;
		sqrt_coeff1[8] <= 12'b000111110001;
		sqrt_coeff1[9] <= 12'b000111010110;
		sqrt_coeff1[10] <= 12'b000110111111;
		sqrt_coeff1[11] <= 12'b000110101011;
		sqrt_coeff1[12] <= 12'b000110011010;
		sqrt_coeff1[13] <= 12'b000110001010;
		sqrt_coeff1[14] <= 12'b000101111100;
		sqrt_coeff1[15] <= 12'b000101110000;
		sqrt_coeff1[16] <= 12'b000101100101;
		sqrt_coeff1[17] <= 12'b000101011010;
		sqrt_coeff1[18] <= 12'b000101010001;
		sqrt_coeff1[19] <= 12'b000101001000;
		sqrt_coeff1[20] <= 12'b000101000000;
		sqrt_coeff1[21] <= 12'b000100111000;
		sqrt_coeff1[22] <= 12'b000100110001;
		sqrt_coeff1[23] <= 12'b000100101011;
		sqrt_coeff1[24] <= 12'b000100100101;
		sqrt_coeff1[25] <= 12'b000100011111;
		sqrt_coeff1[26] <= 12'b000100011001;
		sqrt_coeff1[27] <= 12'b000100010100;
		sqrt_coeff1[28] <= 12'b000100001111;
		sqrt_coeff1[29] <= 12'b000100001011;
		sqrt_coeff1[30] <= 12'b000100000110;
		sqrt_coeff1[31] <= 12'b000100000010;
		sqrt_coeff1[32] <= 12'b000011111110;
		sqrt_coeff1[33] <= 12'b000011111010;
		sqrt_coeff1[34] <= 12'b000011110111;
		sqrt_coeff1[35] <= 12'b000011110011;
		sqrt_coeff1[36] <= 12'b000011110000;
		sqrt_coeff1[37] <= 12'b000011101100;
		sqrt_coeff1[38] <= 12'b000011101001;
		sqrt_coeff1[39] <= 12'b000011100110;
		sqrt_coeff1[40] <= 12'b000011100100;
		sqrt_coeff1[41] <= 12'b000011100001;
		sqrt_coeff1[42] <= 12'b000011011110;
		sqrt_coeff1[43] <= 12'b000011011100;
		sqrt_coeff1[44] <= 12'b000011011001;
		sqrt_coeff1[45] <= 12'b000011010111;
		sqrt_coeff1[46] <= 12'b000011010100;
		sqrt_coeff1[47] <= 12'b000011010010;
		sqrt_coeff1[48] <= 12'b000011010000;
		sqrt_coeff1[49] <= 12'b000011001110;
		sqrt_coeff1[50] <= 12'b000011001100;
		sqrt_coeff1[51] <= 12'b000011001010;
		sqrt_coeff1[52] <= 12'b000011001000;
		sqrt_coeff1[53] <= 12'b000011000110;
		sqrt_coeff1[54] <= 12'b000011000100;
		sqrt_coeff1[55] <= 12'b000011000010;
		sqrt_coeff1[56] <= 12'b000011000001;
		sqrt_coeff1[57] <= 12'b000010111111;
		sqrt_coeff1[58] <= 12'b000010111101;
		sqrt_coeff1[59] <= 12'b000010111100;
		sqrt_coeff1[60] <= 12'b000010111010;
		sqrt_coeff1[61] <= 12'b000010111001;
		sqrt_coeff1[62] <= 12'b000010110111;
		sqrt_coeff1[63] <= 12'b000010110110;

	//Coefficient0 Table

		sqrt_coeff0[0] <= 20'b00001100000001100001;
		sqrt_coeff0[1] <= 20'b00011011001101011001;
		sqrt_coeff0[2] <= 20'b00100011100011000010;
		sqrt_coeff0[3] <= 20'b00101010001100011011;
		sqrt_coeff0[4] <= 20'b00101111111001111101;
		sqrt_coeff0[5] <= 20'b00110100111111110000;
		sqrt_coeff0[6] <= 20'b00111001101000100111;
		sqrt_coeff0[7] <= 20'b00111101111011001000;
		sqrt_coeff0[8] <= 20'b01000001111011101111;
		sqrt_coeff0[9] <= 20'b01000101101101100011;
		sqrt_coeff0[10] <= 20'b01001001010010110111;
		sqrt_coeff0[11] <= 20'b01001100101101011101;
		sqrt_coeff0[12] <= 20'b01001111111110101101;
		sqrt_coeff0[13] <= 20'b01010011000111101101;
		sqrt_coeff0[14] <= 20'b01010110001001010111;
		sqrt_coeff0[15] <= 20'b01011001000100011101;
		sqrt_coeff0[16] <= 20'b01011011111001100101;
		sqrt_coeff0[17] <= 20'b01011110101001010010;
		sqrt_coeff0[18] <= 20'b01100001010100000010;
		sqrt_coeff0[19] <= 20'b01100011111010001101;
		sqrt_coeff0[20] <= 20'b01100110011100001011;
		sqrt_coeff0[21] <= 20'b01101000111010001111;
		sqrt_coeff0[22] <= 20'b01101011010100101010;
		sqrt_coeff0[23] <= 20'b01101101101011101100;
		sqrt_coeff0[24] <= 20'b01101111111111100010;
		sqrt_coeff0[25] <= 20'b01110010010000011000;
		sqrt_coeff0[26] <= 20'b01110100011110011010;
		sqrt_coeff0[27] <= 20'b01110110101001110010;
		sqrt_coeff0[28] <= 20'b01111000110010101010;
		sqrt_coeff0[29] <= 20'b01111010111001001001;
		sqrt_coeff0[30] <= 20'b01111100111101010111;
		sqrt_coeff0[31] <= 20'b01111110111111011011;
		sqrt_coeff0[32] <= 20'b10000000111111011100;
		sqrt_coeff0[33] <= 20'b10000010111101100000;
		sqrt_coeff0[34] <= 20'b10000100111001101101;
		sqrt_coeff0[35] <= 20'b10000110110100000111;
		sqrt_coeff0[36] <= 20'b10001000101100110011;
		sqrt_coeff0[37] <= 20'b10001010100011110110;
		sqrt_coeff0[38] <= 20'b10001100011001010101;
		sqrt_coeff0[39] <= 20'b10001110001101010010;
		sqrt_coeff0[40] <= 20'b10001111111111110010;
		sqrt_coeff0[41] <= 20'b10010001110000111000;
		sqrt_coeff0[42] <= 20'b10010011100000100111;
		sqrt_coeff0[43] <= 20'b10010101001111000010;
		sqrt_coeff0[44] <= 20'b10010110111100001101;
		sqrt_coeff0[45] <= 20'b10011000101000001010;
		sqrt_coeff0[46] <= 20'b10011010010010111011;
		sqrt_coeff0[47] <= 20'b10011011111100100011;
		sqrt_coeff0[48] <= 20'b10011101100101000100;
		sqrt_coeff0[49] <= 20'b10011111001100100000;
		sqrt_coeff0[50] <= 20'b10100000110010111010;
		sqrt_coeff0[51] <= 20'b10100010011000010100;
		sqrt_coeff0[52] <= 20'b10100011111100101110;
		sqrt_coeff0[53] <= 20'b10100101100000001100;
		sqrt_coeff0[54] <= 20'b10100111000010101111;
		sqrt_coeff0[55] <= 20'b10101000100100011000;
		sqrt_coeff0[56] <= 20'b10101010000101001001;
		sqrt_coeff0[57] <= 20'b10101011100101000011;
		sqrt_coeff0[58] <= 20'b10101101000100001000;
		sqrt_coeff0[59] <= 20'b10101110100010011001;
		sqrt_coeff0[60] <= 20'b10101111111111111000;
		sqrt_coeff0[61] <= 20'b10110001011100100110;
		sqrt_coeff0[62] <= 20'b10110010111000100011;
		sqrt_coeff0[63] <= 20'b10110100010011110010;

	end
end
endmodule
