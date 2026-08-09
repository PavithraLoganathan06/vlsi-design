# Read RTL design files

read_hdl -v2001 ../RTL/register.v
read_hdl -v2001 ../RTL/FA.v
read_hdl -v2001 ../RTL/RCA.v

# Elaborate top module
elaborate RCA

# Read timing constraints
read_sdc ../Constraints/constraint_top.sdc

# Set synthesis effort
set_attribute syn_generic_effort medium
set_attribute syn_map_effort medium
set_attribute syn_opt_effort medium

# Perform synthesis
syn_generic
syn_map
syn_opt

# Generate netlist and constraints
write_hdl > RCA_netlist.v
write_sdc > RCA_tool.sdc

# Generate reports
report timing > RCA_timing.rpt
report power > RCA_power.rpt
report area > RCA_area.rpt
report gates > RCA_gates.rpt
