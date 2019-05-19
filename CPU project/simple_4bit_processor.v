 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: simple_4bit_processor.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   CPU Top Module (Hierarchal)
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module simple_4bit_processor(reset, clk, execute, switch_mode, pc_enable, instruction, LEDs, Done);
    input reset, clk, execute, switch_mode, pc_enable;
    input [7:0] instruction;
    
    output [3:0] LEDs;
    output Done;
    
    wire [3:0] Data;
    wire [1:0] ALU_op;
    wire data_in, R0_out, R1_out, R2_out, R3_out, Store_out, R0_buff, R1_buff, R2_buff, R3_buff;
    wire ALU_in_Ext, ALU_out_Ext, alu_open, ALU_out;
    wire [3:0] bus_wires;
    wire [3:0] address;
    wire [7:0] instruction;
    wire [7:0] instruction_out;
    wire pc_enable;
    
    run_mode run_ROM(.clk(clk), .reset(reset), .switch_mode(switch_mode), 
                     .pc_enable(pc_enable),.instruction(instruction),
                     .instruction_out(instruction_out));
    
    cpu_control CPU_ctrl(.reset(reset), .clk(clk),    
                         .execute(execute),.instruction(instruction_out), .Done(Done), 
                         .Data(Data),.ALU_op(ALU_op),.data_in(data_in), 
                         .R0_out(R0_out), .R1_out(R1_out), .R2_out(R2_out), .R3_out(R3_out), 
                         .Store_out(Store_out),.R0_buff(R0_buff), .R1_buff(R1_buff),  
                         .R2_buff(R2_buff), .R3_buff(R3_buff), .ALU_in_Ext(ALU_in_Ext),
                         .ALU_out_Ext(ALU_out_Ext), .alu_open(alu_open));

                         
    dataPath DP(.reset(reset), .clk(clk), .Data(Data), .op_code(ALU_op), .bus_wires(bus_wires), 
               .data_in(data_in),.R0_out(R0_out), .R1_out(R1_out),.R2_out(R2_out), 
               .R3_out(R3_out), .Store_out(Store_out), .R0_buff(R0_buff),
               .R1_buff(R1_buff), .R2_buff(R2_buff), .R3_buff(R3_buff), .Done(Done), .LEDs(LEDs), 
               .ALU_in_Ext(ALU_in_Ext), .ALU_out_Ext(ALU_out_Ext), .alu_open(alu_open));

endmodule
