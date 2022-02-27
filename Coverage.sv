//
// Verilog Module ECC_ENC_DEC_lib.coverage
//
// Created:
//          by - yossi.UNKNOWN (LAPTOP-LDM4S6RE)
//          at - 17:47:14 12/ 7/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/10ps
module Coverage #(
  parameter AMBA_ADDR_WIDTH = 20,
  parameter AMBA_WORD = 32,
  parameter DATA_WIDTH = 32)
  //Port declaration
  (
     Interface.coverage covbus

    );
    
//--------------------routine FSM checks------------------------------------
    //routine checks
    // routine checks - low or high 
      covergroup apb_bus @ (posedge covbus.clk); // sampled at every posedge covbus.clk 
      //checks apb bus routins
      //high low checks
      reset: coverpoint covbus.rst{
      bins high = {1};
      bins low = {0};
      }
      
      Psel: coverpoint covbus.psel{
      bins high = {1};
      bins low = {0};
      }
      Pwrite: coverpoint covbus.pwrite{
      bins high = {1};
      bins low = {0};
      }
      Penable: coverpoint covbus.penable{
      bins high = {1};
      bins low = {0};
      } 
       paddr: coverpoint covbus.paddr {
      bins cotrol = {0};
      bins datain = {4};
      bins codeword_width = {8};
      bins noise = {12}; 
        }
        //idle psel=0 peanble=0
     idle: cross Penable,Psel{
     ignore_bins idle = binsof(Penable.high) || binsof(Psel.high);}
     
         //setup psel=1 peanble=0
     setup: cross Penable,Psel{
     ignore_bins setup = binsof(Penable.high) || binsof(Psel.low);}
     
         //access psel=1 peanble=1
     access: cross Penable,Psel{
     ignore_bins access = binsof(Penable.low) || binsof(Psel.low);}
     
     //checks if read from all registers
     read_reg: cross paddr,Pwrite{
     ignore_bins read = binsof (Pwrite.high);}
     //checks if write from all registers
     write_reg: cross paddr,Pwrite{
     ignore_bins read = binsof (Pwrite.low);}

      endgroup 
    
//-------------------------CTRL checks---------------------------------      
      // checks all adresses options
      covergroup  ctrl@(posedge covbus.clk);
        // ctrl checks
      ctrl: coverpoint covbus.SEL{
      bins Encode = {0};
      bins Decode = {1};
      bins Full_channel = {2};
    }

     endgroup
     
 //-------------data in checks----------------    
     // Data_in checks all combination
     // checks all most of the possible ranges
      covergroup datain @(posedge covbus.clk);
      data_in: coverpoint covbus.DATA_IN{
      bins eight_bit = {[0:255]};   // 0-2^8
      bins sixteen_bit = {[256:65535]};//2^8-2^16
      bins twenty_six_bit = {[65535:67108863]}; //2^16-2^26
      bins full_bus_bit = {[67108864:4294967295]}; //2^26-2^32
      bins first_overlap={[2**4:2**12]};      //2^4-2^12
      bins second_overlap = {[2**12:2**20]};//2^12-2^20 
      bins third_overlap  ={[2**20:2*28]};//2^20-2^28
    }   
  
     endgroup
     
//-----------------------Noise checks and noise CTRL and DATA  cross------   
// noise check
//finding the left and right indexes
int right=31;
int left=0;
int i=0;
always@(*)
begin
for (i=0;i<32;i++)begin
if(covbus.NOISE!=0)begin
if(covbus.NOISE[31-i]==1)begin //fount bit 1 and still didnt find
 right=31-i;
//$display("in loop left %d",left) ;
end  //if
if(covbus.NOISE[i]==1)begin
   left =i;
end//if
end  //if
end  //for
//$display("left :%d right: %d",left,right);

end

    covergroup noise_cw_data @(posedge covbus.clk);
    //-----------CW_WIDTH------------------
       //codeword width checks
        // findind left and right one's bits    
      cw_width: coverpoint covbus.CODEWORD_WIDTH{
      bins eight_bit = {0};
      bins sixteen_bit = {1};
      bins thirdy_two_bit = {2};
    
    }
    //--------------NOISE--------------
      // checks one hot for noise
      noise: coverpoint covbus.NOISE{
      bins zero  = {0};
      bins noise0 = {2**0};
      bins noise1 = {2**1};
      bins noise2 = {2**2};
      bins noise3 = {2**3};
      bins noise4 = {2**4};
      bins noise5 = {2**5};
      bins noise6 = {2**6};
      bins noise7 = {2**7};
      bins noise8 ={2**8};
      bins noise9 = {2**9};
      bins noise10= {2**10};
      bins noise11={2**11};
      bins noise12={2**12};
      bins noise13= {2**13};
      bins noise14= {2**14};
      bins noise15= {2**15};
      bins noise16 = {2**16};
      bins noise17 = {2**17};
      bins noise18 ={2**18};
      bins noise19 = {2**19};
      bins noise20= {2**20};
      bins noise21={2**21};
      bins noise22= {2**22};
      bins noise23= {2**23};
      bins noise24= {2**24};
      bins noise25= {2**25};
      bins noise26 = {2**26};
      bins noise27 = {2**27};
      bins noise28 ={2**28};
      bins noise29 = {2**29};
      bins noise30= {2**30};
      bins noise31={2**31}; 
    }
       left_bit:coverpoint left{
      bins left_bit_noise[31] = {1,2,3,4,5,6,7,8,9,10,          // left cannot be zero
      11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
      bins def=default;
    }
       right_bit:coverpoint right {   //right cannot be 31
      bins right_bit_noise[31] = {0,1,2,3,4,5,6,7,8,9,10,
      11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
      bins def=default;

}
    //----cheks all 2 bit options-----------
      right_bit_X_left_bit: cross right_bit,left_bit {
  //ignore all bins which right> left 
      ignore_bins r1 = binsof(right_bit) intersect{30}&&binsof(left_bit) intersect {[0:30]};
      ignore_bins r2 = binsof(right_bit) intersect{29}&&binsof(left_bit) intersect {[0:29]};
      ignore_bins r3 = binsof(right_bit) intersect{28}&&binsof(left_bit) intersect {[0:28]};
      ignore_bins r4 = binsof(right_bit) intersect{27}&&binsof(left_bit) intersect {[0:27]};
      ignore_bins r5 = binsof(right_bit) intersect{26}&&binsof(left_bit) intersect {[0:26]};
      ignore_bins r6 = binsof(right_bit) intersect{25}&&binsof(left_bit) intersect {[0:25]};
      ignore_bins r7 = binsof(right_bit) intersect{24}&&binsof(left_bit) intersect {[0:24]};
      ignore_bins r8 = binsof(right_bit) intersect{23}&&binsof(left_bit) intersect {[0:23]};
      ignore_bins r9 = binsof(right_bit) intersect{22}&&binsof(left_bit) intersect {[0:22]};
      ignore_bins r10 = binsof(right_bit) intersect{21}&&binsof(left_bit) intersect {[0:21]};
      ignore_bins r11 = binsof(right_bit) intersect{20}&&binsof(left_bit) intersect {[0:20]};
      ignore_bins r12 = binsof(right_bit) intersect{19}&&binsof(left_bit) intersect {[0:19]};
      ignore_bins r13 = binsof(right_bit) intersect{18}&&binsof(left_bit) intersect {[0:18]};
      ignore_bins r14 = binsof(right_bit) intersect{17}&&binsof(left_bit) intersect {[0:17]};
      ignore_bins r15 = binsof(right_bit) intersect{16}&&binsof(left_bit) intersect {[0:16]};
      ignore_bins r16 = binsof(right_bit) intersect{15}&&binsof(left_bit) intersect {[0:15]};
      ignore_bins r17 = binsof(right_bit) intersect{14}&&binsof(left_bit) intersect {[0:14]};
      ignore_bins r18 = binsof(right_bit) intersect{13}&&binsof(left_bit) intersect {[0:13]};
      ignore_bins r19 = binsof(right_bit) intersect{12}&&binsof(left_bit) intersect {[0:12]};
      ignore_bins r20 = binsof(right_bit) intersect{11}&&binsof(left_bit) intersect {[0:11]};
      ignore_bins r21 = binsof(right_bit) intersect{10}&&binsof(left_bit) intersect {[0:10]};
      ignore_bins r22 = binsof(right_bit) intersect{9}&&binsof(left_bit) intersect {[0:9]};
      ignore_bins r23 = binsof(right_bit) intersect{8}&&binsof(left_bit) intersect {[0:8]};
      ignore_bins r24 = binsof(right_bit) intersect{7}&&binsof(left_bit) intersect {[0:7]};
      ignore_bins r25 = binsof(right_bit) intersect{6}&&binsof(left_bit) intersect {[0:6]};
      ignore_bins r26 = binsof(right_bit) intersect{5}&&binsof(left_bit) intersect {[0:5]};
      ignore_bins r27 = binsof(right_bit) intersect{4}&&binsof(left_bit) intersect {[0:4]};
      ignore_bins r28 = binsof(right_bit) intersect{3}&&binsof(left_bit) intersect {[0:3]};
      ignore_bins r29 = binsof(right_bit) intersect{2}&&binsof(left_bit) intersect {[0:2]};
      ignore_bins r30 = binsof(right_bit) intersect{1}&&binsof(left_bit) intersect {[0:1]};
      

    }
   


//--------------collect covepoint for cross------------------      
      //checks data for each codeword width
        data_8_bit : coverpoint covbus.DATA_IN iff (covbus.CODEWORD_WIDTH == 0){
         bins data_8 = {[2**0:2**8]};
         bins not_data_8 = default;
      }
      data_16_bit : coverpoint covbus.DATA_IN iff (covbus.CODEWORD_WIDTH == 1){
         bins data_16 = {[2**0:2**16]};
         bins not_data_16 = default;
      }
        data_32_bit : coverpoint covbus.DATA_IN iff (covbus.CODEWORD_WIDTH == 2){
         bins data_32 = {[2**0:2**32]};
         bins not_data_32 = default;
      }
          //  All the noise permutations for 1 error
      eight_b_noise:coverpoint covbus.NOISE{
      bins eight_bit_noise[8] = {1,2**1,2**2,2**3,2**4,2**5,2**6,2**7};
      }
      sixteen_b_noise:coverpoint covbus.NOISE{
      bins sixteen_bit_noise[8] = {2**8,2**9,2**10,2**11,2**12,2**13,2**14,2**15};
      }
      thirty_two_b_noise:coverpoint  covbus.NOISE{
      bins thirdy_two_bit_noise[16] = {
      2**16,2**17,2**18,2**19,2**20,2**21,2**22,2**22,2**23,2**24,2**25,2**26,2**27,2**28,2**29,2**30,
      2**31
      };
      }
      //----------Cross section---------------
           //Data in options and noise
      Data8_X_noise8: cross data_8_bit, eight_b_noise;
      Data16_X_noise16: cross data_16_bit, sixteen_b_noise;  
      Data32_X_noise32: cross data_32_bit, thirty_two_b_noise;
       
       //cross between noise and ce width  
      //cross of eight bit one hot noise and all cw width
      noise_8_X_cw_width: cross eight_b_noise,cw_width;
      //cross of eight bit one hot noise and cw width without eight bit
      noise_16_X_cw_width: cross sixteen_b_noise,cw_width{
      ignore_bins illegal_for_16 = binsof(sixteen_b_noise) && binsof(cw_width.eight_bit);
      }
      //cross of eight bit one hot noise and cw width without eight bit and 16 bit
      noise_32_X_cw_width: cross thirty_two_b_noise,cw_width{
      ignore_bins illegal_for_32 = binsof(thirty_two_b_noise) && (binsof(cw_width.eight_bit)|| binsof(cw_width.sixteen_bit));
     
      }  

     endgroup
     
//-----------------Outputs cheks---------------------------------------
     covergroup outputs @ (posedge covbus.clk); // sampled at every posedge covbus.clk 
      //checks outputs
      //high low operation done checks
      op_done: coverpoint covbus.operation_done{
      bins high = {1};
      bins low = {0};
      }
      //num of errors options
       num_of_errors: coverpoint covbus.num_of_errors{
      bins zero = {0};
      bins one = {1};
      bins two = {2};
    }
  endgroup
 
 
 //initial the covergroups
      apb_bus apb_bus_cov = new;
     noise_cw_data noise_cw_data_cov = new;     
     datain datain_cov = new;    
     ctrl ctrl_cov =new;
     outputs outputs_cov =new;
        
endmodule
