# de10
# clocks (V11, Y13, E11 - PL 50MHz)
# clocks (E20, D20 - HPS 25MHz)

set_location_assignment PIN_V11 -to sys_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sys_clk

# leds

set_location_assignment PIN_W15  -to gpio_bd_o[0]
set_location_assignment PIN_AA24 -to gpio_bd_o[1]
set_location_assignment PIN_V16  -to gpio_bd_o[2]
set_location_assignment PIN_V15  -to gpio_bd_o[3]
set_location_assignment PIN_AF26 -to gpio_bd_o[4]
set_location_assignment PIN_AE26 -to gpio_bd_o[5]
set_location_assignment PIN_Y16  -to gpio_bd_o[6]
set_location_assignment PIN_AA23 -to gpio_bd_o[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_o[7]

# push-buttons

set_location_assignment PIN_AH17 -to gpio_bd_i[0]
set_location_assignment PIN_AH16 -to gpio_bd_i[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[1]

# dip switches

set_location_assignment PIN_Y24 -to gpio_bd_i[0]
set_location_assignment PIN_W24 -to gpio_bd_i[1]
set_location_assignment PIN_W21 -to gpio_bd_i[2]
set_location_assignment PIN_W20 -to gpio_bd_i[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_bd_i[3]

# uart

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to uart0_rx
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to uart0_tx
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to uart0_rx
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to uart0_tx

# usb

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_stp
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_dir
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_nxt
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to usb1_d[7]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_stp
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_dir
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_nxt
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to usb1_d[7]

# sdio

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_cmd
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_d[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_d[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_d[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdio_d[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_cmd
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to sdio_d[3]

# qspi

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_ss0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_io[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_io[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_io[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to qspi_io[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_ss0
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_io[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_io[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_io[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to qspi_io[3]

# ethernet

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_ctl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_d[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_d[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_d[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_tx_d[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_ctl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_d[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_d[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_d[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_rx_d[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_mdc
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to eth1_mdio
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_ctl
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_tx_d[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_ctl
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_d[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_d[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_d[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_rx_d[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_mdc
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to eth1_mdio

# gpio-0 (JP1)

set_location_assignment PIN_V12  -to gpio_0[0]
set_location_assignment PIN_E8   -to gpio_0[1]
set_location_assignment PIN_W12  -to gpio_0[2]
set_location_assignment PIN_D11  -to gpio_0[3]
set_location_assignment PIN_D8   -to gpio_0[4]
set_location_assignment PIN_AH13 -to gpio_0[5]
set_location_assignment PIN_AF7  -to gpio_0[6]
set_location_assignment PIN_AH14 -to gpio_0[7]
set_location_assignment PIN_AF4  -to gpio_0[8]
set_location_assignment PIN_AH3  -to gpio_0[9]
set_location_assignment PIN_AD5  -to gpio_0[10]
set_location_assignment PIN_AG14 -to gpio_0[11]
set_location_assignment PIN_AE23 -to gpio_0[12]
set_location_assignment PIN_AE6  -to gpio_0[13]
set_location_assignment PIN_AD23 -to gpio_0[14]
set_location_assignment PIN_AE24 -to gpio_0[15]
set_location_assignment PIN_D12  -to gpio_0[16]
set_location_assignment PIN_AD20 -to gpio_0[17]
set_location_assignment PIN_C12  -to gpio_0[18]
set_location_assignment PIN_AD17 -to gpio_0[19]
set_location_assignment PIN_AC23 -to gpio_0[20]
set_location_assignment PIN_AC22 -to gpio_0[21]
set_location_assignment PIN_Y19  -to gpio_0[22]
set_location_assignment PIN_AB23 -to gpio_0[23]
set_location_assignment PIN_AA19 -to gpio_0[24]
set_location_assignment PIN_W11  -to gpio_0[25]
set_location_assignment PIN_AA18 -to gpio_0[26]
set_location_assignment PIN_W14  -to gpio_0[27]
set_location_assignment PIN_Y18  -to gpio_0[28]
set_location_assignment PIN_Y17  -to gpio_0[29]
set_location_assignment PIN_AB25 -to gpio_0[30]
set_location_assignment PIN_AB26 -to gpio_0[31]
set_location_assignment PIN_Y11  -to gpio_0[32]
set_location_assignment PIN_AA26 -to gpio_0[33]
set_location_assignment PIN_AA13 -to gpio_0[34]
set_location_assignment PIN_AA11 -to gpio_0[35]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_0[35]

# gpio-1 (JP7)

set_location_assignment PIN_Y15  -to gpio_1[0]
set_location_assignment PIN_AC24 -to gpio_1[1]
set_location_assignment PIN_AA15 -to gpio_1[2]
set_location_assignment PIN_AD26 -to gpio_1[3]
set_location_assignment PIN_AG28 -to gpio_1[4]
set_location_assignment PIN_AF28 -to gpio_1[5]
set_location_assignment PIN_AE25 -to gpio_1[6]
set_location_assignment PIN_AF27 -to gpio_1[7]
set_location_assignment PIN_AG26 -to gpio_1[8]
set_location_assignment PIN_AH27 -to gpio_1[9]
set_location_assignment PIN_AG25 -to gpio_1[10]
set_location_assignment PIN_AH26 -to gpio_1[11]
set_location_assignment PIN_AH24 -to gpio_1[12]
set_location_assignment PIN_AF25 -to gpio_1[13]
set_location_assignment PIN_AG23 -to gpio_1[14]
set_location_assignment PIN_AF23 -to gpio_1[15]
set_location_assignment PIN_AG24 -to gpio_1[16]
set_location_assignment PIN_AH22 -to gpio_1[17]
set_location_assignment PIN_AH21 -to gpio_1[18]
set_location_assignment PIN_AG21 -to gpio_1[19]
set_location_assignment PIN_AH23 -to gpio_1[20]
set_location_assignment PIN_AA20 -to gpio_1[21]
set_location_assignment PIN_AF22 -to gpio_1[22]
set_location_assignment PIN_AE22 -to gpio_1[23]
set_location_assignment PIN_AG20 -to gpio_1[24]
set_location_assignment PIN_AF21 -to gpio_1[25]
set_location_assignment PIN_AG19 -to gpio_1[26]
set_location_assignment PIN_AH19 -to gpio_1[27]
set_location_assignment PIN_AG18 -to gpio_1[28]
set_location_assignment PIN_AH18 -to gpio_1[29]
set_location_assignment PIN_AF18 -to gpio_1[30]
set_location_assignment PIN_AF20 -to gpio_1[31]
set_location_assignment PIN_AG15 -to gpio_1[32]
set_location_assignment PIN_AE20 -to gpio_1[33]
set_location_assignment PIN_AE19 -to gpio_1[34]
set_location_assignment PIN_AE17 -to gpio_1[35]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to gpio_1[35]

# arduino (JP7)

set_location_assignment PIN_AG13 -to arduino_io[0]
set_location_assignment PIN_AF13 -to arduino_io[1]
set_location_assignment PIN_AG10 -to arduino_io[2]
set_location_assignment PIN_AG9  -to arduino_io[3]
set_location_assignment PIN_U14  -to arduino_io[4]
set_location_assignment PIN_U13  -to arduino_io[5]
set_location_assignment PIN_AG8  -to arduino_io[6]
set_location_assignment PIN_AH8  -to arduino_io[7]
set_location_assignment PIN_AF17 -to arduino_io[8]
set_location_assignment PIN_AE15 -to arduino_io[9]
set_location_assignment PIN_AF15 -to arduino_io[10]
set_location_assignment PIN_AG16 -to arduino_io[11]
set_location_assignment PIN_AH11 -to arduino_io[12]
set_location_assignment PIN_AH12 -to arduino_io[13]
set_location_assignment PIN_AH9  -to arduino_io[14]
set_location_assignment PIN_AG11 -to arduino_io[15]
set_location_assignment PIN_AH7  -to arduino_reset_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_io[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to arduino_reset_n

# globals

set_global_assignment -name USE_DLL_FREQUENCY_FOR_DQS_DELAY_CHAIN ON
set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE ON
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS"
set_global_assignment -name ECO_REGENERATE_REPORT ON
set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"

