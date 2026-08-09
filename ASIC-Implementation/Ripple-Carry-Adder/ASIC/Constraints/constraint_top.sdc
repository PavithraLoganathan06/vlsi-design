# Clock constraint
create_clock -name clk -period 5 -waveform {0 2.5} [get_ports clk]

# Optional clock constraints
# set_clock_transition -rise 0.1 [get_clocks clk]
# set_clock_transition -fall 0.1 [get_clocks clk]
# set_clock_uncertainty 0.01 [get_clocks clk]
