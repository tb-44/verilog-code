 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: fsm_main_control.v
 // Project: Finite State Machine (FSM) 
 // Description: Design an FSM to control USR
 //   Main Controller Top Module (Hierarchal)
 // Date:  Apr. 22, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

 module fsm_main_control(clk, reset, exe, slide, Q_out);
	input clk, reset, exe;
	input [1:0] slide;
	
	wire [3:0] Li;
	wire [2:0] Si;
    wire [3:0] L;
	wire [2:0] S;
	output [3:0] Q_out;

	fsm_control FSM_0(.clk(clk), .reset(reset), .exe(exe), .slide(slide), .L(L), .S(S));
	universal_shift_register USR_0(.Li(L),.Si(S),.clk(clk),.reset(reset),.Q_out(Q_out));
	
endmodule
