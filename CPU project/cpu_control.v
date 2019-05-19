 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: cpu_control.v
 // Project: Project - 4-bit CPU (processor)
 // Description: Design a simple 4-bit CPU (Processor)
 //   CPU Controller Module
 // Date:  Apr. 31, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

module cpu_control(reset, clk, execute, instruction, Done, Data, ALU_op,
                   data_in, R0_out, R1_out, R2_out, R3_out, Store_out, R0_buff, R1_buff,
                   R2_buff, R3_buff, ALU_in_Ext, ALU_out_Ext, alu_open);  
                         
    input reset, clk, execute;
    input [7:0] instruction;

    //control signals to send to datapath 
    output reg R0_buff, R1_buff, R2_buff, R3_buff;
    output reg data_in, R0_out, R1_out, R2_out, R3_out, Store_out, Done;
    output reg ALU_in_Ext, ALU_out_Ext, alu_open;
    
    //send data and ALU_op to datapath
    output [3:0] Data;
    output [1:0] ALU_op;
    
    reg [2:0] state, next_state;
    
    parameter [2:0] IDLE = 3'b000, LOAD = 3'b001, STORE = 3'b010, MOVE = 3'b011, 
    ALU = 3'b100, ALU2 = 3'b101, ALU3 = 3'b110, STOPSTATE = 3'b111;

    assign ALU_op = instruction[1:0];
    assign Data = instruction[3:0];
    
    always @ (posedge clk)
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
            
    always @ (*)
        begin
        
          data_in = 1'b0; R0_out = 1'b0; R1_out = 1'b0; R2_out = 1'b0; R3_out = 1'b0; Done = 1'b0; 
          Store_out = 1'b0; R0_buff = 1'b0; R1_buff = 1'b0; R2_buff = 1'b0; R3_buff = 1'b0; 
          ALU_in_Ext = 1'b0; ALU_out_Ext = 1'b0; alu_open = 1'b0;

                case (state)
                        
                        IDLE:  
                                begin
                                    case (instruction[7:6])
                                        2'b00:  begin next_state = LOAD; end
                                        2'b01:  begin next_state = STORE; end
                                        2'b10:  begin next_state = MOVE; end
                                        2'b11:  begin next_state = ALU; end
                                        default:  begin next_state = IDLE; end
                                    endcase
                                end
                                    
                        LOAD:  begin
                                    
                                    //case Rx
                                    case (instruction[5:4])
                                        2'b00:  begin R0_out = 1'b1; data_in = 1'b1;  
                                                      Done = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b01:  begin R1_out = 1'b1; data_in = 1'b1; 
                                                      Done = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b10:  begin R2_out = 1'b1; data_in = 1'b1; 
                                                      Done = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b11:  begin R3_out = 1'b1; data_in = 1'b1; 
                                                      Done = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        default:  begin next_state = IDLE; end
                                    endcase
                                 end
                                    
                        STORE: begin
                                    
                                    //case Rx
                                    case (instruction[5:4])
                                        2'b00:  begin R0_buff = 1'b1; R0_out = 1'b1;  
                                                      Done = 1'b1; Store_out = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b01:  begin R1_buff = 1'b1; R1_out = 1'b1;
                                                      Done = 1'b1; Store_out = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b10:  begin R2_buff = 1'b1; R2_out = 1'b1;
                                                      Done = 1'b1; Store_out = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        2'b11:  begin R3_buff = 1'b1; R3_out = 1'b1;
                                                      Done = 1'b1; Store_out = 1'b1; 
                                                      next_state = STOPSTATE; end
                                                      
                                        default:  begin next_state = IDLE; end
                                    endcase
                                 end
                                 
                        MOVE: begin
                                    case (instruction[5:4])
                                        //Rx = R0
                                        2'b00:  begin 
                                                    //Ry = R1
                                                    case (instruction[3:2])
                                                        2'b00:  begin next_state = IDLE; end

                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                        R0_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                        R0_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                        R0_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE;  end
                                                                      
                                                        default:  begin next_state = IDLE; end
                                                    endcase
                                                  end
                                                  
                                        //Rx = R1
                                        2'b01:  begin 
                                                    //Ry = R0
                                                    case (instruction[3:2])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                        R1_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        2'b01:  begin next_state = IDLE; end
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                        R1_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                        R1_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        default:  begin next_state = IDLE; end
                                                    endcase
                                                  end
                                        
                                        //Rx = R2
                                        2'b10:  begin 
                                                    //Ry = R0
                                                    case (instruction[3:2])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                      R2_out = 1'b1; Store_out = 1'b1;
                                                                      Done = 1'b1; next_state = STOPSTATE; end
                                                                      
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                      R2_out = 1'b1; Store_out = 1'b1;
                                                                      Done = 1'b1; next_state = STOPSTATE; end
                                                                      
                                                        2'b10:  begin next_state = IDLE; end
                                                        
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                      R2_out = 1'b1; Store_out = 1'b1;
                                                                      Done = 1'b1; next_state = STOPSTATE;  end
                                                                      
                                                        default:  begin next_state = IDLE; end
                                                    endcase
                                                  end
                                                  
                                        //Rx = R3
                                        2'b11:  begin 
                                                    //Ry
                                                    case (instruction[3:2])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                        R3_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                        next_state = STOPSTATE;  end
                                                                        
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                        R3_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                        next_state = STOPSTATE; end
                                                                        
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                        R3_out = 1'b1; 
                                                                      Store_out = 1'b1; Done = 1'b1; 
                                                                      next_state = STOPSTATE; end
                                                                      
                                                        2'b11:  begin next_state = STOPSTATE;  end
                                                        default:  begin next_state = IDLE; end
                                                    endcase
                                                  end 
                                        default:  begin next_state = IDLE; end
                                    endcase
                                end
                                
                        ALU:  begin
                                    case (instruction[1:0])
                                        
                                        //ADD
                                        2'b00:  begin
                                                    case (instruction[5:4])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        default:  begin next_state = ALU; end
                                                    endcase
                                                end
                                        
                                        //SUB
                                        2'b01:  begin
                                                    case (instruction[5:4])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        default:  begin next_state = ALU; end
                                                    endcase
                                                end
                                        
                                        //AND
                                        2'b10:  begin
                                                    case (instruction[5:4])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                      Store_out = 1'b1; ALU_in_Ext = 1'b1;
                                                                      next_state = ALU2; end
                                                                      
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                      Store_out = 1'b1; ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                      Store_out = 1'b1; ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                      Store_out = 1'b1; ALU_in_Ext = 1'b1;
                                                                        next_state = ALU2; end
                                                                        
                                                        default:  begin next_state = ALU; end
                                                    endcase
                                                end
                                        
                                        //NOT
                                        2'b11:  begin
                                                    case (instruction[5:4])
                                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                      next_state = ALU2; end
                                                                    
                                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                      next_state = ALU2; end
                                                                      
                                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                      next_state = ALU2; end
                                                                      
                                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                                      ALU_in_Ext = 1'b1;
                                                                      next_state = ALU2; end
                                                                      
                                                        default:  begin next_state = ALU; end
                                                    endcase
                                                end
                                        default:  begin next_state = ALU; end
                                    endcase
                                end
                                
                        ALU2:  begin
                                    case (instruction[3:2])
                                        2'b00:  begin R0_out = 1'b1; R0_buff = 1'b1; 
                                                      Store_out = 1'b1; ALU_out_Ext = 1'b1; 
                                                      next_state = ALU3; end
                                                      
                                        2'b01:  begin R1_out = 1'b1; R1_buff = 1'b1; 
                                                      Store_out = 1'b1; ALU_out_Ext = 1'b1; 
                                                      next_state = ALU3; end
                                                      
                                        2'b10:  begin R2_out = 1'b1; R2_buff = 1'b1; 
                                                      Store_out = 1'b1; ALU_out_Ext = 1'b1; 
                                                      next_state = ALU3; end
                                                      
                                        2'b11:  begin R3_out = 1'b1; R3_buff = 1'b1; 
                                                      Store_out = 1'b1; ALU_out_Ext = 1'b1; 
                                                      next_state = ALU3; end
                                                      
                                        default:  begin next_state = ALU; end
                                    endcase
                                end
                                
                        ALU3:  begin
                                    case (instruction[5:4])
                                        2'b00:  begin  ALU_out_Ext = 1'b1; alu_open = 1'b1; 
                                                       R0_out = 1'b1; Store_out = 1'b1; 
                                                       Done = 1'b1; next_state = STOPSTATE; end
                                                       
                                        2'b01:  begin  alu_open = 1'b1; R1_out = 1'b1; 
                                                       ALU_out_Ext = 1'b1;  Store_out = 1'b1; 
                                                       Done = 1'b1; next_state = STOPSTATE; end
                                                       
                                        2'b10:  begin  alu_open = 1'b1; R2_out = 1'b1; 
                                                       ALU_out_Ext = 1'b1; Store_out = 1'b1; 
                                                       Done = 1'b1; next_state = STOPSTATE; end
                                                       
                                        2'b11:  begin  alu_open = 1'b1; R3_out = 1'b1; 
                                                       ALU_out_Ext = 1'b1; Store_out = 1'b1; 
                                                       Done = 1'b1; next_state = STOPSTATE; end
                                                       
                                        default:  begin next_state = STOPSTATE; end
                                    endcase
                                end
                                
                        STOPSTATE:  begin Store_out = 1'b1; next_state = IDLE; end
                        default:  begin next_state = IDLE; end
                endcase
        end
endmodule
