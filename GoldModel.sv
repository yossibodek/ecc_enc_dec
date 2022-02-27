//
// Verilog Module ECC_ENC_DEC_lib.golden_model
//
// Created:
//          by - yossi.UNKNOWN (LAPTOP-LDM4S6RE)
//          at - 17:22:46 12/ 4/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps

module GoldModel#( 

  parameter AMBA_WORD       = 32,
  parameter AMBA_ADDR_WIDTH = 20,
  parameter DATA_WIDTH      = 32)
( 
   // Port Declarations
   Interface.goldenmodel goldenbus
);

// -----integer decleration-----
 integer noise_det, noisy_enc , syndrom;
 integer encoded,rows,cols,data_size,parity_sz;
   
  assign cols =2**(goldenbus.CODEWORD_WIDTH+3);
  assign  rows = goldenbus.CODEWORD_WIDTH+4;
  assign data_size = cols - rows;
  assign parity_sz = goldenbus.CODEWORD_WIDTH+4;

//--matrix definition                    // codeword ==0
parameter  bit  H[0:2][0:5][0:31] = '{  '{'{1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{1,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{1,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},
                                       // codeword_width==1
                                        '{'{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{1,1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 
                                          '{1,1,1,1,0,0,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 
                                          '{1,1,0,0,1,1,0,1,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, 
                                          '{1,0,1,0,1,0,1,1,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                          '{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}},  
                                       //codeword_width==2
                                        '{'{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                                          '{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0}, 
                                          '{1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0}, 
                                          '{1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,0,1,0,0},
                                          '{1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,1,0,0,1,1,0,1,1,0,1,0,0,0,0,1,0}, 
                                          '{1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,1,0,1,1,0,0,0,0,0,1}}   };   

                                                                                                     
// in this section we choose which opertion to do                        
always @(*) 
begin: state_select
case (goldenbus.SEL)
  0: begin // encode
    goldenbus.g_data_out = encoded_w(.data(goldenbus.DATA_IN),.rows(rows),.cols(cols),.data_size(data_size),.codeword_width(goldenbus.CODEWORD_WIDTH));
    goldenbus.g_num_err=0;
  end
  1:begin  // decode
    syndrom= s_vector(.y(goldenbus.DATA_IN),.rows(rows),.cols(cols),.codeword_width(goldenbus.CODEWORD_WIDTH));  // gettin the syndrom
    if(syndrom=='0)
    goldenbus.g_num_err=0;
    else begin
    if(syndrom[0]==1)
    goldenbus.g_num_err=1;
    else
    goldenbus.g_num_err=2;
    end
     noise_det = find_noise(.s_vector(syndrom), .rows(rows),.cols(cols),.codeword_width(goldenbus.CODEWORD_WIDTH)); // find the noise vector
     goldenbus.g_data_out = noise_det ^ goldenbus.DATA_IN;    // delete the noise
     goldenbus.g_data_out = goldenbus.g_data_out >> parity_sz; //shift the data 
    end
  2:begin  // Full channel
    encoded = encoded_w(.data(goldenbus.DATA_IN),.rows(rows),.cols(cols),.data_size(data_size),.codeword_width(goldenbus.CODEWORD_WIDTH));
    noisy_enc = encoded ^ goldenbus.NOISE; // encode and add noise
    syndrom= s_vector(.y(noisy_enc),.rows(rows),.cols(cols),.codeword_width(goldenbus.CODEWORD_WIDTH));
    if(syndrom=='0)
    goldenbus.g_num_err=0;
    else begin
    if(syndrom[0]==1)
    goldenbus.g_num_err=1;
    else
    goldenbus.g_num_err=2;
    end
     noise_det = find_noise(.s_vector(syndrom), .rows(rows),.cols(cols),.codeword_width(goldenbus.CODEWORD_WIDTH)); // find the noise vector
     goldenbus.g_data_out = noise_det ^ noisy_enc;    // delete the noise
     goldenbus.g_data_out = goldenbus.g_data_out >> parity_sz; //shift the data
  end
endcase
end
// function section
function integer encoded_w(input integer data,input integer rows,input integer cols,input integer data_size, input integer codeword_width);  
 bit parity;
encoded_w='0;
    for (int i=0; i< rows-1; i++) begin
      for (int j=0; j<data_size; j++) begin
      parity  = parity +( H[codeword_width][rows-1-i][j]*data[data_size - 1 - j]);// linear equ' to generate the parity bits
      end
     encoded_w[i] = parity;  // assign the parity in the encoded word
     parity=0;
    end
    for (int c=0; c<data_size; c++)begin
    encoded_w[c+rows] = data[c];  // assign the data in the encoded word (with shift)
   end
  encoded_w[rows-1]=^encoded_w; // compute the last parity, xor with all the parity and data (the rest is zeros)
 
endfunction
function integer find_noise(input integer s_vector,input integer rows,input integer cols, input integer codeword_width);
//find the noise
  integer i,j;
  bit flag;
  find_noise = '0;

  
  if (s_vector[0] == 1) begin  // means only one error   
      for(j = 0; j< cols; j++) begin  
        flag=1;
        for(i = 0; i< rows; i++) begin
          if (H[codeword_width][i][j]!=s_vector[i]) begin
            flag=0;// there is no match  
          end
        end  
        if (flag == 1) begin // this is the matching line 
          find_noise[cols - 1 - j] = 1; //error location
          break; // we found a match
        end
      end  
  end  
endfunction  



function integer s_vector(input integer y,input integer rows,input integer cols, input integer codeword_width);  
// matrix mult to get the syndrom
 bit mul_sum;
 s_vector='0;
    
    for (int i=0; i< rows; i++) begin
     for (int j=0; j<cols; j++) begin
      mul_sum  = mul_sum +( H[codeword_width][i][j]*y[ cols-1 - j]);// H*y(transpose)
      end
     s_vector[i] = mul_sum;  // assign to s_vector
     mul_sum=0;

    end
  
 
endfunction



endmodule