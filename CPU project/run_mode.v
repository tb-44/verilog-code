 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: run_mode.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   Run Module Submodule (Hierarchal)
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module run_mode(clk, reset, switch_mode, pc_enable, instruction, instruction_out);
    input clk, reset, switch_mode, pc_enable;
    input [7:0] instruction;
    output [7:0] instruction_out;

    wire [3:0] pc_out;
    wire [7:0] Ain, Bin;
    wire [3:0] address;
    wire [7:0] write_data;
    
    PC pc_count0(.reset(reset), .clk(clk), .pc_enable(pc_enable),.pc_out(pc_out));

    ROM_PC rom_instruction(.reset(reset), .clk(clk),.address(pc_out), 
                           .pc_enable(pc_enable),.write_data(write_data));

    mux2to1_8bit mux_0(.Ain(write_data),.Bin(instruction),
                       .sel(switch_mode),.instruction_out(instruction_out));

endmodule
