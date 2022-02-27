
//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//

// time scaling for simulations
`resetall
`timescale 1ns/10ps
//block defenition
module ecc_enc_dec 
//parameters declaration 
#( parameter AMBA_WORD=32, //size of the bus
   parameter AMBA_ADDR_WIDTH=20, //address size changes if we will work with more registers in the future
   parameter DATA_WIDTH=32) // the data width size for us to work with
   //I/O PORT DECLARTION
( input wire clk,
  input wire rst,
  input wire PWRITE, // write enable bit that comes from the bus 1 to write 0 to read
  input wire PSEL, //what operation to do 00 encode 01 decode 10 full channel
  input wire PENABLE, // enabling the block to work or not 
  input wire [AMBA_ADDR_WIDTH-1:0] PADDR, //what register address to write to
  input wire [AMBA_WORD-1:0] PWDATA,//writing data
  output reg [AMBA_WORD-1:0] PRDATA,// reading data
  output reg [DATA_WIDTH-1:0] data_out, // the system out put decoded data or encoded data or not valid data
  output reg [1 :0] err_num, // number of error in the decoded data
  output reg operation_done // 1 when the data is valid and 0 when its not valid
);
//Internal Wires declaration used to connect between the blocks
wire i_PWRITE_OUT,i_operation_done;
wire [DATA_WIDTH-1:0] i_data_out;
wire[AMBA_WORD-1:0] i_SEL,i_DATA_IN,i_CODEWORD_WIDTH,i_NOISE,i_PRDATA;
wire [1 :0] i_err_num;
//---------------------------apb_slave declartion-------------------------------------------
// this unit serves us as a link between the bus and the register bank
APB_SLAVE
  #(.AMBA_WORD(AMBA_WORD),
  .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH))
  myslave 
(
  .clk(clk),
  .rst(rst),
  .PWRITE(PWRITE),
  .PSEL(PSEL),
  .PENABLE(PENABLE),
  .PWRITE_OUT(i_PWRITE_OUT)
  );
  
 //------------------------reg_bank declaration---------------------------------- 
 // this unit serves us as the register bank for our system
REG_BANK 
  #(.AMBA_WORD(AMBA_WORD),
  .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH))
  mybank
(
  .clk(clk),
  .rst(rst),
  .PADDR(PADDR),
  .PWDATA(PWDATA),
  .WRITE(i_PWRITE_OUT),
  .PRDATA(i_PRDATA),
  .SEL(i_SEL),
  .DATA_IN(i_DATA_IN),
  .CODEWORD_WIDTH(i_CODEWORD_WIDTH),
  .operation_done(i_operation_done),
  .NOISE(i_NOISE)
  );
  //-------------------------function_control declaration--------------------------------
  // this unit controls what the system will do it has inside it the instantaions for the decoder and encoder
  // it also configures the connection between them and what the should do
FUNCTION_CONTROL 
  #(.AMBA_WORD(AMBA_WORD),
  .DATA_WIDTH(DATA_WIDTH))
  mycontrol
(.SEL(i_SEL),//spreads out the opration to do
  .DATA_IN(i_DATA_IN),
  .CODEWORD_WIDTH(i_CODEWORD_WIDTH),
  .NOISE(i_NOISE),
  .err_num(i_err_num),
  .data_out(i_data_out)
) ;
 //---------------------output register section-------------------------------
 //register for saving the operation done control bit
always @ (posedge clk or negedge rst)
  begin :output_op_done
    if(!rst)
    operation_done<= 1'b0;
    else 
    operation_done<=i_operation_done;
    end
 //register for the number of errors made in the decoded word   
always @ (posedge clk or negedge rst)
  begin :output_err_num
    if(!rst)
    err_num<= 2'bx;
    else 
    err_num<=i_err_num;
    end
 // register for read data control bit   
always @ (posedge clk or negedge rst)
  begin :output_PRDATA
    if(!rst)
    PRDATA<= 'b0;
    else 
    PRDATA<=i_PRDATA;
    end
// register for the output data it remembers the last valid data that the system was request to do    
always @ (posedge clk or negedge rst)
  begin :output_data_out
    if(!rst)
    data_out<= 'bx;
    else 
    data_out<=i_data_out;
    end
endmodule
