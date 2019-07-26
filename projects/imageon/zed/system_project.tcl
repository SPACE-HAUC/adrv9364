# load script

source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project_xilinx imageon_zed
adi_project_files imageon_zed [list \
  "system_top.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v" \
  "system_constr.xdc"]

adi_project_run imageon_zed

