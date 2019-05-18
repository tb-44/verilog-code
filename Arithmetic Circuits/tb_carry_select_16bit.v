///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tb_carry_select_16bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 16-bit Carry-Select Adder with full-adder & ripple carry adder
 //  16-bit Carry-Select Adder TESTBENCH
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_carry_select_16bit;
	reg [15:0] A, B;
	reg Cin;
	wire [15:0] sum;
	wire Cout;
	integer i, j;
	
	carry_select_16bit tb_CSA16(.Cin(Cin), .A(A), .B(B), .sum(sum), .Cout(Cout));

			initial 
				begin

				Cin = 0;
				for(i = 16'b0000000000000000; i <= 16'b1111111111111111; i = i + 1) begin
					for(j = 16'b0000000000000000; j <= 16'b1111111111111111; j = j + 1) begin
					A = i; B = j; #10;
					end
				end

				Cin = 1;
				for(i = 16'b0000000000000000; i <= 16'b1111111111111111; i = i + 1) begin
					for(j = 16'b0000000000000000; j <= 16'b1111111111111111; j = j + 1) begin	
					A = i; B = j; #10;
					end
				end
			end		
endmodule
