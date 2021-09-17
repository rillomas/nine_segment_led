module nine_segment_led(
	input logic clk,s0,s1,s2,
	output logic o0,o1,o2,o3,o4,o5);
	logic [2:0] s;
	logic [8:0] out;
	// It seems that the switch is 0 when pressed and 1 when not pressed
	// so we flip the bits here
	assign s = {~s2,~s1,~s0};
	eight_dice dice(.s(s), .out(out));
	// Create a slower clock enable signal
	logic enable;
	logic [31:0] cnt = 32'h00000000; // initialize counter with zero
	always_ff @(posedge clk) begin
		cnt <= cnt + 1; // count up
	end
	assign enable = cnt[17]; // 50MHz / 2^18 = 190Hz
	// assign enable = cnt[23]; // 50MHz / 2^24 = 2.98Hz
	// convert 9 segment signals to 6 pin anode LED pins
	logic [2:0] rows;
	logic [2:0] cols;
	nine_segment_to_six_pin convert(.clk(clk), .enable(enable), .segments(out), .rows(rows), .cols(cols));
	// o0 ... row 1 (+)
	// o1 ... row 2 (+)
	// o2 ... row 3 (+)
	// o3 ... col 1 (-)
	// o4 ... col 2 (-)
	// o5 ... col 3 (-)
	assign {o0,o1,o2} = rows;
	assign {o3,o4,o5} = cols;
endmodule
