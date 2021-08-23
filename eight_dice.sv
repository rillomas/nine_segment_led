module eight_dice(
	input logic [2:0]s,
	output logic [2:0]row,
	output logic [2:0]col);
	// light LED based on switch
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
				row = {3{1'b0}};
				col = {3{1'b0}};
			end
			3'b001: begin
				row = {1'b0,1'b1,1'b0};
				col = {1'b0,1'b1,1'b0};
			end
			3'b010: begin
				row = {1'b1,1'b0,1'b1};
				col = {1'b1,1'b0,1'b1};
			end
			3'b011: begin
				row = {3{1'b1}};
				col = {3{1'b1}};
			end
			default: begin
				row = {3{1'b0}};
				col = {3{1'b0}};
			end
		endcase
	end
endmodule