`timescale 1ns/1ns
module eight_dice_testbench ();

	parameter STEP = 100;
	logic [2:0] s;
	logic [8:0] out;
	
	eight_dice dice(.s(s), .out(out));
	
	initial begin
		s = 3'b000;
		assert (out === 9'b000000000) else $error("000 failed");
		#STEP
		s = 3'b001;
		assert (out === 9'b000010000) else $error("001 failed");
		#STEP
		s = 3'b010;
		assert (out === 9'b100000001) else $error("010 failed");
		#STEP
		s = 3'b011;
		assert (out === 9'b100010001) else $error("011 failed");
		#STEP
		s = 3'b100;
		assert (out === 9'b101000101) else $error("100 failed");
		#STEP
		s = 3'b101;
		assert (out === 9'b101010101) else $error("101 failed");
		#STEP
		s = 3'b110;
		assert (out === 9'b111000111) else $error("110 failed");
		#STEP
		s = 3'b111;
		assert (out === 9'b111010111) else $error("111 failed");
		#STEP
		$stop;
	end

endmodule