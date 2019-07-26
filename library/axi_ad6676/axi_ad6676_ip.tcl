# ip

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip.tcl

adi_ip_create axi_ad6676
adi_ip_files axi_ad6676 [list \
  "axi_ad6676.v" ]

adi_ip_properties axi_ad6676

adi_ip_add_core_dependencies { \
  analog.com:user:ad_ip_jesd204_tpl_adc:1.0 \
}

set_property driver_value 0 [ipx::get_ports *rx_valid* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *dovf* -of_objects [ipx::current_core]]

ipx::infer_bus_interface rx_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface adc_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]
