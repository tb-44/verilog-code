 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: mux2to1_8bit.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   2 to 1 Multiplexor (8bit) Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module mux2to1_8bit(Ain,Bin,sel,instruction_out);
	input wire [7:0] Ain, Bin;
	input wire sel;
	output reg [7:0] instruction_out;
	
	always @ (Ain or Bin or sel)
		if (sel == 1'b0)
			instruction_out = Ain;
		else
			instruction_out = Bin;
endmodule
