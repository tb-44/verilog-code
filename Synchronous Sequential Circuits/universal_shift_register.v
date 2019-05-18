 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: mux8to1.v
 // Project: LAB #5 - Synchronous Sequential Circuits
 // Description: Design a Universal Shift Register (USR)
 //   USR Top Module (Hierarchal)
 // Date:  Apr. 5, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module universal_shift_register(L,S,clk,Q);
	input [3:0] L;
	input [2:0] S;
	input clk;
	output [3:0] Q;
	wire [3:0] Dw;

	mux8to1 mux_A0(.X({L[0],Q[1],Q[0],Q[1],1'b0,Q[1],Q[3],Q[0]}), .S(S), .Y(Dw[0]));
	mux8to1 mux_A1(.X({L[1],Q[2],Q[0],Q[2],Q[0],Q[2],Q[0],Q[1]}), .S(S), .Y(Dw[1]));
	mux8to1 mux_A2(.X({L[2],Q[3],Q[1],Q[3],Q[1],Q[3],Q[1],Q[2]}), .S(S), .Y(Dw[2]));
	mux8to1 mux_A3(.X({L[3],1'b0,Q[2],1'b0,Q[2],Q[0],Q[2],Q[3]}), .S(S), .Y(Dw[3]));

	D_FF dff0(.D(Dw[3]), .clk(clk),.Q(Q[0]));
	D_FF dff1(.D(Dw[2]), .clk(clk),.Q(Q[1]));
	D_FF dff2(.D(Dw[1]), .clk(clk),.Q(Q[2]));
	D_FF dff3(.D(Dw[0]), .clk(clk),.Q(Q[3]));
	
endmodule
