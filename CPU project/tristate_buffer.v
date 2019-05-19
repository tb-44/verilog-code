 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tristate_buffer.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   Tristate Buffer Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module tristate_buffer(Y, E, Z);
	input [3:0] Y;
	input E;
	output wire [3:0] Z;
	
	assign Z = E ? Y : 4'bz;
	
endmodule
