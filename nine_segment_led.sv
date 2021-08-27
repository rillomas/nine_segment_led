module nine_segment_led(
	input logic s0,s1,s2,
	output logic o0,o1,o2,o3,o4,o5);
	logic [2:0] s, row, col;
	assign s = {s2,s1,s0};
	eight_dice dice(.s(s), .row(row), .col(col));
	assign {o0,o1,o2} = row;
	assign {o3,o4,o5} = col;
endmodule
