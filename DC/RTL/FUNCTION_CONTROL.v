//
// Created:
//          by - OR DAHAN & YOSSI BODEK
//
// time scaling for simulations
//

`resetall
`timescale 1ns/10ps
module FUNCTION_CONTROL
  #(parameter AMBA_WORD=32,
  parameter DATA_WIDTH=32
  )
( input wire[AMBA_WORD-1:0] SEL,//spreads out the opration to do
  input wire [AMBA_WORD-1:0] DATA_IN, // data used in the system to decode or encode
  input wire [AMBA_WORD-1:0] CODEWORD_WIDTH, // code word width used in the system
  input wire [AMBA_WORD-1:0] NOISE, // noise to add to the encoded word
  output wire [1 :0] err_num, // number of error that the decoder found out can know up to 2 mistakes can fix 1 
  output reg [DATA_WIDTH-1:0] data_out // the decoded or encoded data
) ;
//Parmeter for the MUX
  parameter [1:0] ENCODE = 2'b00, //encoding state
                  DECODE = 2'b01, // decoding state
                  FULL_CHANNEL = 2'b10; //full channel state
//Internal Wires
reg [DATA_WIDTH - 1 :0] codeword_y; // word to decode/encode
wire [DATA_WIDTH - 1 :0] codeword_enc; // code word that came out from the encoder
wire [DATA_WIDTH - 1 :0] decoded_word; // decoded word that came out from the decoder
//INSTANCES
Encoder 
#(
.DATA_WIDTH(DATA_WIDTH),
.AMBA_WORD(AMBA_WORD)
)
ENC
(
.info(DATA_IN),   // data to be encoded the data size = 2**(Matrix_size + 2) - (Matrix_size + 3) - 1 
.CODEWORD_WIDTH(CODEWORD_WIDTH),
//.ENC_ENB(ENC_ENB),
.codeword(codeword_enc)
);
//-----------------------------------------------------------------------------------------------------------
DECODER
#(
.DATA_WIDTH(DATA_WIDTH),
.AMBA_WORD(AMBA_WORD)
) 
DEC
(
.codeword_y(codeword_y), // the word to multiply by the matrix
.CODEWORD_WIDTH(CODEWORD_WIDTH),
//.DEC_ENB(DEC_ENB),
.err_num(err_num),     // number of errors
.decoded_word(decoded_word) // the decoded word with zeros til DATA_SIZE
); 
//--------------------------------------sselection mux-----------------------------------------------------------------------
// this part tells the system what operation to do dependes on sel line
always @(*)
begin: sel_mux
case (SEL[1:0]) 
ENCODE : begin   // ENCODE STATE
codeword_y='bx;
data_out=codeword_enc;
end
DECODE: begin  // DECONE STATE INPUT TO THE DECODER IS FROM THE REG BANK
codeword_y=DATA_IN;

data_out=decoded_word;
end
FULL_CHANNEL: begin // FULL CHANNEL INPUT TO THE DECODER IS FROM THE ENCODER
codeword_y=codeword_enc ^ NOISE;
data_out=decoded_word;
end
default: begin
codeword_y='bx;
data_out='bx;
end


endcase
end

endmodule
