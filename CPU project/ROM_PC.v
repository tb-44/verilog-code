 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: ROM_PC.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   ROM Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module ROM_PC(reset, clk, address,pc_enable, write_data);
	input reset, clk, pc_enable;
	input [3:0] address;
	output reg [7:0] write_data;
	
	always @ (*)
		begin
			if (pc_enable) begin
			case (address)
				0:  write_data <= 8'b00000011; 
				1:  write_data <= 8'b00011100; 
				2:  write_data <= 8'b01001111; 
				3:  write_data <= 8'b00101010; 
				4:  write_data <= 8'b00111111; 
				5:  write_data <= 8'b11000100; 
				6:  write_data <= 8'b00000000;
				7:  write_data <= 8'b00000000;
				8:  write_data <= 8'b00001111;
				9:  write_data <= 8'b00010101;
				10:  write_data <= 8'b01001111;
				11:  write_data <= 8'b10000111;
				12:  write_data <= 8'b00110101;
				13:  write_data <= 8'b11110011;
				14:  write_data <= 8'b11011010;
				15:  write_data <= 8'b01011111;
				default:  write_data <= 8'b0;
			endcase
			end
			else
				write_data <= 8'b0;
		end
endmodule
