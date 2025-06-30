# CptS 260 - Homework 6, Question 1
# XDC Constraints for homework6_q1

#---------------------------------------------------------------------
# Clock Signal Constraint
#---------------------------------------------------------------------
# This command defines a clock signal with a period of 10.000 ns (a frequency of 100 MHz).
# Vivado needs this to understand the timing requirements of your design.
# The 'get_ports C' command links this timing constraint to the 'C' input port of your Verilog module.
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports C]

#---------------------------------------------------------------------
# Pin Assignments (for a physical FPGA board, e.g., Digilent Basys 3)
#---------------------------------------------------------------------
# To run this on a physical board, you must assign each input and output
# port from your Verilog file to a physical pin on the FPGA.
# The 'PACKAGE_PIN' is the pin location (e.g., W5 is a clock pin on the Basys 3).
# The 'IOSTANDARD' defines the voltage level (LVCMOS33 is standard for these boards).
#
# UNCOMMENT and MODIFY these lines if you are targeting a specific board.

## Clock signal
# set_property PACKAGE_PIN W5 [get_ports C]
# set_property IOSTANDARD LVCMOS33 [get_ports C]

## Inputs (using switches SW0 and SW1 on Basys 3)
# set_property PACKAGE_PIN V17 [get_ports A]
# set_property IOSTANDARD LVCMOS33 [get_ports A]
# set_property PACKAGE_PIN V16 [get_ports B]
# set_property IOSTANDARD LVCMOS33 [get_ports B]

## Output (using LED LD0 on Basys 3)
# set_property PACKAGE_PIN U16 [get_ports Z]
# set_property IOSTANDARD LVCMOS33 [get_ports Z]
