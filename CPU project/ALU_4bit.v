 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: ALU_4bit.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   4bit ALU
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module ALU_4bit(A, B, op, clk, result);
	input clk;
	input [3:0] A, B;
	input [1:0] op;
	output [3:0] result;
	wire [3:0] r1,r2;
	reg [3:0] r3;
	
	assign r1 = A;
	assign r2 = B;
	assign result = r3;
	
	always @ (op or r1 or r2)
		begin
			case (op)
				2'b00:  r3 = r1 + r2;  //Add
				2'b01:  r3 = r1 - r2;  //Sub
				2'b10:  r3 = r1 & r2;  //AND
				2'b11:  r3 = ~r1;      //NOT
			endcase
		end
endmodule
