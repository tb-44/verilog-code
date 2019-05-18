 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: comparator_4bit.v
 // Project: LAB #3 - Combinational Circuits
 // Description: Design a 4-bit Comparator
 //   4bit Comparator
 // Date:  Feb. 28, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

 module comparator_4bit(sign, A, B, equals, greater_than, less_than);
	input sign;
	input [3:0] A,B;
	output reg equals;
	output reg greater_than;
	output reg less_than;
	
	always @ (A or B)
	
	if (sign == 0) 
		begin
			if (A < B) 
			begin
				less_than = 1;
				{equals, greater_than} = 0;
			end
		
			else if (A == B) 
			begin
				equals = 1;
				{greater_than, less_than} = 0;
			end
		
			else 
			begin
				greater_than = 1;
				{equals, less_than} = 0;
			end
		end
	
	else if (sign == 1) 
		begin
			if (A < B) 
			begin
				greater_than = 1;
				{equals, less_than} = 0;
			end
	
			else if (A == B) 
			begin
				equals = 1;
				{greater_than, less_than} = 0;
			end
	
	else 
		begin
			less_than = 1;
			{equals, greater_than} = 0;
		end
	end
endmodule
