// Convert a nine segment signal to a 3x3 anode common LED pins (6 pins)
module nine_segment_to_six_pin(
	input logic clk,
	input logic [8:0] segments,
	output logic [2:0] rows,
	output logic [2:0] cols);
	typedef enum {S0, S1, S2} blink_state;
	blink_state state = S0, next_state = S1;
	always_ff @(posedge clk) begin
		// Switch between rows based on clock value to simultaneously light multiple rows
		state <= next_state;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

	always_comb begin
		// light LED and transition to next state
		case (state)
			S0: begin
				rows[2] = segments[8] | segments[7] | segments[6];
				rows[1] = 0;
				rows[0] = 0;
				next_state = S1;
			end
			S1: begin
				rows[2] = 0;
				rows[1] = segments[5] | segments[4] | segments[3];
				rows[0] = 0;
				next_state = S2;
			end
			S2: begin
				rows[2] = 0;
				rows[1] = 0;
				rows[0] = segments[2] | segments[1] | segments[0];
				next_state = S0;
			end
			default: begin
				rows[2] = 0;
				rows[1] = 0;
				rows[0] = 0;
				next_state = S0;
			end
		endcase
	end
	// Rows should become high and cols should become low to light LEDs
	assign cols[2] = ~(segments[8] | segments[5] | segments[2]);
	assign cols[1] = ~(segments[7] | segments[4] | segments[1]);
	assign cols[0] = ~(segments[6] | segments[3] | segments[0]);
endmodule