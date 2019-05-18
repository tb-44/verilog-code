 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: mux8to1.v
 // Project: LAB #5 - Synchronous Sequential Circuits
 // Description: Design a Universal Shift Register (USR)
 //   multiplexor 8 to 1 Module (Behavioral)
 // Date:  Apr. 5, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module mux8to1(X,S,Y);
	input [7:0] X;
	input [2:0] S;
	output reg Y;
	
	always @ (*)
		begin
			case(S)
				
				//hold
				3'b000:
					begin
						Y = X[0];
					end
				
				//circular shift right
				3'b001: 
					begin
						Y = X[1];
					end
				
				//circular shift left
				3'b010: 
					begin
						Y = X[2];
					end
				
				//Logical shift right
				3'b011: 
					begin
						Y = X[3];
					end
				
				//Logical shift left
				3'b100: 
					begin
						Y = X[4];
					end
				
				//Arithmetic shift right
				3'b101: 
					begin
						Y = X[5];
					end
				
				//Arithmetic shift left
				3'b110: 
					begin
						Y = X[6];
					end
				
				//Load
				3'b111: 
					begin
						Y = X[7];
					end
			endcase
		end
endmodule
