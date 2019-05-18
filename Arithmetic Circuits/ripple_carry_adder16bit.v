 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: ripple_carry_adder16bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 16-bit Carry-Select Adder with full-adder & ripple carry adder
 //  16-bit Ripple Carry Adder Module
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module ripple_carry_adder16bit(Cin, A, B, sum, Cout);
	input [15:0] A, B;
	input Cin;
	output [15:0] sum;
	output Cout;
	wire [3:1] c1;
 
	ripple_carry_adder_4bit ripple_carry0(A[3:0],B[3:0],Cin, sum[3:0],c1[1]);
	ripple_carry_adder_4bit ripple_carry1(A[7:4],B[7:4],c1[1],sum[7:4],c1[2]);
	ripple_carry_adder_4bit ripple_carry2(A[11:8],B[11:8],c1[2],sum[11:8],c1[3]);
	ripple_carry_adder_4bit ripple_carry3(A[15:12],B[15:12],c1[3],sum[15:12],Cout);
endmodule
