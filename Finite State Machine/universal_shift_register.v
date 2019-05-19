 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: universal_shift_register.v
 // Project: Finite State Machine (FSM) 
 // Description: Design an FSM to control USR
 //   USR Module
 // Date:  Apr. 22, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module universal_shift_register(Li, Si, clk, reset, Q_out);
	input [3:0] Li;
	input [2:0] Si;
	input clk, reset;
	output reg [3:0] Q_out;
	
	always @ (posedge clk, posedge reset)
		begin
			case (Si)
				3'b000:
					begin
						Q_out <= Li;
					end
				
				3'b001: 
					begin
						Q_out[3] <= Li[0];
						Q_out[2] <= Li[3];
						Q_out[1] <= Li[2];
						Q_out[0] <= Li[1];
					end
					
				3'b010: 
					begin
						Q_out[3] <= Li[2];
						Q_out[2] <= Li[1];
						Q_out[1] <= Li[0];
						Q_out[0] <= Li[3];
					end
					
				3'b011: 
					begin
						Q_out[3] <= 1'b0;
						Q_out[2] <= Li[3];
						Q_out[1] <= Li[2];
						Q_out[0] <= Li[1];
					end
				
				3'b100: 
					begin
						Q_out[3] <= Li[2];
						Q_out[2] <= Li[1];
						Q_out[1] <= Li[1];
						Q_out[0] <= 1'b0;
					end
					
				3'b101: 
					begin
						Q_out[3] <= Li[3];
						Q_out[2] <= Li[3];
						Q_out[1] <= Li[2];
						Q_out[0] <= Li[1];
					end
					
				3'b110: 
					begin
						Q_out[3] <= Li[2];
						Q_out[2] <= Li[1];
						Q_out[1] <= Li[0];
						Q_out[0] <= 1'b0;
					end
					
				3'b111: 
					begin
						Q_out <= Li;
					end
			endcase
	   end
endmodule
