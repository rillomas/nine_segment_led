// Convert a nine segment signal to a 3x3 anode common LED pins (6 pins)
module nine_segment_to_six_pin(
	input logic clk,
	input logic enable,
	input logic [8:0] segments,
	output logic [2:0] rows,
	output logic [2:0] cols);
	typedef enum {S0, S1, S2} blink_state;
	blink_state state = S0, next_state = S1;
	// transition state
	always_ff @(posedge clk) begin
		// Only transition when enable signal is toggled
		// We do this to transition much slower than the base clock speed (and to avoid warnings with clock assignment)
		// We also use a clock enable signal to avoid creating different clock domains
		// Reference:
		// https://community.intel.com/t5/Intel-Quartus-Prime-Software/how-to-constrain-low-frequency-clocks/m-p/16798?profile.language=ja
		// https://www.fpga4student.com/2017/08/how-to-generate-clock-enable-signal.html
		if (enable == 1'b1) begin
			state <= next_state;
		end
	end
	always_comb begin
		case (state)
			S0: next_state = S1;
			S1: next_state = S2;
			S2: next_state = S0;
			default: next_state = S0;
		endcase
	end
	// initial begin
	// 	$dumpfile("dump.vcd");
	// 	$dumpvars;
	// end
	always_comb begin
		case (segments)
			// 0
			9'b000000000: begin
				rows = 3'b000;
				cols = 3'b000;
			end
			// 1
			9'b000010000: begin
				// light center
				rows = 3'b010;
				cols = 3'b101;
			end
			// 2
			9'b100000001: begin
				case (state)
					S0: begin
						// light top left only
						rows = 3'b100;
						cols = 3'b011;
					end
					S1: begin
						// don't light any
						rows = 3'b000;
						cols = 3'b000;
					end
					S2: begin
						// light bottom right only
						rows = 3'b001;
						cols = 3'b110;
					end
					default: begin
						rows = 3'b000;
						cols = 3'b000;
					end
				endcase
			end
			// 3
			9'b100010001: begin
				case (state)
					S0: begin
						// light top left only
						rows = 3'b100;
						cols = 3'b011;
					end
					S1: begin
						// light center
						rows = 3'b010;
						cols = 3'b101;
					end
					S2: begin
						// light bottom right only
						rows = 3'b001;
						cols = 3'b110;
					end
					default: begin
						rows = 3'b000;
						cols = 3'b000;
					end
				endcase
			end
			// 4
			9'b101000101: begin
				// light four corners
				rows = 3'b101;
				cols = 3'b010;
			end
			// 5
			9'b101010101: begin
				case (state)
					S0: begin
						// light top left and right
						rows = 3'b100;
						cols = 3'b010;
					end
					S1: begin
						// light center
						rows = 3'b010;
						cols = 3'b101;
					end
					S2: begin
						// light bottom left and right
						rows = 3'b001;
						cols = 3'b010;
					end
					default: begin
						rows = 3'b000;
						cols = 3'b000;
					end
				endcase
			end
			// 6
			9'b111000111: begin
				// light first and third col
				rows = 3'b111;
				cols = 3'b010;
			end
			// 7
			9'b111010111: begin
				case (state)
					S0: begin
						// light top left and right
						rows = 3'b100;
						cols = 3'b010;
					end
					S1: begin
						// light whole row
						rows = 3'b010;
						cols = 3'b000;
					end
					S2: begin
						// light bottom left and right
						rows = 3'b001;
						cols = 3'b010;
					end
					default: begin
						rows = 3'b000;
						cols = 3'b000;
					end
				endcase
			end
			default: begin
				rows = 3'b000;
				cols = 3'b000;
			end
		endcase
	end
endmodule