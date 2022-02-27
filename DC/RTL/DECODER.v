//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//
//this block recives a an encoded word and finds out how many errors it has and also sends out the decoded data meaning the original word sent

`resetall
`timescale 1ns/10ps
module DECODER
#(
parameter DATA_WIDTH = 32,
parameter AMBA_WORD = 32
) 
(
input  wire [DATA_WIDTH - 1 :0] codeword_y, // the word to multiply by the matrix
input wire [AMBA_WORD-1:0] CODEWORD_WIDTH,
output reg [1 :0]err_num,     // number of errors
output reg [DATA_WIDTH - 1 :0] decoded_word // the decoded word with zeros til DATA_SIZE
);    
// Internal Wires
wire [DATA_WIDTH -1:0] s_vector; // the result of the matrix multiplaction 
wire [DATA_WIDTH -1:0] err_location; // 1 where the error is located
wire [DATA_WIDTH -1:0] i_decoded_word; // internal wire for the decoded word
//instances
Matrix_Mult  #(.DATA_WIDTH(DATA_WIDTH),.AMBA_WORD(AMBA_WORD)) MM //returns the s vector
(
.CODEWORD_WIDTH(CODEWORD_WIDTH),
.codeword_y (codeword_y), 
.s_vector (s_vector) 
);
Error_Locator  #(.DATA_WIDTH(DATA_WIDTH),.AMBA_WORD(AMBA_WORD)) EL //returns the error location
(
.CODEWORD_WIDTH(CODEWORD_WIDTH),
.s_vector (s_vector), 
.err_location (err_location) 
);
// fixing the error found in encoded word
assign i_decoded_word = codeword_y^err_location;
// padding with zeros the decoded word and assigning the correct decoded word
always @(*) begin:decodedwordlabel
  if (CODEWORD_WIDTH[1:0] == 2'b00)
  decoded_word={4'b0000,i_decoded_word[DATA_WIDTH-1:4]};
  else if (CODEWORD_WIDTH[1:0] == 2'b01)
  decoded_word={5'b00000,i_decoded_word[DATA_WIDTH-1:5]};
  else if (CODEWORD_WIDTH[1:0] == 2'b10)
  decoded_word={6'b000000,i_decoded_word[DATA_WIDTH-1:6]};
  else 
  decoded_word=i_decoded_word; 
end

// num of error detection
always @(*) begin : err_number
  if(err_location ==32'b11111111111111111111111111111111 && s_vector!=0)  //TWO ERRORS
  err_num = 2'b10;
  else if(err_location !=0 && s_vector!=0)  //ONE ERROR
  err_num = 2'b01;
  else                                     // NO ERROR
  err_num = 2'b00;
end

endmodule



//-------------------------------------------------------------------------------
//Matrix Multiplayer to get the s vector
module Matrix_Mult
#(
parameter DATA_WIDTH = 32,
parameter AMBA_WORD = 32
)                
(
input wire [AMBA_WORD-1:0] CODEWORD_WIDTH,
input  wire [DATA_WIDTH - 1 :0]codeword_y, // the word to multiply by the matrix
output reg [DATA_WIDTH -1:0]s_vector // the s vector after matrix multiplication
);
// define the matrices
parameter  [7:0]H1_0 = 8'b11111111 ; // H1 matrix for the size of info 4 bit
parameter  [7:0]H1_1 = 8'b11100100 ; // second line
parameter  [7:0]H1_2 = 8'b11010010 ; // third line
parameter  [7:0]H1_3 = 8'b10110001 ; // etc

parameter  [15:0]H2_0 = 16'b1111111111111111 ; // H2 matrix for the size of info 11 bit
parameter  [15:0]H2_1 = 16'b1111111000001000 ;  
parameter  [15:0]H2_2 = 16'b1111000111000100 ; 
parameter  [15:0]H2_3 = 16'b1100110110100010 ; 
parameter  [15:0]H2_4 = 16'b1010101101100001 ; 

parameter  [31:0]H3_0 = 32'b11111111111111111111111111111111 ;  // H3 matrix for the size of info 26 bit
parameter  [31:0]H3_1 = 32'b11111111111111100000000000010000 ;
parameter  [31:0]H3_2 = 32'b11111111000000011111110000001000 ;
parameter  [31:0]H3_3 = 32'b11110000111100011110001110000100 ; 
parameter  [31:0]H3_4 = 32'b11001100110011011001101101000010 ; 
parameter  [31:0]H3_5 = 32'b10101010101010110101011011000001 ;   
// Internal Wires
wire [3:0] s_vector_1; // the s vector for 4 bit info wave
wire [4:0] s_vector_2; // for 11 bit info wave
wire [5:0] s_vector_3; // for 26 bit info wave
//  assignd the s vector  
generate // we use generate to create less hardwate
  // and is like doing multiplcation and xor is like adding or substractin betwwen the diffrenet results
        assign s_vector_1[3] = ^(codeword_y & H1_0);  // s vector for Data width 32,16,8
        assign s_vector_1[2] = ^(codeword_y & H1_1);
        assign s_vector_1[1] = ^(codeword_y & H1_2);
        assign s_vector_1[0] = ^(codeword_y & H1_3); 
    if (DATA_WIDTH==16 || DATA_WIDTH==32) begin       // s vector for Data width 32,16
        assign s_vector_2[4] = ^(codeword_y & H2_0);
        assign s_vector_2[3] = ^(codeword_y & H2_1);
        assign s_vector_2[2] = ^(codeword_y & H2_2);
        assign s_vector_2[1] = ^(codeword_y & H2_3);
        assign s_vector_2[0] = ^(codeword_y & H2_4);
    end
     if (DATA_WIDTH == 32) begin                      // s vector for Data width 32
        assign s_vector_3[5] = ^(codeword_y & H3_0);
        assign s_vector_3[4] = ^(codeword_y & H3_1);
        assign s_vector_3[3] = ^(codeword_y & H3_2);
        assign s_vector_3[2] = ^(codeword_y & H3_3);
        assign s_vector_3[1] = ^(codeword_y & H3_4);
        assign s_vector_3[0] = ^(codeword_y & H3_5);
    end   
endgenerate
// zero padding s vector
always@(*) begin :labelfornoreason
        if (DATA_WIDTH == 8)
        s_vector = {4'b0,s_vector_1};       
      else if (DATA_WIDTH == 16)
      begin 
        if (CODEWORD_WIDTH == 'd0) 
        s_vector = {12'b0,s_vector_1};  //padding with 0 till 16 bits
        else
        s_vector = {11'b0,s_vector_2};  
      end    
      else if (DATA_WIDTH == 32) 
      begin    //padding with 0 till 32 bits
      if (CODEWORD_WIDTH == 'd0) 
        s_vector = {28'b0,s_vector_1};
      else if (CODEWORD_WIDTH == 'd1) 
        s_vector = {27'b0,s_vector_2};
      else
        s_vector = {26'b0,s_vector_3};  
      end
  end
endmodule
//--------------------------------------------------------------------------------------------------------------
//Error locator module
module Error_Locator
#(
parameter DATA_WIDTH = 32,
parameter AMBA_WORD = 32
)
(
input wire [AMBA_WORD-1:0] CODEWORD_WIDTH,
input wire [DATA_WIDTH-1:0]s_vector, // the s vector after matrix multiplication
output reg [DATA_WIDTH -1:0] err_location // a vector that has 1 on the location of the error if there is not error its 0 if there is more that one error its x
);
//needs only 2 zero padding param because on the third we dont need to pad
localparam [DATA_WIDTH -1-8:0]zeropad ='b0;
localparam [DATA_WIDTH -1-16:0] zeropad2='b0;


always @(*) begin: Decoding_location
  if(CODEWORD_WIDTH[1:0] == 2'b00)
    begin
      case(s_vector[3:0])   //LSB is always 1
          4'b0000:  err_location =   32'b00000000000000000000000000000000;//no error
          4'b1000:  err_location =   32'b00000000000000000000000000000001;//error in parity bits
          4'b1001:  err_location =   32'b00000000000000000000000000000010;// eror in the second parity
          4'b1010:  err_location =   32'b00000000000000000000000000000100;//error in the third parity
          4'b1100:  err_location =   32'b00000000000000000000000000001000; // etc
          4'b1011:  err_location =   {zeropad,8'b00010000};   // mistake in first bit
          4'b1101:  err_location =   {zeropad,8'b00100000};   // mistake in second bit
          4'b1110:  err_location =   {zeropad,8'b01000000};    // mistake in 3 bit
          4'b1111:  err_location =   {zeropad,8'b10000000};    // mistake in 4 bit
         default:err_location =  32'b11111111111111111111111111111111; // 2 errors
      endcase
    end
 
  else if(CODEWORD_WIDTH[1:0] == 2'b01)
    begin
    case(s_vector[4:0])   // LSB is always 1
       5'b00000:  err_location =   32'b00000000000000000000000000000000;// no error
       5'b10001:  err_location =  32'b00000000000000000000000000000001;//error in the first parity
      5'b10010:  err_location =   32'b00000000000000000000000000000010;//etc
      5'b10100:  err_location =   32'b00000000000000000000000000000100; 
      5'b11000:  err_location =   32'b00000000000000000000000000001000;
      5'b10000:  err_location =   32'b00000000000000000000000000010000; 
      5'b10011:  err_location = {zeropad2,16'b0000000000100000};    //mistake in 1 bit
      5'b10101:  err_location = {zeropad2,16'b0000000001000000};    //mistake in 2 bit
      5'b10110:  err_location = {zeropad2,16'b0000000010000000};    //mistake in 3 bit
      5'b10111:  err_location = {zeropad2,16'b0000000100000000};    //mistake in  4 bit
      5'b11001:  err_location = {zeropad2,16'b0000001000000000};    // mistake in 5 bit
      5'b11010:  err_location = {zeropad2,16'b0000010000000000};    // mistake in 6 bit
      5'b11011:  err_location = {zeropad2,16'b0000100000000000};    // mistake in 7 bit
      5'b11100:  err_location = {zeropad2,16'b0001000000000000};    // mistake in 8 bit
      5'b11101:  err_location = {zeropad2,16'b0010000000000000};    // mistake in 9 bit
      5'b11110:  err_location = {zeropad2,16'b0100000000000000};    // mistake in 10 bit
      5'b11111:  err_location = {zeropad2,16'b1000000000000000};    // mistake in 11 bit
    default:err_location =  32'b11111111111111111111111111111111;     // 2 errors
     endcase   

    end
  else if(CODEWORD_WIDTH[1:0] == 2'b10)
    begin
    case(s_vector[5:0]) // LSB is always 1
    // parity
        6'b000000:  err_location =   32'b00000000000000000000000000000000; // no error
        6'b100001:  err_location =  32'b00000000000000000000000000000001; //error in the first pairity 
        6'b100010:  err_location =  32'b00000000000000000000000000000010;//etc
        6'b100100:  err_location =  32'b00000000000000000000000000000100;
        6'b101000:  err_location =  32'b00000000000000000000000000001000;
        6'b110000:  err_location =  32'b00000000000000000000000000010000;
        6'b100000:  err_location =  32'b0000000000000000000000000010000;
     //error in codeword   
        6'b100011:  err_location = 32'b00000000000000000000000001000000;// error in first info bit
        6'b100101:  err_location = 32'b00000000000000000000000010000000; // error in the second info bit
        6'b100110:  err_location = 32'b00000000000000000000000100000000; // etc
        6'b100111:  err_location = 32'b00000000000000000000001000000000;
        6'b101001:  err_location = 32'b00000000000000000000010000000000;
        6'b101010:  err_location = 32'b00000000000000000000100000000000;
        6'b101011:  err_location = 32'b00000000000000000001000000000000;
        6'b101100:  err_location = 32'b00000000000000000010000000000000;
        6'b101101:  err_location = 32'b00000000000000000100000000000000;
        6'b101110:  err_location = 32'b00000000000000001000000000000000;
        6'b101111:  err_location = 32'b00000000000000010000000000000000;
        6'b110001:  err_location = 32'b00000000000000100000000000000000; 
        6'b110010:  err_location = 32'b00000000000001000000000000000000;
        6'b110011:  err_location = 32'b00000000000010000000000000000000;
        6'b110100:  err_location = 32'b00000000000100000000000000000000;
        6'b110101:  err_location = 32'b00000000001000000000000000000000; 
        6'b110110:  err_location = 32'b00000000010000000000000000000000; 
        6'b110111:  err_location = 32'b00000000100000000000000000000000;
        6'b111000:  err_location = 32'b00000001000000000000000000000000; 
        6'b111001:  err_location = 32'b00000010000000000000000000000000;
        6'b111010:  err_location = 32'b00000100000000000000000000000000; 
        6'b111011:  err_location = 32'b00001000000000000000000000000000; 
        6'b111100:  err_location = 32'b00010000000000000000000000000000;
        6'b111101:  err_location = 32'b00100000000000000000000000000000; 
        6'b111110:  err_location = 32'b01000000000000000000000000000000; 
        6'b111111:  err_location = 32'b10000000000000000000000000000000;
        default:   err_location = 32'b11111111111111111111111111111111; // two errors
      endcase 
          
    end  
   else
        err_location =  32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; // if we use an unsupported data size we do X propogation  
     
end
endmodule

