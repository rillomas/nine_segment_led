// Convert a nine segment signal to a 3x3 anode common LED pins (6 pins)
module nine_segment_to_six_pin(
	input logic clk,
	input logic [8:0] segments,
	output logic [2:0] rows,
	output logic [2:0] cols);
	typedef enum logic [1:0] {R0, R1, R2} row_index;
	row_index state, next_state;
	initial begin
		state = R0;
	end
	always_ff @(posedge clk) begin
		// Switch between rows based on clock value to simultaneously light multiple rows
		state <= next_state;
	end

	always_comb begin
		// light LED and transition to next state
		case (state)
			R0: begin
				rows[2] = segments[8] | segments[7] | segments[6];
				rows[1] = 0;
				rows[0] = 0;
				next_state = R1;
			end
			R1: begin
				rows[2] = 0;
				rows[1] = segments[5] | segments[4] | segments[3];
				rows[0] = 0;
				next_state = R2;
			end
			R2: begin
				rows[2] = 0;
				rows[1] = 0;
				rows[0] = segments[2] | segments[1] | segments[0];
				next_state = R0;
			end
			default: begin
				rows[2] = 0;
				rows[1] = 0;
				rows[0] = 0;
				next_state = R0;
			end
		endcase
	end
	assign cols[2] = ~(segments[8] | segments[5] | segments[2]);
	assign cols[1] = ~(segments[7] | segments[4] | segments[1]);
	assign cols[0] = ~(segments[6] | segments[3] | segments[0]);
endmodule