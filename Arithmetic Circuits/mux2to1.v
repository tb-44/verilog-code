 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: mux2to1.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 4-bit Carry-Select Adder with full-adder & ripple carry adder
 // - 2 to 1 multiplexor verilog module (Structural)
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

 module mux2to1(w0, w1, s, f);
	input w0, w1, s;
	output f;
	wire x,y;
	
	not (s_not, s);
	and (x, s_not, w0);
	and (y, s, w1);
	or (f, x, y);
endmodule
