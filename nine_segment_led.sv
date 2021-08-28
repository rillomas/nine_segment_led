module nine_segment_led(
	input logic s0,s1,s2,
	output logic o0,o1,o2,o3,o4,o5);
	logic [2:0] s;
	logic [8:0] out;
	assign s = {s2,s1,s0};
	eight_dice dice(.s(s), .out(out));
	// convert 9 segment signals to 6 pin anode LED pins
	logic [5:0] pins;
	nine_segment_to_six_pin convert(.segments(out), .pins(pins));
	assign {o0,o1,o2,o3,o4,o5} = pins;
endmodule
