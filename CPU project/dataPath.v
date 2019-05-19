 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: dataPath.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   DataPath Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module dataPath(reset, clk, Data, op_code, bus_wires, data_in, R0_out, 
                R1_out, R2_out, R3_out, Store_out, R0_buff, R1_buff, R2_buff,
                     R3_buff, Done, LEDs, ALU_in_Ext, ALU_out_Ext, alu_open);
                     
    input reset, clk;
    input [1:0] op_code; 
    input [3:0] Data;  
    
    //receive input control signals 
    input data_in, R0_out, R1_out, R2_out, R3_out, Store_out;
    input R0_buff, R1_buff, R2_buff, R3_buff, Done, ALU_in_Ext, ALU_out_Ext, alu_open;
    
    output tri [3:0] bus_wires;
    output [3:0] LEDs;
    wire [3:0] R0, R1, R2, R3, ALU_result, Q, ALU_out;
    
    //DATA (4-bit input instruction)
    tristate_buffer Data_0(Data, data_in, bus_wires);

    //Registers with tristate buffers
    tristate_buffer R0_out_buff(R0, R0_buff, bus_wires);
    tristate_buffer R1_out_buff(R1, R1_buff, bus_wires);
    tristate_buffer R2_out_buff(R2, R2_buff, bus_wires);
    tristate_buffer R3_out_buff(R3, R3_buff, bus_wires);
    
    reg_4bit reg_0(bus_wires, R0_out, reset, clk, R0);
    reg_4bit reg_1(bus_wires, R1_out, reset, clk, R1);
    reg_4bit reg_2(bus_wires, R2_out, reset, clk, R2);
    reg_4bit reg_3(bus_wires, R3_out, reset, clk, R3);
    
    //STORE with LEDs
    reg_4bit reg_store(bus_wires, Store_out, reset, clk, LEDs);
    
    //ALU
    reg_4bit reg_ALU_in(bus_wires, ALU_in_Ext, reset, clk, Q);
    ALU_4bit ALU_0(Q, bus_wires, op_code, clk, ALU_result);
    reg_4bit reg_ALU_out(ALU_result, ALU_out_Ext, reset, clk, ALU_out);
    tristate_buffer ALU_out_buff(ALU_out, alu_open, bus_wires);

endmodule   
	

	
	
