 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tb_comparator_4bit.v
 // Project: LAB #3 - Combinational Circuits
 // Description: Design a 4-bit Comparator
 //   Comparator 4bit TESTBENCH
 // Date:  Feb. 28, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_comparator_4bit;
	reg sign;
	reg [3:0] A, B;
	wire equals;
	wire greater_than;
	wire less_than;
	integer i,j;
	
	comparator_4bit UUT(.sign(sign), .A(A), .B(B), .equals(equals), .greater_than(greater_than), .less_than(less_than));
	
	initial
		begin
		
		sign = 0;
			for(i = 4'b0000; i <= 4'b1111; i = i + 1) begin
				for(j = 4'b0000; j <= 4'b1111; j = j + 1) begin
				A = i; B = j; #10;
				$display("sign=%b A=%b B=%b equals=%b greater_than=%b less_than=%b",sign,A,B,equals,greater_than, less_than); #10;
				end
			end

		sign = 1;
			for(i = 4'b0000; i <= 4'b1111; i = i + 1) begin
				for(j = 4'b0000;j <= 4'b1111; j = j + 1) begin
				A = i; B = j; #10;
				$display("sign=%b A=%b B=%b equals=%b greater_than=%b less_than=%b",sign,A,B,equals,greater_than, less_than); #10;
				end
			end
		end
endmodule
