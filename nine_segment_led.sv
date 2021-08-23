module nine_segment_led(
	input logic s0,s1,s2,
	output logic o0,o1,o2,o3,o4,o5);
	logic [2:0] s, row, col;
	assign s[0] = s0;
	assign s[1] = s1;
	assign s[2] = s2;
	eight_dice dice(.s(s), .row(row), .col(col));
	assign {o0,o1,o2} = row;
	assign {o3,o4,o5} = col;
endmodule
