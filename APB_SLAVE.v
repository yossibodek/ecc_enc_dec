//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//

//sacling for simulations
// this module serves as a link between the system and the bus
// it recivies all the data from the bus
// it creates the APB protocol for transferring data FSM
`resetall
`timescale 1ns/10ps
module APB_SLAVE
  #( parameter AMBA_WORD=32,
   parameter AMBA_ADDR_WIDTH=20)
   //I/O PORT DECLARTION
(
  input wire clk,
  input wire rst,
  input wire PWRITE,
  input wire PSEL,
  input wire PENABLE,
  //output reg acs,
  //output wire PREAD_OUT,
  output wire PWRITE_OUT
  );
   //INTERNAL WIRES DECLARATION
   wire [1:0] i_state;
   

   //instantaion  
     fsm_32  state_machine  (.current_state(i_state),.clk(clk),.rst_n(rst),.PSEL(PSEL),.PENABLE(PENABLE));
     assign PWRITE_OUT =(i_state==2'b01) ? PWRITE :1'bx;
     
endmodule  
 
  
 
 
 // fsm of the apb protocol 
module fsm_32 
(output reg [1:0] current_state,
input wire PSEL,
input wire PENABLE,
 input wire clk,
 input wire rst_n);
  parameter [1:0] IDLE = 2'b00,  //idle state
                  SETUP = 2'b01,  // setup state
                  ACCESS_S = 2'b10; //access state
//internal wires
  reg [1:0] next_state;
  
//switching between states    
  always @(posedge clk or negedge rst_n)
 begin: FSM
  if (!rst_n) 
  current_state <= IDLE;
  else 
  current_state <= next_state;
end
always @(current_state or PSEL or PENABLE)
begin: state
case (current_state)
  
IDLE:begin    // idle state
if (PSEL==1'b1 && PENABLE==1'b0)    // switch state if psel and penable are on
 next_state = SETUP;

else 
next_state = IDLE;
end

SETUP: begin  // setup state
 next_state = ACCESS_S;
 end

ACCESS_S: begin // access state
if (PSEL==1'b1 && PENABLE== 1'b0) // switch state if psel in on and penable is low
next_state = SETUP;
else 
next_state = IDLE;
end
default: begin
next_state = IDLE; 
end


endcase
end

endmodule
