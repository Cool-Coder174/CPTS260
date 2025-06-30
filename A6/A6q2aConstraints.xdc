# CptS 260 - Homework 6, Question 2a
# XDC Constraints for homework6_q2a (T-Flip-Flop)

#---------------------------------------------------------------------
# Clock Signal Constraint
#---------------------------------------------------------------------
# Define a 100 MHz clock (10 ns period) on the 'Clock' input port.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports Clock]

#---------------------------------------------------------------------
# Pin Assignments (for a physical FPGA board, e.g., Digilent Basys 3)
#---------------------------------------------------------------------
# UNCOMMENT and MODIFY these lines if you are targeting a specific board.

## Clock signal
# set_property PACKAGE_PIN W5 [get_ports Clock]
# set_property IOSTANDARD LVCMOS33 [get_ports Clock]

## Output (using LED LD0 on Basys 3 to see the blinking)
# set_property PACKAGE_PIN U16 [get_ports Q]
# set_property IOSTANDARD LVCMOS33 [get_ports Q]
