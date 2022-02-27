###########################################################
#
###########################################################

remove_design -designs

##############################################################
###################Defines Design Libraries###################
##############################################################

# Read in design defaults
source Scripts/Setup.tcl


##############################################################
############Read The Design Then Setting Top Level############
##############################################################

## ANALYZE FILES

# packages

# sourcecode
analyze -library WORK -format verilog {APB_SLAVE.v}
analyze -library WORK -format verilog {DECODER.v}
analyze -library WORK -format verilog {ecc_enc_dec.v}
analyze -library WORK -format verilog {Encoder.v}
analyze -library WORK -format verilog {FUNCTION_CONTROL.v}
analyze -library WORK -format verilog {REGISTER_BANK.v}
#current_design Visible_Watermarking


## ELABORATE TOP
elaborate ecc_enc_dec -architecture verilog -library WORK

# Post elaboration save design
file mkdir save/
write -f ddc -h -o save/post_elaboration.ddc

##############################################################
#######################Read Constraints#######################
##############################################################

# === Compile top ====================================================
current_design ecc_enc_dec 
link

# Read in the SDC constraints
source Constrains.sdc


##############################################################
##################Compile/Synthesize Design###################
##############################################################

## Without Clock Gating & Without SAIF ##
compile
#check_design
#check_timing
#report_design


### <--- Alternative Options ---> ###
  ## Clock Gating & Without SAIF ##
#compile -gate_clock
#report_power > reports/syn_power_wCG_woSAIF.rep

  ## Without Clock Gating & With SAIF ##
# Reading power tuggle information from simulation
#read_saif -input dut_saif_rep.saif -instance_name "tb_overall/dut" -verbose
#compile
#report_power > reports/syn_power_woCG_wSAIF.rep

  ## Clock Gating & With SAIF ##
#compile -gate_clock
#report_power > reports/syn_power_wCG_wSAIF.rep
### <--- Alternative Options ---> ###

current_design ecc_enc_dec

###################################
#   Post Synthesis Reports        #
###################################
file mkdir reports
check_design > reports/check_design.rpt
report_timing  > reports/syn_timing.rep
report_area > reports/syn_area.rep
report_power > reports/syn_power_woCG_woSAIF.rep
report_constraint -all_violators > reports/syn_constrains.rep

# Post synthesis save design
write -f ddc -h -o save/post_synthesis.ddc

##########################
#   Export Design        #
##########################

#export sdc constraints for encounter
file mkdir outputs

write -h -f verilog -o outputs/top.v

#save the SDF file
write_sdf outputs/top.sdf
