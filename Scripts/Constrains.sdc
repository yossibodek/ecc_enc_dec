###################################
#                                 #
#   UNITS                         #
#                                 #
###################################

# The unit of time in this library is 1ns
# The unit of capacitance in this library is 1pF 


###################################
#                                 #
#   CLEAN-UP                      #
#                                 #
###################################

# Remove any existing constraints and attributes
#
#reset_design


###################################
#                                 #
#   CLOCK DEFINITION              #
#                                 #
###################################

# A ???hz clock is a ???.0ns period:
#
create_clock -period 12.0 -name clk -waveform {0 6} [get_ports clk]


# External clock source latency is ???ps or 0.???ns
#
set_clock_latency -source  -max 0.1 [get_clocks clk] 


# The maximum internal clock network insertion delay or latency is ???ps or 0.???ns:
#
set_clock_latency -max 0.1 [get_clocks clk]


# The +/-30ps internal clock delay variation to register clock pins results in a 60ps worst case skew or uncertainty, if you launch
# late (+30ps) and capture early (-30ps)r; Add 40ps due to jitter and 50ps for setup margin;
# This equals 150ps or 0.15 ns of total uncertainty.
#
set_clock_uncertainty -setup 0.1 [get_clocks clk]


# The maximum clock transition is ???ps or 0.???ns
#
set_clock_transition 0.1 [get_clocks clk]

# Don't put Buffers in Clock path
#
set_dont_touch_network [get_clocks clk]


###################################
#                                 #
#   INPUT TIMING                  #
#                                 #
###################################

# The maximum "input delay" (external) on ports  data_in  is: 
# clock period - clock uncertainty - delay of S - register setup time = 
#     ???.0      -      0.???         -     2.2   -      0.2            = ???.???ns
# 
set_input_delay -max  0.2 -clock clk [get_ports -filter "@port_direction == in"]

# Port data_in is a chip level input and has an input transition of ???ps or 0.???ns
#
set_input_transition 0.1 [get_ports -filter "@port_direction == in"]


###################################
#                                 #
#   OUTPUT TIMING                 #
#                                 #
###################################

# The output delay at port result is ??? + ???ps = ???ps or 0.???ns
#
set_output_delay -max  0.5 -clock clk [get_ports -filter "@port_direction == out"]


###################################
#                                 #
#   DESIGN AREA                   #
#                                 #
###################################

# Area Constraint
#
set_max_area 1000000


###################################
#                                 #
#   INPUT DRIVER CELL             #
#                                 #
###################################

# The input driver of all inputs is the smallest Inverter gate (look in the reference manual)
#
set_driving_cell -lib_cell ??? -library slow [get_ports -filter "@port_direction == in"]


###################################
#                                 #
#   LOAD ATTRIBUTE                #
#                                 #
###################################

# Option I: output drives (load) 25fF, or 0.025 pF
#
#set_load 0.025 [get_ports -filter "@port_direction == out"]

# Option II: output drives the largest DFF (our output is input for the biggest DFF) (look in the reference manual)
#
###set_load [load_of slow/???/D] [get_ports -filter "@port_direction == out"]


###################################
#                                 #
#   FALSE PATH                    #
#                                 #
###################################

# Don't run timing on paths which starts from ??? pin
#
###set_false_path -from { ??? }


###################################
#                                 #
#   ENVIRONMENTAL ATTRIBUTES      #
#                                 #
###################################

# From the wireload model selection table, a design size between 200 and 
# 8000 area units uses the model called "8000"; The default wireload 
# mode in this library in "enclosed"
#
set auto_wire_load_selection false
set_wire_load_model -name tsmc18_wl50


