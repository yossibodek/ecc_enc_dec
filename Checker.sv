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
module Checker   #( 
   parameter AMBA_WORD=32, //size of the bus
   parameter AMBA_ADDR_WIDTH=20, //address size changes if we will work with more registers in the future
   parameter DATA_WIDTH=32) // the data width size for us to work with
   
( 
     Interface.vsgoldenmodel chkbus

);

//read test
always @(negedge chkbus.pwrite) begin
  wait(chkbus.penable==1);
  @(negedge chkbus.clk);
  $display("***Reading Test Result***");
  assert(chkbus.prdata== chkbus.g_prdata)
  $display("Good Job passed the reading test DUT: %b Golden Model: %b",chkbus.prdata,chkbus.g_prdata);
  else
  $error("failed at reading test DUT: %b Golden Model: %b",chkbus.prdata,chkbus.g_prdata);
  cover (chkbus.prdata == chkbus.g_prdata); 
  
    $display("--------------------------------------------------------------------------------");
end
always @(posedge chkbus.operation_done) begin
    $display("***Writing Test Results***");
//num of errors test
  assert(chkbus.num_of_errors == chkbus.g_num_err)
  $display("Good Job passed the error number test DUT: %d Golden Model: %d",chkbus.num_of_errors,chkbus.g_num_err[1 :0]);
  else
  $error("failed at error number test DUT: %d Golden Model: %d",chkbus.num_of_errors,chkbus.g_num_err[1 :0]);
  cover property(chkbus.num_of_errors == chkbus.g_num_err); 
  
  //data out test
  
  assert(chkbus.data_out == chkbus.g_data_out || chkbus.g_num_err==2) begin
  if(chkbus.g_num_err==2)
  $display("Good Job passed the data_out test because the data isnt valid");
  else
  $display("Good Job passed the data_out test DUT: %b Golden Model: %b",chkbus.data_out,chkbus.g_data_out);
  end
  else 
    $error("failed at data_out test DUT: %b Golden Model: %b",chkbus.data_out,chkbus.g_data_out);
  cover property(chkbus.data_out == chkbus.g_data_out || chkbus.g_num_err==2);
   $display("--------------------------------------------------------------------------------");

end


//APB PROTOCOL SETUP->ACCESS TEST
property APB_fsm_setup;
				@(posedge chkbus.clk) (chkbus.psel == 1) && (chkbus.penable == 0) |=> @(posedge chkbus.clk) (chkbus.psel == 1) && (chkbus.penable  == 1);
				endproperty				
assert property(APB_fsm_setup)
  else $error("error with APB setup state in APB protocol");
  cover property(APB_fsm_setup);
  
  
  //APB PROTOCOL access->idle TEST
property APB_fsm_access;
				@(posedge chkbus.clk) (chkbus.psel == 1) && (chkbus.penable == 1) |=> @(posedge chkbus.clk) (chkbus.psel == 0) && (chkbus.penable  == 0);
				endproperty				
assert property(APB_fsm_access)
  else $error("error with APB access state in APB protocol");
  cover property(APB_fsm_access);
  
//operation done rises for 1 clk   
property operation_rise;
				@(chkbus.operation_done) (chkbus.operation_done == 1) |=> @(posedge chkbus.clk) (chkbus.operation_done == 0);
				endproperty

assert property(operation_rise)
  else $error("error with operation rise time");
   cover property(operation_rise);
   
   
 //clock test to see if the system clock is the same as ours
property system_clk;
				@(posedge chkbus.clk) (chkbus.clk == 0)  |=> @(negedge chkbus.clk) (chkbus.clk == 1);
				endproperty				
assert property(system_clk)
  else $error("error with the system clk");
  cover property(system_clk);   
    
   


endmodule
