module led_clock(
	input logic base,
	output logic derived);
	logic [31:0] cnt = 32'h00000000; // initialize counter with zero
	always_ff @(posedge base) begin
		cnt <= cnt + 1; // count up
	end
	assign derived = cnt[23];
endmodule