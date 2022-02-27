//
// Verilog Module StimulusProject_lib.vsgoldenmodel
//
// Created:
//          by - ord90.UNKNOWN (DESKTOP-6Q7AESD)
//          at - 11:34:59 07/12/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
module vsgoldenmodel #( 
   parameter AMBA_WORD=32, //size of the bus
   parameter AMBA_ADDR_WIDTH=20, //address size changes if we will work with more registers in the future
   parameter DATA_WIDTH=32) // the data width size for us to work with
   
( 
     Interface.vsgoldenmodel chkbus

);

integer count =0;
//read test
always @(negedge chkbus.pwrite) begin
  wait(chkbus.penable==1);
  @(negedge chkbus.clk);
  $display("***Reading Test Result***");
  count=0;
  for(int i=0;i<DATA_WIDTH;i++) begin
   if(chkbus.prdata[i]!= chkbus.g_prdata[i]) begin
     count=count+1;
     break;
   end
  end
  if(count>0)
  $display("failed at reading test DUT: %b Golden Model: %b",chkbus.prdata,chkbus.g_prdata);
  else
  $display("Good Job passed the reading test DUT: %b Golden Model: %b",chkbus.prdata,chkbus.g_prdata);
    $display("--------------------------------------------------------------------------------");
end

always @(posedge chkbus.operation_done) begin
    $display("***Writing Test Results***");
  count =0;
 // err number test
  count=0;
  for(int i=0;i<2;i++) begin
   if(chkbus.num_of_errors[i]!= chkbus.g_num_err[i]) begin
     count=count+1;
     break;
   end
  end
  if(count>0)
  $display("failed at error number test DUT: %d Golden Model: %d",chkbus.num_of_errors,chkbus.g_num_err[1 :0]);
  else
  $display("Good Job passed the error number test DUT: %d Golden Model: %d",chkbus.num_of_errors,chkbus.g_num_err[1 :0]);
    //$display("--------------------------------------------------------------------------------");


  //data out test
  for(int i=0;i<DATA_WIDTH;i++) begin
   if(chkbus.data_out[i]!= chkbus.g_data_out[i]) begin
     count=count+1;
   end
  end
  if(count>0 && chkbus.g_num_err!=2)
  $display("failed at data_out test DUT: %b Golden Model: %b",chkbus.data_out,chkbus.g_data_out);
  else
  if(chkbus.g_num_err==2)
  $display("Good Job passed the data_out test because the data isnt valid");
  else
  $display("Good Job passed the data_out test DUT: %b Golden Model: %b",chkbus.data_out,chkbus.g_data_out);
  
  
 // PRDATA test
//  count = 0;
//  for(int i=0;i<AMBA_WORD;i++) begin
//   if(PRDATA[i]!= golden_PRDATA[i]) begin
//     count=count+1;
//     break;
//   end
//  end
//  if(count>0)
//  $display("failed at PRDATA test DUT: %b Golden Model: %b",PRDATA,golden_PRDATA);
//  else
//  $display("Good Job passed the PRDATA test DUT: %b Golden Model: %b",PRDATA,golden_PRDATA);
   $display("--------------------------------------------------------------------------------");
//
end
endmodule
