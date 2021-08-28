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
	always @ (*) begin
		case (s)
			3'b000: begin
				out = {9{1'b0}};
			end
			3'b001: begin
				out = {
					1'b0, 1'b0, 1'b0,
					1'b0, 1'b1, 1'b0,
					1'b0, 1'b0, 1'b0
				};
			end
			3'b010: begin
				out = {
					1'b1, 1'b0, 1'b0,
					1'b0, 1'b0, 1'b0,
					1'b0, 1'b0, 1'b1
				};
			end
			3'b011: begin
				out = {
					1'b1, 1'b0, 1'b0,
					1'b0, 1'b1, 1'b0,
					1'b0, 1'b0, 1'b1
				};
			end
			3'b100: begin
				out = {
					1'b1, 1'b0, 1'b1,
					1'b0, 1'b0, 1'b0,
					1'b1, 1'b0, 1'b1
				};
			end
			3'b101: begin
				out = {
					1'b1, 1'b0, 1'b1,
					1'b0, 1'b1, 1'b0,
					1'b1, 1'b0, 1'b1
				};
			end
			3'b110: begin
				out = {
					1'b1, 1'b0, 1'b1,
					1'b1, 1'b0, 1'b1,
					1'b1, 1'b0, 1'b1
				};
			end
			3'b111: begin
				out = {
					1'b1, 1'b0, 1'b1,
					1'b1, 1'b1, 1'b1,
					1'b1, 1'b0, 1'b1
				};
			end
		endcase
	end
endmodule