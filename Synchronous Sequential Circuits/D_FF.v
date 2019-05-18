 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: D_FF.v
 // Project: LAB #5 - Synchronous Sequential Circuits
 // Description: Design a Universal Shift Register (USR)
 //   D Flip-Flop Module
 // Date:  Apr. 5, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

 module D_FF(D,clk,Q);
	input D, clk;
	output reg Q;
	
	always @ (posedge clk)
		begin
			Q <= D;
		end
endmodule
