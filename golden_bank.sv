//
// Verilog Module StimulusProject_lib.golden_bank
//
// Created:
//          by - ord90.UNKNOWN (DESKTOP-6Q7AESD)
//          at - 18:12:08 07/12/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
  
  module golden_bank #(  
//PARAMETERS declaration
  parameter AMBA_WORD       = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH      = 32)
( 
   // Port Declarations
   Interface.goldenbank goldenbnk
);
initial begin
goldenbnk.SEL='0;
goldenbnk.DATA_IN='0;
goldenbnk.CODEWORD_WIDTH='0;
goldenbnk.NOISE='0;
end  
  
always @ (*)
  begin :BANK_REG_LOGIC
    if(goldenbnk.rst==0)begin 
      goldenbnk.SEL='b0;
      goldenbnk.DATA_IN='b0;
      goldenbnk.CODEWORD_WIDTH='b0;
      goldenbnk.NOISE='b0;
    end   
    else if(goldenbnk.pwrite==1 && goldenbnk.psel==1 && goldenbnk.penable==1) begin    
      if(goldenbnk.paddr[3:0]==4'h0)
      goldenbnk.SEL=goldenbnk.pwdata;
      else if(goldenbnk.paddr[3:0]==4'h4)
      goldenbnk.DATA_IN=goldenbnk.pwdata;
      else if(goldenbnk.paddr[3:0]==4'h8)
      goldenbnk.CODEWORD_WIDTH=goldenbnk.pwdata;
      else if(goldenbnk.paddr[3:0]==4'hc)
      goldenbnk.NOISE=goldenbnk.pwdata;
    end
    
    // read section
    if(goldenbnk.pwrite==0 && goldenbnk.psel==1 && goldenbnk.penable==1) begin
      if(goldenbnk.paddr=='h0)
      goldenbnk.g_prdata=goldenbnk.SEL;
      else if(goldenbnk.paddr=='h4)
      goldenbnk.g_prdata=goldenbnk.DATA_IN;
      else if(goldenbnk.paddr=='h8)
      goldenbnk.g_prdata=goldenbnk.CODEWORD_WIDTH;
      else if(goldenbnk.paddr=='hc)
      goldenbnk.g_prdata=goldenbnk.NOISE;
      else 
      goldenbnk.g_prdata='bx; 
    end
      else 
      goldenbnk.g_prdata='bx;
   // end
    end
  

endmodule
