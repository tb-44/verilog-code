 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: tb_fsm_main_control.v
 // Project: Finite State Machine (FSM) 
 // Description: Design an FSM to control USR
 //   Main Controller TESTBENCH
 // Date:  Apr. 22, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_fsm_main_control;
	reg clk;
	reg reset;
	reg exe;
	reg [1:0] slide;

	wire [3:0] Q_out;
	
	fsm_main_control FSM_0(.clk(clk), .reset(reset), .exe(exe), .slide(slide), .Q_out(Q_out));
	
	always #5 clk <= ~clk;

		initial
		begin
			 $display("First Simulation begins...");
            clk = 0; reset = 1; exe = 0; slide = 2'b01;
            #10;
            reset = 0;
            #15;
            exe = 1; 
            #10;
            exe = 0; 
            #10;
            exe = 1; 
            #10;
            exe = 0;
            #10;
            exe = 1; 
            #10; 
            exe = 0;
            #10;
				$display("Q_out=%b",Q_out);
            $display("First Simulation ENDS...");
			#50;		
		end
endmodule
