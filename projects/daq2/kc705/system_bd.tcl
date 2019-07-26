
## FIFO depth is 4Mb - 250k samples
set adc_fifo_name axi_ad9680_fifo
set adc_fifo_address_width 16
set adc_data_width 128
set adc_dma_data_width 64

## FIFO depth is 4Mb - 250k samples
set dac_fifo_name axi_ad9144_fifo
set dac_fifo_address_width 15
set dac_data_width 128
set dac_dma_data_width 128

## NOTE: With this configuration the #36Kb BRAM utilization is at ~80%

source $ad_hdl_dir/projects/common/kc705/kc705_system_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/adcfifo_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/dacfifo_bd.tcl
source ../common/daq2_bd.tcl

