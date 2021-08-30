`timescale 1ns/1ns
module eight_dice_testbench ();

	parameter STEP = 100;
	logic [2:0] s;
	logic [8:0] out;
	
	eight_dice dice(.s(s), .out(out));
	
	initial begin
		s = 3'b000;
		#STEP
		assert (out === 9'b000000000) else $error("000 failed");
		s = 3'b001;
		#STEP
		assert (out === 9'b000010000) else $error("001 failed");
		s = 3'b010;
		#STEP
		assert (out === 9'b100000001) else $error("010 failed");
		s = 3'b011;
		#STEP
		assert (out === 9'b100010001) else $error("011 failed");
		s = 3'b100;
		#STEP
		assert (out === 9'b101000101) else $error("100 failed");
		s = 3'b101;
		#STEP
		assert (out === 9'b101010101) else $error("101 failed");
		s = 3'b110;
		#STEP
		assert (out === 9'b111000111) else $error("110 failed");
		s = 3'b111;
		#STEP
		assert (out === 9'b111010111) else $error("111 failed");
		$stop;
	end

endmodule