
source $ad_hdl_dir/projects/common/kc705/kc705_system_bd.tcl
source ../common/fmcjesdadc1_bd.tcl

ad_ip_parameter axi_ad9250_0_dma CONFIG.DMA_DATA_WIDTH_DEST 512
ad_ip_parameter axi_ad9250_0_dma CONFIG.FIFO_SIZE 32
ad_ip_parameter axi_ad9250_1_dma CONFIG.DMA_DATA_WIDTH_DEST 512
ad_ip_parameter axi_ad9250_1_dma CONFIG.FIFO_SIZE 32

