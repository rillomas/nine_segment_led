module eight_dice(
	input logic [2:0] s,
	output logic [8:0] out);
	// convert 3 bit push button input to nine segment LED
	// tl...top left, tr...top right
	// bl...bottom left, br... bottom right
	// cl...center left, cr... center right
	// 000 : none
	// 001 : center
	// 010 : tl, br
	// 011 : tl, br, center
	// 100 : tl, tr, bl, br
	// 101 : tl, tr, bl, br, center
	// 110 : tl, cl, bl, tr, cr, br
	// 111 : tl, cl, bl, tr, cr, br, center
	always_comb begin
		case (s)
			3'b000: out = 9'b000000000;
			3'b001: out = 9'b000010000;
			3'b010: out = 9'b100000001;
			3'b011: out = 9'b100010001;
			3'b100: out = 9'b101000101;
			3'b101: out = 9'b101010101;
			3'b110: out = 9'b111000111;
			3'b111: out = 9'b111010111;
			default: out = 9'b000000000;
		endcase
	end
endmodule