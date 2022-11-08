##LEDs
##IO_L23P_T3_35
set_property PACKAGE_PIN M14 [get_ports {farmSignal[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {farmSignal[0]}]

##IO_L23N_T3_35
set_property PACKAGE_PIN M15 [get_ports {farmSignal[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {farmSignal[1]}]

##IO_0_35
set_property PACKAGE_PIN G14 [get_ports {highwaySignal[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {highwaySignal[0]}]

##IO_L3N_T0_DQS_AD1N_35
set_property PACKAGE_PIN D18 [get_ports {highwaySignal[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {highwaySignal[1]}]



##Pmod Header JB
##IO_L15N_T2_DQS_34
set_property PACKAGE_PIN V15 [get_ports {JB[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {JB[0]}]

##IO_L15P_T2_DQS_34
set_property PACKAGE_PIN W15 [get_ports {JB[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {JB[1]}]

##IO_L16N_T2_34
set_property PACKAGE_PIN T11 [get_ports {JB[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]

##IO_L16P_T2_34
set_property PACKAGE_PIN V20 [get_ports {JB[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]

##Buttons
##IO_L20N_T3_34
set_property PACKAGE_PIN K18 [get_ports {Rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {Rst}]

##IO_L24N_T3_34
#set_property PACKAGE_PIN P16 [get_ports {North}]
#set_property IOSTANDARD LVCMOS33 [get_ports {North}]

##Clock signal
##IO_L11P_T1_SRCC_35	
set_property PACKAGE_PIN K17 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 8} [get_ports Clk]