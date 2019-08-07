hsi open_hw_design system_top.hdf
hsi set_repo_path "/home/sunip/xilinx_linux/device-tree-xlnx"
set cpu_name [lindex [hsi get_cells -filter {IP_TYPE==PROCESSOR}] 0]
hsi create_sw_design device-tree -os device_tree -proc $cpu_name
hsi generate_target -dir ./
