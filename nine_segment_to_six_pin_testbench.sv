`timescale 1ns/1ns
module nine_segment_to_six_pin_testbench ();

	parameter STEP = 50;
	logic clk = 0;
	logic [8:0] segments;
	logic [2:0] rows, cols;
	
	nine_segment_to_six_pin convert(.clk(clk), .segments(segments), .rows(rows), .cols(cols));
	initial begin
		forever begin
			#STEP
			clk = ~clk;
		end
	end
	
	initial begin
		segments = 9'b000000000;
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b111)) else $error("0 S0 failed");
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b111)) else $error("0 S1 failed");
		#STEP
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b111)) else $error("0 S2 failed");
		segments = 9'b000010000;
		#STEP
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b101)) else $error("1 S0 failed");
		#STEP
		#STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("1 S1 failed");
		#STEP
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b101)) else $error("1 S1 failed");
		$stop;
	end

endmodule