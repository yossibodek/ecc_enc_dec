//
// Verilog Module StimulusProject_lib.Stimulus
//
// Created:
//          by - ord90.UNKNOWN (DESKTOP-6Q7AESD)
//          at - 15:19:10 04/12/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
module Stimulus #( 
 parameter AMBA_WORD       = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH      = 32)
( 
   // Port Declarations
   Interface.stimulus stim_bus
);

//internal signals
logic [DATA_WIDTH-1:0]	    	c_width;
logic [DATA_WIDTH-1:0]	    	control;
logic [DATA_WIDTH-1:0]	    	data;
logic [DATA_WIDTH-1:0]      noise='0;
int num_tests,addr_gen;
int num_of_errors,error_location,write_or_read,test_num,with_noise,control_type;
//other stuff
`define NULL 0
//clk generator
//always #1 clk=~clk;
//start for the test best
initial begin
stim_bus.psel<=0;
stim_bus.penable<=0;
end
always @(posedge stim_bus.rst) begin : stim_proc
  //Integers
num_tests=100000000;
  //reset
 // reset;
    //randomaizing inputs

for(int i = 0; i< num_tests; i++) begin
  $display("num of test %d",i);
//random codeword width between 0 for 8, 1 for 16 , 2 for 32
c_width = $urandom()%(3);
//random the control
control = $urandom()%(3);

if(control == 1) begin
  //random data for decode
  if (c_width == 2)  // for 32 bits
    data = $urandom();   // randoms the data - 32 bits
  else if (c_width == 1)  // for 16 bits
    data = $urandom() % (2**16);   // randoms the data - 16 bits
  else  // 8 bits
    data = $urandom()% (2**8);   // randoms the data - 8 bits
    noise ='0;
    num_of_errors='0;
end
else begin
//random data
  if (c_width == 2)  // for 32 bits
    data = $urandom() % (2**26);   // randoms the data - 26 bits
  else if (c_width == 1)  // for 16 bits
    data = $urandom() % (2**11);   // randoms the data - 11 bits
  else  // 8 bits
    data = $urandom()% (2**4);   // randoms the data - 4 bits
  num_of_errors='0;
//random the noise
   noise ='0;
if(control==2) begin
  //random number of errors
  //90 precent of time we generate noise in full channel 10 precent we generate without noise
  with_noise=$urandom_range(0,200);
  if(with_noise<150)
    num_of_errors = 2;//$urandom_range(1,2);
  else if (with_noise<195)
  num_of_errors = 1;
  else
    num_of_errors=0;
  for(int i = 0;i<num_of_errors;i++) begin
 if (c_width == 2)  // for 32 bits
        error_location =$urandom_range(0,31);
  else if (c_width == 1)  // for 16 bits
        error_location =$urandom_range(0,15);
  else  // 8 bits
        error_location =$urandom_range(0,7);
    if(noise[error_location]==1 && num_of_errors==2)
    i=i-1;
    else
    noise[error_location]=1;
  end
end
end
//randomizing write or read 80% write 10% write only the control 10% read
write_or_read = $urandom_range(0,100);
//test_num = $urandom_range(0,100);
/// -----------  run the input throgh the system (full channel) ----------------
if(write_or_read<80) begin
  $display("stimulus generated inputs");
  $display("Data register: %b",data);
  $display("number of error: %d",num_of_errors);
  $display("noise register: %b",noise);
  $display("codeword register: %b",c_width);
  $display("control register: %b",control);
  //if(test_num <101) begin
  write_data(.address('h4),.data(data));  // writes the data
  write_data(.address('h8),.data(c_width));  // writes codeword width
  write_data(.address('hc),.data(noise)); // writes the noise
  write_data(.address('h0),.data(control));  // start enc_dec 
  wait(stim_bus.operation_done==1);
  @(posedge stim_bus.clk);
  end
else if (write_or_read<90) begin
    $display("stimulus generated inputs");
    $display("--special test changing only the control register--");
  $display("control register: %b",control);
  write_data(.address('h0),.data(control));  // start enc_dec 
  wait(stim_bus.operation_done==1);
  @(posedge stim_bus.clk);
  end
else begin
//  $display("the data that has been read from the DUT");
  addr_gen=$urandom_range(1,4);
  $display("***stimulus generated address***");
  if(addr_gen==1) begin
  $display("The chosen register is DATA_IN");
  read_data(.address('h4));
  end
  if(addr_gen==2) begin
  $display("The chosen register is control");
  read_data(.address('h0));
  end
  if(addr_gen==3) begin
  $display("The chosen register is codeword_width");
  read_data(.address('h8));
  end
  if(addr_gen==4) begin
  $display("The chosen register is noise");
  read_data(.address('hc));
  end

  end
  //waiting for operation done to generate new data
end
end




// =============== TASKS ===============
/*task reset;
    // ===== asyncrouns reset section ===== 
    #10.2ps;  //asyncrounsly de-assert asrtn
    stim_bus.rst <= 1'b0;
    #10; // keep low for 10 ticks
    @(posedge stim_bus.clk) stim_bus.rst <= 1'b1; //assert with stim_bus.clk rising edge
    repeat(5) @(posedge stim_bus.clk); //wait 10 cycles
endtask // reset
*/
task idle2access_WRITE;
  // idle->setup: stim_bus.psel = 1, stim_bus.penable = 0, pready = 0
  @(negedge stim_bus.clk);
    stim_bus.pwrite <= 1'b1;
    stim_bus.psel <= 1'b1;

	// setup->access: stim_bus.psel = 1, stim_bus.penable = 1, pready = 1 -> make read/write transaction
  @(negedge stim_bus.clk);
  stim_bus.penable <= 1'b1; 
endtask

task idle2access_READ;
  // idle->setup: stim_bus.psel = 1, stim_bus.penable = 0, pready = 0
  @(negedge stim_bus.clk);
    stim_bus.pwrite <= 1'b0;
    stim_bus.psel <= 1'b1;

	// setup->access: stim_bus.psel = 1, stim_bus.penable = 1, pready = 1 -> make read/write transaction
  @(negedge stim_bus.clk);
  stim_bus.penable <= 1'b1; 
endtask

task access2idle;
  	// access->idle: stim_bus.psel = 0, stim_bus.penable = 0, pready = 1
	@(negedge stim_bus.clk);
    stim_bus.psel <= 1'b0;
    stim_bus.penable <= 1'b0;
endtask

task repeat_access_WRITE;
  if (stim_bus.psel) // cant repeat if stim_bus.psel=0
    begin
    // access->setup: stim_bus.psel = 1, stim_bus.penable = 0, pready = 1
    stim_bus.penable <= 1'b0;
    stim_bus.pwrite <= 1'b1; // write
    
  	// setup->access: stim_bus.psel = 1, stim_bus.penable = 1, pready = 1 -> make read/write transaction
    @(negedge stim_bus.clk);
    stim_bus.penable <= 1'b1;
    end
endtask

task repeat_access_READ;
  if (stim_bus.psel) // cant repeat if stim_bus.psel=0
    begin
    // access->setup: stim_bus.psel = 1, stim_bus.penable = 0, pready = 1
    stim_bus.penable <= 1'b0;
    stim_bus.pwrite <= 1'b0; // read
    
  	// setup->access: stim_bus.psel = 1, stim_bus.penable = 1, pready = 1 -> make read/write transaction
    @(negedge stim_bus.clk);
    stim_bus.penable <= 1'b1;
    end
endtask

task write_data;
  input [AMBA_ADDR_WIDTH-1:0] address;
  input [AMBA_WORD-1:0] data;
  stim_bus.paddr <= address;
  stim_bus.pwdata <= data;
  
  idle2access_WRITE;
  access2idle;
endtask

task read_data;
  input [AMBA_ADDR_WIDTH-1:0] address;
  
  stim_bus.paddr <= address;
  
  idle2access_READ;
  access2idle;
endtask
   
// ====================================
endmodule