module nine_segment_led(
	input logic clk,s0,s1,s2,
	output logic o0,o1,o2,o3,o4,o5);
	logic [31:0] cnt = 32'h00000000; // initialize counter with zero
	always_ff @(posedge clk) begin
		cnt <= cnt + 1; // count up
	end
	logic [2:0] s;
	logic [8:0] out;
	assign s = {s2,s1,s0};
	eight_dice dice(.s(s), .out(out));
	// convert 9 segment signals to 6 pin anode LED pins
	logic [2:0] rows;
	logic [2:0] cols;
	logic led;
	assign led = cnt[22];
	nine_segment_to_six_pin convert(.clk(led), .segments(out), .rows(rows), .cols(cols));
	// o0 ... row 1 (+)
	// o1 ... row 2 (+)
	// o2 ... row 3 (+)
	// o3 ... col 1 (-)
	// o4 ... col 2 (-)
	// o5 ... col 3 (-)
	assign {o0,o1,o2} = rows;
	assign {o3,o4,o5} = cols;
endmodule
