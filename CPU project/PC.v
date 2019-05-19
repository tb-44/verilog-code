 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: PC.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   Program Counter Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module PC(reset, clk, pc_enable, pc_out);
    input reset, clk, pc_enable;
    output [3:0] pc_out;
    reg [3:0] pc_out;
    
    wire clk,reset,enable;

    always @ (posedge clk or posedge reset)
        begin
            if(reset == 1'b1)
                pc_out <= 0;
            else if (pc_enable == 1'b1)
                pc_out <= pc_out + 1;
        end

endmodule
