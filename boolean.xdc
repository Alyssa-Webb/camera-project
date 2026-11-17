## camera.xdc
## Pin numbers taken from our Project 2 Boolean Board constraints.
## Port names must match top.sv once it is written.

# 100 MHz oscillator (feeds the Clocking Wizard)
create_clock -period 10.000 -name gclk [get_ports clk]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]

# Bank 0 voltage
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Button 0 = reset
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {btn[0]}]

# LM1881 sync inputs on Pmod A (through 10k/20k dividers)
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports {csync_n}]  ;# Pmod A pin 1
set_property -dict {PACKAGE_PIN A13 IOSTANDARD LVCMOS33} [get_ports {vsync_n}]  ;# Pmod A pin 2
set_false_path -from [get_ports {csync_n vsync_n btn[0]}]

# HDMI output (TMDS) - from Boolean master XDC
set_property -dict {PACKAGE_PIN R14 IOSTANDARD TMDS_33} [get_ports {hdmi_clk_p}]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD TMDS_33} [get_ports {hdmi_clk_n}]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_p[0]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_n[0]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_p[1]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_n[1]}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_p[2]}]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD TMDS_33} [get_ports {hdmi_tx_n[2]}]
