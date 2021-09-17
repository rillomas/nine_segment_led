`timescale 1ns/1ns
module nine_segment_to_six_pin_testbench ();

	parameter STEP = 50;
	parameter CLOCK_STEP = 100; // should be twice the value of a step so the clock edge roundtrips
	logic clk = 0;
	logic enable = 0;
	logic [8:0] segments;
	logic [2:0] rows, cols;
	
	nine_segment_to_six_pin convert(.clk(clk), .enable(enable), .segments(segments), .rows(rows), .cols(cols));
	initial begin
		forever begin
			#STEP
			clk = ~clk;
			enable = ~enable;
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
		// 3
		segments = 9'b100010001;
		#CLOCK_STEP
		assert ((rows === 3'b100) & (cols === 3'b011)) else $error("3 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("3 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b001) & (cols === 3'b110)) else $error("3 S2 failed");
		// 4
		segments = 9'b101000101;
		#CLOCK_STEP
		assert ((rows === 3'b101) & (cols === 3'b010)) else $error("4 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b101) & (cols === 3'b010)) else $error("4 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b101) & (cols === 3'b010)) else $error("4 S2 failed");
		// 5
		segments = 9'b101010101;
		#CLOCK_STEP
		assert ((rows === 3'b100) & (cols === 3'b010)) else $error("5 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b101)) else $error("5 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b001) & (cols === 3'b010)) else $error("5 S2 failed");
		// 6
		segments = 9'b111000111;
		#CLOCK_STEP
		assert ((rows === 3'b111) & (cols === 3'b010)) else $error("6 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b111) & (cols === 3'b010)) else $error("6 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b111) & (cols === 3'b010)) else $error("6 S2 failed");
		// 7
		segments = 9'b111010111;
		#CLOCK_STEP
		assert ((rows === 3'b100) & (cols === 3'b010)) else $error("7 S0 failed");
		#CLOCK_STEP
		assert ((rows === 3'b010) & (cols === 3'b000)) else $error("7 S1 failed");
		#CLOCK_STEP
		assert ((rows === 3'b001) & (cols === 3'b010)) else $error("7 S2 failed");
		$stop;
	end

endmodule