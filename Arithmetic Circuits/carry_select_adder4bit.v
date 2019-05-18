 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: carry_select_adder4bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 4-bit Carry-Select Adder with full-adder & ripple carry adder
 //  4-bit Carry-Select Adder Module
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module carry_select_adder4bit(A, B, Cin, sum, Cout);
	input [3:0] A, B;
	input Cin;
	output [3:0] sum;
	output Cout;
	
	wire [3:0] S0, S1;
	wire C0, C1;

	ripple_carry_adder_4bit rca1(A[3:0], B[3:0], 1'b0, S0[3:0], C0);
	ripple_carry_adder_4bit rca2(A[3:0], B[3:0], 1'b1, S1[3:0], C1);
	
	mux2to1 mux_sum0(S0[0],S1[0], Cin, sum[0]);
	mux2to1 mux_sum1(S0[1],S1[1], Cin, sum[1]);
	mux2to1 mux_sum2(S0[2],S1[2], Cin, sum[2]);
	mux2to1 mux_sum3(S0[3],S1[3], Cin, sum[3]);
	mux2to1 mux_cout0(C0,C1,Cin,Cout);
endmodule
