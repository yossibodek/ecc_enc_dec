//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//
//this block recives an unecoded word and encode it with parity bits of the correct size
`resetall
`timescale 1ns/10ps
module Encoder 
#(
parameter DATA_WIDTH = 32,  // Maximal data width supported (8,16,32)
parameter AMBA_WORD=32
)

(
input  wire [DATA_WIDTH - 1 :0] info,   // data to be encoded the data size 
input  wire [AMBA_WORD-1:0] CODEWORD_WIDTH, 
//input wire ENC_ENB,
output reg [DATA_WIDTH - 1:0] codeword 
);
//parity bit size (4, 5, 6)
wire [3:0] pairity_1; 
wire [4:0] pairity_2;
wire [5:0] pairity_3; 
  

// matrix for each codeword_width

// matrix for information size 4 bit
parameter  [3:0]H1_1 = 4'b1110 ;  // C6 pairity bit
parameter  [3:0]H1_2 = 4'b1101 ; // C7 pairity bit
parameter  [3:0]H1_3 = 4'b1011 ; // C8 parity bit 
//matrix for information size 11 bit
parameter  [10:0]H2_1 = 11'b11111110000 ; //C12 pairity bit
parameter  [10:0]H2_2 = 11'b11110001110 ; // C13 pairity bit
parameter  [10:0]H2_3 = 11'b11001101101 ; // C14 pairity bit
parameter  [10:0]H2_4 = 11'b10101011011 ; // C15 pairity bit
//matrix for information size 26 bits
parameter  [25:0]H3_1 = 26'b11111111111111100000000000 ; //C27 pairity bit
parameter  [25:0]H3_2 = 26'b11111111000000011111110000 ; //C28 pairity bit
parameter  [25:0]H3_3 = 26'b11110000111100011110001110 ; //C29 pairity bit
parameter  [25:0]H3_4 = 26'b11001100110011011001101101 ; //C30 pairity bit
parameter  [25:0]H3_5 = 26'b10101010101010110101011011 ; //C31 pairity bit

//  creating the pairity bits for each information
// xor is + amd - in our logic so if we xor all the bits its the same as + and - 
generate 
        assign pairity_1[0] = ^(info[3:0] & H1_3); // creating c8
        assign pairity_1[1] = ^(info[3:0] & H1_2);// creating c7
        assign pairity_1[2] = ^(info[3:0] & H1_1);// creating c6
        assign pairity_1[3] = (^pairity_1[2:0]) ^ (^info[3:0]); //C5 pairity bi  
    if (DATA_WIDTH == 16 || DATA_WIDTH == 32)  // info size 11 bit
    begin
        assign pairity_2[0] = ^(info[10:0] & H2_4); //creating c15
        assign pairity_2[1] = ^(info[10:0] & H2_3); //creating c14
        assign pairity_2[2] = ^(info[10:0] & H2_2); // creating c13
        assign pairity_2[3] = ^(info[10:0] & H2_1); // creating c12
        assign pairity_2[4] = (^pairity_2[3:0]) ^ (^info[10:0]); //C11 pairity bit
    end  
     if (DATA_WIDTH == 32)  //info size 26bit
    begin
        assign pairity_3[0] = ^(info[25:0] & H3_5); // creating c31
        assign pairity_3[1] = ^(info[25:0] & H3_4); // creating c30
        assign pairity_3[2] = ^(info[25:0] & H3_3); // creating c29
        assign pairity_3[3] = ^(info[25:0] & H3_2); // creating c28
        assign pairity_3[4] = ^(info[25:0] & H3_1); // creating c27
        assign pairity_3[5]  = (^pairity_3[4:0]) ^ (^info[25:0]); //C26 pairity bit
    end
endgenerate
  
  
always @(*) begin: output_select
        //  padding the output to the general output
      if (DATA_WIDTH == 8) //no padding needed
         codeword = {info[3:0],pairity_1};      
      else if (DATA_WIDTH == 16)
      begin 
        if (CODEWORD_WIDTH == 'd0) 
           codeword = {8'b0 ,info[3:0],pairity_1};  //padding with 0 till 16 bits
        else
           codeword = {info[10:0],pairity_2};  
      end    
      else if (DATA_WIDTH == 32) 
      begin    //padding with 0 till 32 bits
      if (CODEWORD_WIDTH == 'd0) 
         codeword = {24'b0 ,info[3:0],pairity_1};
      else if (CODEWORD_WIDTH == 'd1) 
         codeword = {16'b0 ,info[10:0],pairity_2};
      else
         codeword = {info[25:0],pairity_3};  
      end
end

endmodule
