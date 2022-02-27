//
// Verilog interface my_example_lib.Interface
//
// Created:
//          by - user.UNKNOWN (DESKTOP-A337LJE)
//          at - 21:51:33 10/24/2020
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
interface Interface #(
  parameter AMBA_ADDR_WIDTH = 20,
  parameter AMBA_WORD = 32,
  parameter DATA_WIDTH = 32)
//I/O declaration
 ();

//signals declaration
logic                       clk =1'b0   ;
logic                       rst    ;
logic [AMBA_ADDR_WIDTH-1:0] paddr  ;
logic                       pwrite ;
logic                       psel   ;
logic                       penable;
logic [AMBA_WORD-1:0]       pwdata ;
logic [AMBA_WORD-1:0]       prdata;
logic [AMBA_WORD-1:0]       g_prdata;
logic [DATA_WIDTH-1:0]	    	data_out;
logic                       operation_done;
logic [1:0]                 num_of_errors ;
logic [AMBA_WORD-1:0] SEL; //spreads out the opration to do
logic [AMBA_WORD-1:0] DATA_IN; // data to send out to the system
logic [AMBA_WORD-1:0] CODEWORD_WIDTH; // codeword width register output
logic [AMBA_WORD-1:0] NOISE; // noise that is being added to encoded words
logic [AMBA_WORD-1:0] g_data_out;
logic [1:0]           g_num_err;

//modports declaration
modport stimulus
  //Port declaration
  (
    input clk,rst,prdata,operation_done,
    output pwrite, pwdata,psel, penable, paddr
    );
modport goldenbank
  (input paddr,pwdata,pwrite,psel,penable,rst, 
  output g_prdata,SEL, DATA_IN,  CODEWORD_WIDTH,  NOISE 
  ) ;
modport goldenmodel 
(input  DATA_IN,CODEWORD_WIDTH,SEL,NOISE,output g_data_out, g_num_err
);

modport vsgoldenmodel 
( input prdata, data_out, num_of_errors, operation_done, g_prdata, g_data_out, g_num_err,pwrite,penable,clk,psel // from the golden model
);
modport coverage 
(input clk, rst, paddr,pwrite, psel, penable, pwdata, prdata, data_out, operation_done,NOISE, SEL, DATA_IN, CODEWORD_WIDTH,num_of_errors);

endinterface
