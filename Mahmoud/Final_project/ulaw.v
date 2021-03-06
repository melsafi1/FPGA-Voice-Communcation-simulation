/*
module ulaw(clk, reset, in, enc_out, dec_out, err);
	parameter n = 14;									// Bit width (G.711 standard for u-law is 14 bits)
	
	input clk, reset;
	input signed [n-1:0] in;
	
	output reg signed [7:0] enc_out;				// 8-bit encoded output
	output reg signed [n-1:0] dec_out;			// n-bit decoded output
	output signed [n:0] err;						// Error of results (absolute value)
	
	wire s;												// Sign bit
	assign s = in[n-1];
	
	wire signed [n-1:0] x;							// Auxiliary vectors
	assign x = {1'b0, in[n-2:0]};
	
	wire signed [n-1:0] diff;						// Difference (error, with sign)
	assign diff = dec_out - in;
	
	assign err = (diff > 0) ? diff : -diff;
	
	wire [n-1:0] lin_in;								// Linear input value; produced by taking
															// two's complement of input, inverting all bits
															// after sign bit if negative, and adding 33
	wire [n-1:0] in_twos;
	assign in_twos = ~in + 1'b1;
	assign lin_in = {	in_twos[n-1],
							((in > 0) ? in_twos[n-2:0] : ~in_twos[n-2:0])}
							+ 6'b100001;
	
	wire [n-1:0] lin_out;							// Linear output value; signed magnitude
															// representation, final result produced by
															// decreasing magnitude of this value by 33
	assign lin_out = ((dec_out > 0) ? dec_out : -dec_out) - 6'b100001;
	
	// Encoding logic
	always @* begin : Encode
		casex (in)
			{s, 8'b00000001, in[4:1], 1'bx}:		enc_out <= {s, 3'b000, in[4:1]};
			{s, 7'b0000001, in[5:2], 2'bxx}:		enc_out <= {s, 3'b001, in[5:2]};
			{s, 6'b000001, in[6:3], 3'bxxx}:		enc_out <= {s, 3'b010, in[6:3]};
			{s, 5'b00001, in[7:4], 4'bxxxx}:		enc_out <= {s, 3'b011, in[7:4]};
			{s, 4'b0001, in[8:5], 5'bxxxxx}:		enc_out <= {s, 3'b100, in[8:5]};
			{s, 3'b001, in[9:6], 6'bxxxxxx}:		enc_out <= {s, 3'b101, in[9:6]};
			{s, 2'b01, in[10:7], 7'bxxxxxxx}:	enc_out <= {s, 3'b110, in[10:7]};
			{s, 1'b1, in[11:8], 8'bxxxxxxxx}:	enc_out <= {s, 3'b111, in[11:8]};
			default:										enc_out <= {s, 7'b0000_000};
		endcase
	end
	
	// Decoding logic
	always @* begin : Decode
		case (enc_out[6:4])
			{3'b000}:	dec_out <= {s, 8'b00000001, enc_out[3:0], 1'b1};
			{3'b001}:	dec_out <= {s, 7'b0000001, enc_out[3:0], 2'b10};
			{3'b010}:	dec_out <= {s, 6'b000001, enc_out[3:0], 3'b100};
			{3'b011}:	dec_out <= {s, 5'b00001, enc_out[3:0], 4'b1000};
			{3'b100}:	dec_out <= {s, 4'b0001, enc_out[3:0], 5'b10000};
			{3'b101}:	dec_out <= {s, 3'b001, enc_out[3:0], 6'b100000};
			{3'b110}:	dec_out <= {s, 2'b01, enc_out[3:0], 7'b1000000};
			{3'b111}:	dec_out <= {s, 1'b1, enc_out[3:0], 8'b10000000};
			default:		dec_out <= {s, 13'b0000_0000_0000_0};
		endcase
	end
	
endmodule
*/

/*
// u-law compression (14-bit -> 8-bit)
module ulaw_comp(clk, in, enc_out);
	input clk;
	input signed [13:0] in;							// 14-bit audio input
	
	output reg signed [7:0] enc_out;				// 8-bit encoded output
	
	wire s;												// Sign bit
	assign s = in[13];
	
	wire [13:0] lin_in;								// Linear input value; produced by taking
															// two's complement of input, inverting all bits
															// after sign bit if negative, and adding 33
	wire [13:0] in_twos;
	assign in_twos = ~in + 1'b1;
	assign lin_in = {	in_twos[13],
							((in > 0) ? in_twos[12:0] : ~in_twos[12:0])}
							+ 6'b100001;
	
	// Encoding logic
	always @* begin : Encode
		casex (in)
			{s, 8'b00000001, in[4:1], 1'bx}:		enc_out <= {s, 3'b000, in[4:1]};
			{s, 7'b0000001, in[5:2], 2'bxx}:		enc_out <= {s, 3'b001, in[5:2]};
			{s, 6'b000001, in[6:3], 3'bxxx}:		enc_out <= {s, 3'b010, in[6:3]};
			{s, 5'b00001, in[7:4], 4'bxxxx}:		enc_out <= {s, 3'b011, in[7:4]};
			{s, 4'b0001, in[8:5], 5'bxxxxx}:		enc_out <= {s, 3'b100, in[8:5]};
			{s, 3'b001, in[9:6], 6'bxxxxxx}:		enc_out <= {s, 3'b101, in[9:6]};
			{s, 2'b01, in[10:7], 7'bxxxxxxx}:	enc_out <= {s, 3'b110, in[10:7]};
			{s, 1'b1, in[11:8], 8'bxxxxxxxx}:	enc_out <= {s, 3'b111, in[11:8]};
			default:										enc_out <= {s, 7'b0000_000};
		endcase
	end
	
endmodule

// u-law decompression (8-bit > 14-bit)
module ulaw_decomp(clk, enc_in, dec_out);
	input clk;
	input signed [7:0] enc_in;						// 8-bit encoded input
	
	output reg signed [13:0] dec_out;			// 14-bit decoded output
	
	wire s;												// Sign bit
	assign s = enc_in[7];
	
	wire [13:0] lin_out;								// Linear output value; signed magnitude
															// representation, final result produced by
															// decreasing magnitude of this value by 33
	assign lin_out = ((dec_out > 0) ? dec_out : -dec_out) - 6'b100001;
		
	// Decoding logic
	always @* begin : Decode
		case (enc_in[6:4])
			{3'b000}:	dec_out <= {s, 8'b00000001, enc_in[3:0], 1'b1};
			{3'b001}:	dec_out <= {s, 7'b0000001, enc_in[3:0], 2'b10};
			{3'b010}:	dec_out <= {s, 6'b000001, enc_in[3:0], 3'b100};
			{3'b011}:	dec_out <= {s, 5'b00001, enc_in[3:0], 4'b1000};
			{3'b100}:	dec_out <= {s, 4'b0001, enc_in[3:0], 5'b10000};
			{3'b101}:	dec_out <= {s, 3'b001, enc_in[3:0], 6'b100000};
			{3'b110}:	dec_out <= {s, 2'b01, enc_in[3:0], 7'b1000000};
			{3'b111}:	dec_out <= {s, 1'b1, enc_in[3:0], 8'b10000000};
			default:		dec_out <= {s, 13'b0000_0000_0000_0};
		endcase
	end
endmodule
*/

// u-law compression (16-bit -> 9-bit)
module ulaw_comp169(clk,start, in, enc_out,finish);
	input clk;
	input signed [15:0] in;							// 16-bit audio input
	input wire start;
	output reg signed [8:0] enc_out;				// 9-bit encoded output
	output reg finish;
	wire s;												// Sign bit
	assign s = in[15];
		reg state = 1'b0;

		always @(posedge clk,posedge start) begin
			case(state)
			1'b0: begin 
			if(start)state <= 1'b1;
			else state <=1'b0;
			finish<=1'b0;
			end
			1'b1: begin 
				state <=1'b0;
				finish <=1'b1;
			end
			default: state <=1'b0;
			endcase 
		end
	// Encoding logic
	always @* begin : Encode
		casex (in)
			{s, 10'b0000000001, in[4:1], 1'bx}:		enc_out <= {s, 4'b0000, in[4:1]};
			{s, 9'b000000001, in[5:2], 2'bxx}:		enc_out <= {s, 4'b0001, in[5:2]};
			{s, 8'b00000001, in[6:3], 3'bxxx}:		enc_out <= {s, 4'b0010, in[6:3]};
			{s, 7'b0000001, in[7:4], 4'bxxxx}:		enc_out <= {s, 4'b0011, in[7:4]};
			{s, 6'b000001, in[8:5], 5'bxxxxx}:		enc_out <= {s, 4'b0100, in[8:5]};
			{s, 5'b00001, in[9:6], 6'bxxxxxx}:		enc_out <= {s, 4'b0101, in[9:6]};
			{s, 4'b0001, in[10:7], 7'bxxxxxxx}:		enc_out <= {s, 4'b0110, in[10:7]};
			{s, 3'b001, in[11:8], 8'bxxxxxxxx}:		enc_out <= {s, 4'b0111, in[11:8]};
			{s, 2'b01, in[12:9], 9'bxxxxxxxxx}:		enc_out <= {s, 4'b1000, in[12:9]};
			{s, 1'b1, in[13:10], 10'bxxxxxxxxxx}:	enc_out <= {s, 4'b1001, in[13:10]};
			default:											enc_out <= {s, 8'b0000_0000};
		endcase
	end
	
endmodule

// u-law decompression (9-bit > 16-bit)
module ulaw_decomp169(clk,start, enc_in, dec_out,finish);
	input clk;
	input signed [8:0] enc_in;						// 9-bit encoded input
	input wire start;
	output reg signed [15:0] dec_out;			// 16-bit decoded output
	output reg finish;
	wire s;												// Sign bit
	assign s = enc_in[8];
		reg state = 1'b0;
		always @(posedge clk) begin
			case(state)
			1'b0: begin 
			if(start)state <= 1'b1;
			else state <=1'b0;
			finish<=1'b0;
			end
			1'b1: begin 
				state <=1'b0;
				finish <=1'b1;
			end
			default: state <=1'b0;
			endcase 
		end
	// Decoding logic
	always @* begin : Decode
		case (enc_in[7:4])
			{4'b0000}:	dec_out <= {s, 10'b0000000001, enc_in[3:0], 1'b1};
			{4'b0001}:	dec_out <= {s, 9'b000000001, enc_in[3:0], 2'b10};
			{4'b0010}:	dec_out <= {s, 8'b00000001, enc_in[3:0], 3'b100};
			{4'b0011}:	dec_out <= {s, 7'b0000001, enc_in[3:0], 4'b1000};
			{4'b0100}:	dec_out <= {s, 6'b000001, enc_in[3:0], 5'b10000};
			{4'b0101}:	dec_out <= {s, 5'b00001, enc_in[3:0], 6'b100000};
			{4'b0110}:	dec_out <= {s, 4'b0001, enc_in[3:0], 7'b1000000};
			{4'b0111}:	dec_out <= {s, 3'b001, enc_in[3:0], 8'b10000000};
			{4'b1000}:	dec_out <= {s, 2'b01, enc_in[3:0], 9'b100000000};
			{4'b1001}:	dec_out <= {s, 1'b1, enc_in[3:0], 10'b1000000000};
			default:		dec_out <= {s, 15'b0000_0000_0000_000};
		endcase
	end
endmodule
