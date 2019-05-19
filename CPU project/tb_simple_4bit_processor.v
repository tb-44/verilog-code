 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tb_simple_4bit_processor.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   CPU TESTBENCH
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module tb_simple_4bit_processor;
	reg reset,clk, execute, switch_mode, pc_enable;
	reg [7:0] instruction;
	wire [3:0] LEDs;
	wire Done;
	
	simple_4bit_processor SIMPLE_CPU(.reset(reset),.clk(clk),.execute(execute),.switch_mode(switch_mode),.pc_enable(pc_enable),.instruction(instruction), 
												.LEDs(LEDs), .Done(Done));
	
	always #10 clk <= ~clk;
	
	initial
		begin
		
		clk = 0; reset = 0; 
		switch_mode = 1; pc_enable = 0; #20;
		reset = 1; #25; 
		reset = 0; #20;

		instruction = 8'b00001010; #20;  //LOAD
		execute = 1; #25;
		execute = 0; #20;
		
		
		instruction = 8'b00010101; #20; //LOAD
		execute = 1; #20;
		execute = 0; #20;
		
		instruction = 8'b11000100; #20;  //ADD
		execute = 1; #20;
		execute = 0; #20;
		
		reset = 1; #20;  //RESET
		reset = 0; #20;
		
		instruction = 8'b00001111; #20;  //LOAD
		execute = 1; #25;
		execute = 0; #20;
		
		instruction = 8'b00010001; #20; //LOAD
		execute = 1; #20;
		execute = 0; #20;
		
		instruction = 8'b01000100; #20; // STORE
		execute = 1; #20;
		execute = 0; #20;
		
		
		instruction = 8'b10000100; #20; // MOVE
		execute = 1; #20;
		execute = 0; #20;
		
		reset = 1; #20; 
		reset = 0; #20;
		
		instruction = 8'b00001010; #20;  //LOAD 
		execute = 1; #20;
		execute = 0; #20;
		
		
		instruction = 8'b00010101; #20; //LOAD 
		execute = 1; #20;
		execute = 0; #20;

		
		instruction = 8'b11000110; #20;
		execute = 1; #20;
		execute = 0; #20;
		
		reset = 1; #20; 
		reset = 0; #20;

		instruction = 8'b11000111; #20;
		execute = 1; #20;
		execute = 0; #20;

		reset = 1; switch_mode = 0; pc_enable = 1; #20;  // Run the RUN MODE
		reset = 0; #20;
		execute = 1; #20;

		$display("instruction=%b execute=%b LEDs=%b Done=%b", instruction, execute, LEDs, Done); #360;
		$stop;
		
		end
endmodule
