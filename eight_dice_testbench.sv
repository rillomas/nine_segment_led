`timescale 1ns/1ns
module eight_dice_testbench ();

	parameter STEP = 100;
	bit [2:0] s;
	bit [8:0] out;
	
	eight_dice dice(.s(s), .out(out));
	
	initial begin
		s[0] <= 1'b0;
		s[1] <= 1'b0;
		s[2] <= 1'b0;
		#STEP
		s[0] <= 1'b1;
		s[1] <= 1'b0;
		s[2] <= 1'b0;
		#STEP
		s[0] <= 1'b0;
		s[1] <= 1'b1;
		s[2] <= 1'b0;
		#STEP
		s[0] <= 1'b1;
		s[1] <= 1'b1;
		s[2] <= 1'b0;
		#STEP
		s[0] <= 1'b0;
		s[1] <= 1'b0;
		s[2] <= 1'b1;
		#STEP
		s[0] <= 1'b1;
		s[1] <= 1'b0;
		s[2] <= 1'b1;
		#STEP
		s[0] <= 1'b0;
		s[1] <= 1'b1;
		s[2] <= 1'b1;
		#STEP
		s[0] <= 1'b1;
		s[1] <= 1'b1;
		s[2] <= 1'b1;
		#STEP
		$finish;
	end

endmodule