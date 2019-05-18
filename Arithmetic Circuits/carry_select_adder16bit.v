 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: carry_select_adder_16bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 16-bit Carry-Select Adder with full-adder & ripple carry adder
 //  16-bit Carry-Select Adder Module
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module carry_select_16bit(A, B, Cin, sum, Cout);
	input [15:0] A, B;
	input Cin;
	output [15:0] sum;
	output Cout;
	wire [3:1] CW;
 
	ripple_carry_adder_4bit RCA4_0(A[3:0],B[3:0], Cin, sum[3:0],CW[1]);
	carry_select_adder4bit CSA4_1(A[7:4],B[7:4], CW[1], sum[7:4],CW[2]);
	carry_select_adder4bit CSA4_2(A[11:8],B[11:8], CW[2], sum[11:8], CW[3]);
	carry_select_adder4bit CSA4_3(A[15:12],B[15:12], CW[3], sum[15:12], Cout);
endmodule
