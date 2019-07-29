
# constraints (pzsdr1.b)
# ad9361 (SWAP == 0x0)

set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS25} [get_ports rx_clk_in]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS25} [get_ports rx_frame_in]
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[0]}]
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[1]}]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[2]}]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[3]}]
set_property -dict {PACKAGE_PIN F20 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[4]}]
set_property -dict {PACKAGE_PIN F19 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[5]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[6]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[7]}]
set_property -dict {PACKAGE_PIN H20 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[8]}]
set_property -dict {PACKAGE_PIN J20 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[9]}]
set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[10]}]
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS25} [get_ports {rx_data_in[11]}]

set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS25} [get_ports tx_clk_out]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS25} [get_ports tx_frame_out]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[0]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[1]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[2]}]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[3]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[4]}]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[5]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[6]}]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[7]}]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[8]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[9]}]
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[10]}]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS25} [get_ports {tx_data_out[11]}]

set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS25} [get_ports {tx_gnd[0]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS25} [get_ports {tx_gnd[1]}]

# clocks

create_clock -period 8.000 -name rx_clk [get_ports rx_clk_in]
create_clock -period 8.000 -name ad9361_clk [get_pins i_system_wrapper/system_i/axi_ad9361/clk]


