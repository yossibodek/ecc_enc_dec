//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//
`resetall
`timescale 1ns/10ps

module REG_BANK
  //PARAMETERS declaration
#( parameter AMBA_WORD=32,
   parameter AMBA_ADDR_WIDTH=20)
   //I/O PORT DECLARTION
(
  input wire clk,
  input wire rst,
  //input wire acs,
  input wire [AMBA_ADDR_WIDTH-1:0] PADDR, // address of the required register
  input wire [AMBA_WORD-1:0] PWDATA, // writing data
  input wire WRITE,// write or read enabler
  //input wire READ,
  output reg [AMBA_WORD-1:0] PRDATA, // read data to the bus line
  output wire[AMBA_WORD-1:0] SEL,//spreads out the opration to do
  output wire [AMBA_WORD-1:0] DATA_IN, // data to send out to the system
  output wire [AMBA_WORD-1:0] CODEWORD_WIDTH, // codeword width register output
  output wire operation_done, // a valid bit which tells us if the operation is done
  output wire [AMBA_WORD-1:0] NOISE // noise that is being added to encoded words
  );
  //INTERNAL WIRES DECLARATION
  reg [3:0] EN; // a line used to send enables to diffrent registers
  //MODULE CONNECTIONS  
  // control register declaration
  AMBA_REG ctrl   (.DATA(PWDATA[AMBA_WORD-1:0]),.clk(clk),.rst(rst),.EN(EN[0]),.DATA_OUT(SEL[AMBA_WORD-1:0]));
  // data in register declaration
  AMBA_REG datain (.DATA(PWDATA[AMBA_WORD-1:0]),.clk(clk),.rst(rst),.EN(EN[1]),.DATA_OUT(DATA_IN[AMBA_WORD-1:0]));
  // code word register declaration
  AMBA_REG codewordwidth (.DATA(PWDATA[AMBA_WORD-1:0]),.clk(clk),.rst(rst),.EN(EN[2]),.DATA_OUT(CODEWORD_WIDTH[AMBA_WORD-1:0]));
  // noise register declaration
  AMBA_REG noise  (.DATA(PWDATA[AMBA_WORD-1:0]),.clk(clk),.rst(rst),.EN(EN[3]),.DATA_OUT(NOISE[AMBA_WORD-1:0]));
  
  //assigning
  assign operation_done = EN[0];
  //enalbe mux selector this part tells us which register we should enable for both reading and writing
always @ (*)
  begin :BANK_REG_LOGIC

     if ( WRITE)   // if in access state and write mode
    begin
      PRDATA='bx;
      if(PADDR[3:0]==4'h0)
      EN=4'b0001;
      else if(PADDR[3:0]==4'h4)
      EN=4'b0010;
      else if(PADDR[3:0]==4'h8)
      EN=4'b0100;
      else if(PADDR[3:0]==4'hC)
      EN=4'b1000;
      else
      EN=4'b0000;
    end
    // read section
    else if( ~WRITE)  // if in access state and read mode
    begin
      EN=4'b0000;
      if(PADDR[3:0]==4'h0)
      PRDATA=SEL;
      else if(PADDR[3:0]==4'h4)
      PRDATA=DATA_IN;
      else if(PADDR[3:0]==4'h8)
      PRDATA=CODEWORD_WIDTH;
      else if(PADDR[3:0]==4'hC)
      PRDATA=NOISE; 
      else 
      PRDATA='bx;
    end
    else
    begin
   EN=4'b0000; 
   PRDATA='bx;
 end 
  end
endmodule

// generic register made for our purpose 
module AMBA_REG
    //PARAMETERS
#(parameter AMBA_WORD=32)
(input wire [AMBA_WORD-1:0] DATA,
input wire clk,
input wire rst,
input wire EN,
output reg [AMBA_WORD-1:0] DATA_OUT);
  always @ (posedge clk or negedge rst)
  begin :REG_LOGIC
    if(~rst)
    begin
    DATA_OUT<= 0;
    end
    else if(EN==1'b1)
    begin
    DATA_OUT<=DATA;
    end
   
  end
endmodule

