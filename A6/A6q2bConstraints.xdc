# CptS 260 - Homework 6, Question 2b
# XDC Constraints for homework6_q2b (Johnson Counter)

#---------------------------------------------------------------------
# Clock Signal Constraint
#---------------------------------------------------------------------
# Define a 100 MHz clock (10 ns period) on the 'Clock' input port.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports Clock]

#---------------------------------------------------------------------
# Pin Assignments (for a physical FPGA board, e.g., Digilent Basys 3)
#---------------------------------------------------------------------
# UNCOMMENT and MODIFY these lines if you are targeting a specific board.
# Note: For this design, the first flip-flop's output Q1 is internal
# and does not need a pin assignment. Only the top-level ports (Clock, Q2) do.

## Clock signal
# set_property PACKAGE_PIN W5 [get_ports Clock]
# set_property IOSTANDARD LVCMOS33 [get_ports Clock]

## Output (using LED LD0 on Basys 3 to see the output pattern)
# set_property PACKAGE_PIN U16 [get_ports Q2]
# set_property IOSTANDARD LVCMOS33 [get_ports Q2]
