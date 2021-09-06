`timescale 1ns/1ns
module nine_segment_to_six_pin_testbench ();

	parameter STEP = 50;
	parameter CLOCK_STEP = 100; // should be twice the value of a step so the clock edge roundtrips
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
		// 0
		segments = 9'b000000000;
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b000)) else $error("0 S0 failed");
		#STEP
		assert ((rows === 3'b000) & (cols === 3'b000)) else $error("0 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b000) & (cols === 3'b000)) else $error("0 S2 failed");
		// 1
		segments = 9'b000010000;
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("1 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("1 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("1 S2 failed");
		// 2
		segments = 9'b100000001;
		#CLOCK_STEP
		assert ((rows === 3'b100) & (cols === 3'b011)) else $error("2 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b000) & (cols === 3'b000)) else $error("2 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b001) & (cols === 3'b110)) else $error("2 S2 failed");
		$stop;
	end

endmodule