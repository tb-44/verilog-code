 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: reg_4bit.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   4-bit Registers Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module reg_4bit(D, E, reset, clk, Q);
	input reset, clk;
	input E;
	input [3:0] D;
	output reg [3:0] Q;
	
	always @ (posedge clk)
		begin
			if (reset)
				Q <= 0;
			else if (E)
				Q <= D;
		end
endmodule
