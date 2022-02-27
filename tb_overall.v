//
// Verilog Module StimulusProject_lib.tb_top
//
// Created:
//          by - ord90.UNKNOWN (DESKTOP-6Q7AESD)
//          at - 17:31:56 07/12/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
module tb_overall #(
  parameter AMBA_WORD       = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH      = 32);

  Interface IF();

Stimulus  stm(
    .stim_bus(IF)
    );
    
Checker  chk(
      .chkbus(IF)
      );
GoldModel gld(
.goldenbus(IF)
);
golden_bank gldbnk(
.goldenbnk(IF)
);
    
Coverage covbus(
.covbus(IF)
);
//=================================================== DUT INSTANTATION
ecc_enc_dec ECC_ENC_DEC_inst
(
.clk (IF.clk),.rst(IF.rst),.PADDR(IF.paddr),.PWRITE(IF.pwrite),.PSEL(IF.psel),.PENABLE(IF.penable),
.PWDATA(IF.pwdata),.PRDATA(IF.prdata),.data_out(IF.data_out),.operation_done(IF.operation_done),.err_num(IF.num_of_errors)
);
//==================================================================== SHADOW REGISTERS INSTANTATION

//====================================================================

//========================================================================

  

//clk generator
initial begin : reset_generator_proc
  #10.2ps     IF.rst = 0;
  #10 IF.rst = 1;
end

always begin : clock_generator_proc
  #1 IF.clk = ~IF.clk;
end
endmodule
