# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  Library Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set search_path "$search_path ./LibraryFiles/db ./RTL ./Scripts"

set synthetic_library dw_foundation.sldb
set target_library    "slow.db"
set link_library      "* $target_library $synthetic_library"


# Load useful functions
source ./LibraryFiles/tools/procs.tcl

# Don't want to see CMD-041 when creating new variables
set sh_new_variable_message false

##############################################################
###############Define Design & Work Libraries#################
##############################################################
file mkdir WORK
define_design_lib WORK -path ./WORK
