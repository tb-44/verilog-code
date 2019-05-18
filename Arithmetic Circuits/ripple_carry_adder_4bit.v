 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: ripple_carry_adder_4bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 4-bit Carry-Select Adder with full-adder & ripple carry adder
 //  4-bit Ripple Carry Adder module
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////


module ripple_carry_adder_4bit(A, B, Cin, sum, Cout);
	input [3:0] A, B;
	input Cin;
	output [3:0] sum;
	output Cout;
	
	wire c1, c2, c3;
	
	full_adder fulladd0(A[0], B[0], Cin, sum[0], c1);
	full_adder fulladd1(A[1], B[1], c1, sum[1], c2);
	full_adder fulladd2(A[2], B[2], c2, sum[2], c3);
	full_adder fulladd3(A[3], B[3], c3, sum[3], Cout);
endmodule
