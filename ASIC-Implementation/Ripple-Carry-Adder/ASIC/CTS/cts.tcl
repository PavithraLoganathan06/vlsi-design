# Clock Tree Synthesis (CTS) setup for RCA

# Define clock source
set_ccopt_property cts_is_sdc_clock_root -pin clk true

# Create clock tree
create_ccopt_clock_tree -name clk -source clk -no_skew_group

# Set clock period
set_ccopt_property clock_period -pin clk 5

# Create skew group
create_ccopt_skew_group -name clk_skew_group \
    -sources clk \
    -auto_sinks

# Include source latency
set_ccopt_property include_source_latency \
    -skew_group clk_skew_group true

# Check clock tree convergence
check_ccopt_clock_tree_convergence

# Run Clock Tree Synthesis
ccopt_design -cts

# Generate CTS reports
report_ccopt_clock_trees -file clk_trees.rpt
report_ccopt_skew_groups -file skew_groups.rpt

# Save CTS design
saveDesign DBS/cts.enc
