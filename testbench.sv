`timescale 1ns/1ns
module testbench ();

	parameter STEP = 100;
	logic [2:0] s, row, col;
	
	eight_dice dice(.s(s), .row(row), .col(col));
	
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