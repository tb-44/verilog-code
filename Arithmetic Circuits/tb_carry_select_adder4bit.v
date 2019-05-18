 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tb_carry_select_adder4bit.v
 // Project: LAB #2 - Arithmetic Circuits
 // Description: Design a 4-bit Carry-Select Adder with full-adder & ripple carry adder
 //  4-bit Carry-Select Adder TESTBENCH
 // Date:  Feb. 15, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_carry_select_adder4bit;
	reg [3:0] A, B;
	reg Cin;
	wire [3:0] sum;
	wire Cout;
	integer i,j;
	
	carry_select_adder4bit CSAuut(.sum(sum), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
	
		initial 
		begin

			Cin = 0;
			for(i = 4'b0000; i <= 4'b1111; i = i + 1) begin
				for(j = 4'b0000; j <= 4'b1111; j = j + 1) begin

				A = i; B = j; #10;
				$display("A=%b B=%b sum=%b Cin=%b Cout=%b",A,B,sum,Cin,Cout); #10;
				end
			end

			Cin = 1;
			for(i = 4'b0000; i <= 4'b1111; i = i + 1) begin
				for(j = 4'b0000;j <= 4'b1111; j = j + 1) begin	
			
				A = i; B = j; #10;
				$display("A=%b B=%b sum=%b Cin=%b Cout=%b",A,B,sum,Cin,Cout); #10;
				end
			end
		end
endmodule
