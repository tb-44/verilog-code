 ///////////////////////////////////////////////////////////////////////////////
 //
 // Author:  Trent Bennett
 // Class:  CS/ECE 3700
 // Module: fsm_control.v
 // Project: Finite State Machine (FSM) 
 // Description: Design an FSM to control USR
 //   FSM Control Module
 // Date:  Apr. 22, 2018
 //
 ///////////////////////////////////////////////////////////////////////////////

 module fsm_control(clk,reset,exe,slide,L,S);
    input clk, reset, exe;
    input [1:0] slide;
    
    reg [1:0] ld1;
    reg [5:0] state, next_state;
    
    output reg [2:0] S;
    output reg [3:0] L;
    
    parameter S0 = 6'b000000, EX0 = 6'b000001, SR = 6'b000010, SL = 6'b000011, LD = 6'b000100, 
    EX1 = 6'b000101, EX2 = 6'b000110, EX3 = 6'b000111, CSR = 6'b001000, LSR = 6'b001001, 
    ASR = 6'b001010, CSL = 6'b001011, LSL = 6'b001100, ASL = 6'b001101, EXOP0 = 6'b001110, 
    EXOP1 = 6'b001111, EXOP2 = 6'b010000, EXOP3 = 6'b010001, EXOP4 = 6'b010010, 
    EXOP5 = 6'b010011, OP0 = 6'b010100, OP1 = 6'b010101, OP2 = 6'b010110, OP3 = 6'b010111, 
    OP4 = 6'b011000, OP5 = 6'b011001, OP6 = 6'b011010, OP7 = 6'b011011, OP8 = 6'b011100, 
    OP9 = 6'b011101, OP10 = 6'b011110, OP11 = 6'b011111, OP12 = 6'b100000, 
    OP13 = 6'b100001, OP14 = 6'b100000, OP15 = 6'b100001, OP16 = 6'b100010, OP17 = 6'b100011,
    OP18 = 6'b100100, OP19 = 6'b100101, OP20 = 6'b100010, OP21 = 6'b100011, OP22 = 6'b100100,  
    OP23 = 6'b100101, LD0 = 6'b100110, LD1 = 6'b100111, 
    LD2 = 6'b101000, LD3 = 6'b101001, EX4 = 6'b101010;

    always @ (*)
        begin
            case (state)
                
               S0: if(!exe) 
                  next_state <= EX0; 
						
					EX0: if(exe) 
                        case (slide)
                           01:  next_state <= SR;
                           10:  next_state <= SL;
                           11:  next_state <= LD;
                           default: next_state <= S0;
                        endcase
								
               SR: if(!exe) 
                     next_state <= EX1; 
							
               SL: if(!exe)
                     next_state <= EX2; 
							
               LD: if(!exe) 
                     next_state <= EX3; 
							
               EX1: if(exe) 
                       case (slide)
                          01:  next_state <= CSR;
                          10:  next_state <= LSR; 
                          11:  next_state <= ASR; 
                          default:  next_state <= EX1;
                        endcase
							
               EX2: if(exe) 
                        case (slide)
                           01:  next_state <= CSL;
                           10:  next_state <= LSL;
                           11:  next_state <= ASL;
                           default: next_state <= EX2;
                        endcase
								
               EX3:  if(exe) 
                        case (slide)
                           00:  next_state <= LD0;
                           01:  next_state <= LD1;
                           10:  next_state <= LD2;
                           11:  next_state <= LD3;
                           default: next_state <= EX3;
                        endcase
								
               CSR: if(!exe) 
                       next_state <= EXOP0; 
							  
               LSR: if(!exe) 
                        next_state <= EXOP1; 
								
               ASR: if(!exe) 
                        next_state <= EXOP2; 
								
               CSL: if(!exe) 
                        next_state <= EXOP3; 
								
               LSL: if(!exe) 
                        next_state <= EXOP4;    
								
               ASL:  if(!exe) 
                        next_state <= EXOP5;
								
               EXOP0: if(exe)
                        case (slide)
                           00:  next_state <= OP0;
                           01:  next_state <= OP1;
                           10:  next_state <= OP2;
                           11:  next_state <= OP3;
                           default: next_state <= S0;
                        endcase
								
               EXOP1: if(exe) 
                        case (slide)
                           00:  next_state <= OP4;
                           01:  next_state <= OP4;
                           10:  next_state <= OP6;
                           11:  next_state <= OP7;
                           default: next_state <= S0;
                        endcase
                               
										 
               EXOP2: if(exe) 
                        case (slide)
                           00:  next_state <= OP8;
                           01:  next_state <= OP9;
                           10:  next_state <= OP10;
                           11:  next_state <= OP11;
                           default: next_state <= S0;
                        endcase
								
               EXOP3: if(exe)
                        case (slide)
                           00:  next_state <= OP12;
                           01:  next_state <= OP13;
                           10:  next_state <= OP14;
                           11:  next_state <= OP15;
                           default: next_state <= S0;
                        endcase
								
               EXOP4: if(exe) 
                        case (slide)
                           00:  next_state <= OP16;
                           01:  next_state <= OP17;
                           10:  next_state <= OP18;
                           11:  next_state <= OP19;
                           default: next_state <= S0;
                        endcase
                              
										
               EXOP5: if(exe) 
                        case (slide)
                           00:  next_state <= OP20;
                           01:  next_state <= OP21;
                           10:  next_state <= OP22;
                           11:  next_state <= OP23;
                           default: next_state <= S0;
                        endcase
                               
										 
               OP0: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP1: if(!exe) begin
                        S <= 3'b001; L <= 4'b1010; next_state <= S0; end
								
               OP2: if(!exe) begin
                        S <= 3'b001; L <= 4'b1010; next_state <= OP1; end
								
               OP3: if(!exe) begin
                        S <= 3'b001; L <= 4'b1010; next_state <= OP2; end 
								
               OP4: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP5: if(!exe) begin
                        S <= 3'b011; L <= 4'b1010; next_state <= S0; end
								
               OP6: if(!exe) begin
                        S <= 3'b011; L <= 4'b0011; next_state <= OP5; end
								
               OP7: if(!exe) begin
                        S <= 3'b011; L <= 4'b1010; next_state <= OP6; end
								
               OP8: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP9: if(!exe) begin
                        S <= 3'b101; L <= 4'b1010; next_state <= S0; end
								
               OP10: if(!exe) begin
                        S <= 3'b101; L <= 4'b1010; next_state <= OP9; end
								
               OP11: if(!exe) begin
                        S <= 3'b101; L <= 4'b1010; next_state <= OP10; end
								
               OP12: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP13: if(!exe) begin
                        S <= 3'b010; L <= 4'b1010; next_state <= S0; end
								
               OP14: if(!exe) begin
                        S <= 3'b010; L <= 4'b1010; next_state <= OP13; end
								
               OP15: if(!exe) begin
                        S <= 3'b010; L <= 4'b1010; next_state <= OP14; end
								
               OP16: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP17: if(!exe) begin
                        S <= 3'b100; L <= 4'b1010; next_state <= S0; end
								
               OP18: if(!exe) begin
                        S <= 3'b001; L <= 4'b1010; next_state <= S0; end
								
               OP19: if(!exe) begin
                        S <= 3'b100; L <= 4'b1010; next_state <= OP18; end
								
               OP20: if(!exe) begin
                        S <= 3'b000; L <= 4'b1010; next_state <= S0; end
								
               OP21: if(!exe) begin
                        S <= 3'b110; L <= 4'b1010; next_state <= S0; end
								
               OP22: if(!exe) begin
                        S <= 3'b110; L <= 4'b1010; next_state <= OP21; end
								
               OP23: if(!exe) begin
                        S <= 3'b110; L <= 4'b1010; next_state <= OP22; end
								
               LD0:  if(!exe) begin
                        ld1 <= 2'b00;
                        next_state <= EX4; end
								
               LD1:  if(!exe) begin
                        ld1 <= 2'b01;
                        next_state <= EX4; end
								
               LD2:  if(!exe) begin
                        ld1 <= 2'b10;
                        next_state <= EX4; end 
								
               LD3:  if(!exe) begin
                        ld1 <= 2'b11;
                        next_state <= EX4; end 
								
               EX4:  if(exe) begin
                        case (slide)
                           00:   begin S <= 3'b111; L <= {2'b00,ld1}; next_state <= S0; end
                           01:   begin S <= 3'b111; L <= {2'b01,ld1}; next_state <= S0; end
                           10:   begin S <= 3'b111; L <= {2'b10,ld1}; next_state <= S0; end
                           11:   begin S <= 3'b111; L <= {2'b11,ld1}; next_state <= S0; end
                           default: next_state <= S0;
                        endcase
                     end
               default:  next_state <= S0;
            endcase 
        end
        
      always @ (posedge clk, posedge reset)
         begin
            if (reset) begin
               state <= S0; 
            end
                    
            else begin
               state <= next_state; 
            end
      end
endmodule
