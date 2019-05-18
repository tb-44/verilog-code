 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: full_adder.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 4-bit Carry-Select Adder with full-adder & ripple carry adder
 //   1_bit full adder verilog module (Structural)
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module full_adder(Cin, A, B, sum, Cout);
	input Cin, A, B;
	output sum, Cout;
	
	assign sum = A ^ B ^ Cin;
	assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
