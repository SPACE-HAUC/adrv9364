#
# The ADI JESD204 Core is released under the following license, which is
# different than all other HDL cores in this repository.
#
# Please read this, and understand the freedoms and responsibilities you have
# by using this source code/core.
#
# The JESD204 HDL, is copyright © 2016-2017 Analog Devices Inc.
#
# This core is free software, you can use run, copy, study, change, ask
# questions about and improve this core. Distribution of source, or resulting
# binaries (including those inside an FPGA or ASIC) require you to release the
# source of the entire project (excluding the system libraries provide by the
# tools/compiler/FPGA vendor). These are the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
#
# This core  is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License version 2
# along with this source code, and binary.  If not, see
# <http://www.gnu.org/licenses/>.
#
# Commercial licenses (with commercial support) of this JESD204 core are also
# available under terms different than the General Public License. (e.g. they
# do not require you to accompany any image (FPGA or ASIC) using the JESD204
# core with any corresponding source code.) For these alternate terms you must
# purchase a license from Analog Devices Technology Licensing Office. Users
# interested in such a license should contact jesd204-licensing@analog.com for
# more information. This commercial license is sub-licensable (if you purchase
# chips from Analog Devices, incorporate them into your PCB level product, and
# purchase a JESD204 license, end users of your product will also have a
# license to use this core in a commercial setting without releasing their
# source code).
#
# In addition, we kindly ask you to acknowledge ADI in any program, application
# or publication in which you use this JESD204 HDL core. (You are not required
# to do so; it is up to your common sense to decide whether you want to comply
# with this request or not.) For general publications, we suggest referencing :
# “The design and implementation of the JESD204 HDL Core used in this project
# is copyright © 2016-2017, Analog Devices, Inc.”
#

proc adi_axi_jesd204_tx_create {ip_name num_lanes {num_links 1}} {

  if {$num_lanes < 1 || $num_lanes > 8} {
    return -code 1 "ERROR: Invalid number of JESD204B lanes. (Supported range 1-8)"
  }

  if {$num_links < 1 || $num_links > 8} {
    return -code 1 "ERROR: Invalid number of JESD204B links. (Supported range 1-8)"
  }

  startgroup

  set result [catch {

    create_bd_cell -type hier $ip_name

    ad_ip_instance axi_jesd204_tx "${ip_name}/tx_axi"
    ad_ip_instance jesd204_tx "${ip_name}/tx"

    ad_ip_parameter "${ip_name}/tx_axi" CONFIG.NUM_LANES $num_lanes
    ad_ip_parameter "${ip_name}/tx_axi" CONFIG.NUM_LINKS $num_links
    ad_ip_parameter "${ip_name}/tx"     CONFIG.NUM_LANES $num_lanes
    ad_ip_parameter "${ip_name}/tx"     CONFIG.NUM_LINKS $num_links

    ad_connect "${ip_name}/tx_axi/core_reset" "${ip_name}/tx/reset"
    ad_connect "${ip_name}/tx_axi/tx_ctrl" "${ip_name}/tx/tx_ctrl"
    ad_connect "${ip_name}/tx_axi/tx_cfg" "${ip_name}/tx/tx_cfg"
    ad_connect "${ip_name}/tx/tx_event" "${ip_name}/tx_axi/tx_event"
    ad_connect "${ip_name}/tx/tx_status" "${ip_name}/tx_axi/tx_status"
    ad_connect "${ip_name}/tx/tx_ilas_config" "${ip_name}/tx_axi/tx_ilas_config"

    # Control interface
    create_bd_pin -dir I -type clk "${ip_name}/s_axi_aclk"
    create_bd_pin -dir I -type rst "${ip_name}/s_axi_aresetn"
    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 "${ip_name}/s_axi"
    create_bd_pin -dir O -type intr "${ip_name}/irq"

    ad_connect "${ip_name}/s_axi_aclk" "${ip_name}/tx_axi/s_axi_aclk"
    ad_connect "${ip_name}/s_axi_aresetn" "${ip_name}/tx_axi/s_axi_aresetn"
    ad_connect "${ip_name}/s_axi" "${ip_name}/tx_axi/s_axi"
    ad_connect "${ip_name}/tx_axi/irq" "${ip_name}/irq"

    # JESD204 processing
    create_bd_pin -dir I -type clk "${ip_name}/device_clk"
    create_bd_pin -dir I -from [expr $num_links - 1] -to 0 "${ip_name}/sync"
    create_bd_pin -dir I "${ip_name}/sysref"

    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 "${ip_name}/tx_data"

    ad_connect "${ip_name}/device_clk" "${ip_name}/tx_axi/core_clk"
    ad_connect "${ip_name}/device_clk" "${ip_name}/tx/clk"
    ad_connect "${ip_name}/sync" "${ip_name}/tx/sync"
    ad_connect "${ip_name}/sysref" "${ip_name}/tx/sysref"
    ad_connect "${ip_name}/tx_data" "${ip_name}/tx/tx_data"

    for {set i 0} {$i < $num_lanes} {incr i} {
      create_bd_intf_pin -mode Master -vlnv xilinx.com:display_jesd204:jesd204_tx_bus_rtl:1.0 "${ip_name}/tx_phy${i}"
      ad_connect "${ip_name}/tx/tx_phy${i}" "${ip_name}/tx_phy${i}"
    }
  } resulttext resultoptions]

  dict unset resultoptions -level

  endgroup

  if {$result != 0} {
    undo -quiet
  }

  return -options $resultoptions $resulttext
}

proc adi_axi_jesd204_rx_create {ip_name num_lanes {num_links 1}} {

  if {$num_lanes < 1 || $num_lanes > 8} {
    return -code 1 "ERROR: Invalid number of JESD204B lanes. (Supported range 1-8)"
  }

  if {$num_links < 1 || $num_links > 8} {
    return -code 1 "ERROR: Invalid number of JESD204B links. (Supported range 1-8)"
  }

  startgroup

  set result [catch {

    create_bd_cell -type hier $ip_name

    ad_ip_instance axi_jesd204_rx "${ip_name}/rx_axi"
    ad_ip_instance jesd204_rx "${ip_name}/rx"

    ad_ip_parameter "${ip_name}/rx_axi" CONFIG.NUM_LANES $num_lanes
    ad_ip_parameter "${ip_name}/rx_axi" CONFIG.NUM_LINKS $num_links
    ad_ip_parameter "${ip_name}/rx"     CONFIG.NUM_LANES $num_lanes
    ad_ip_parameter "${ip_name}/rx"     CONFIG.NUM_LINKS $num_links

    ad_connect "${ip_name}/rx_axi/core_reset" "${ip_name}/rx/reset"
    ad_connect "${ip_name}/rx_axi/rx_cfg" "${ip_name}/rx/rx_cfg"
    ad_connect "${ip_name}/rx/rx_event" "${ip_name}/rx_axi/rx_event"
    ad_connect "${ip_name}/rx/rx_status" "${ip_name}/rx_axi/rx_status"
    ad_connect "${ip_name}/rx/rx_ilas_config" "${ip_name}/rx_axi/rx_ilas_config"

    # Control interface
    create_bd_pin -dir I -type clk "${ip_name}/s_axi_aclk"
    create_bd_pin -dir I -type rst "${ip_name}/s_axi_aresetn"
    create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 "${ip_name}/s_axi"
    create_bd_pin -dir O -type intr "${ip_name}/irq"

    ad_connect "${ip_name}/s_axi_aclk" "${ip_name}/rx_axi/s_axi_aclk"
    ad_connect "${ip_name}/s_axi_aresetn" "${ip_name}/rx_axi/s_axi_aresetn"
    ad_connect "${ip_name}/s_axi" "${ip_name}/rx_axi/s_axi"
    ad_connect "${ip_name}/rx_axi/irq" "${ip_name}/irq"

    # JESD204 processing
    create_bd_pin -dir I -type clk "${ip_name}/device_clk"
    create_bd_pin -dir O -from [expr $num_links - 1] -to 0 "${ip_name}/sync"
    create_bd_pin -dir I "${ip_name}/sysref"
    create_bd_pin -dir O "${ip_name}/phy_en_char_align"
#    create_bd_pin -dir I "${ip_name}/phy_ready"
    create_bd_pin -dir O -from 3 -to 0 "${ip_name}/rx_eof"
    create_bd_pin -dir O -from 3 -to 0 "${ip_name}/rx_sof"

#    create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 "${ip_name}/rx_data"
    create_bd_pin -dir O "${ip_name}/rx_data_tvalid"
    create_bd_pin -dir O -from [expr $num_lanes * 32 - 1] -to 0 "${ip_name}/rx_data_tdata"

    ad_connect "${ip_name}/device_clk" "${ip_name}/rx_axi/core_clk"
    ad_connect "${ip_name}/device_clk" "${ip_name}/rx/clk"
    ad_connect "${ip_name}/rx/sync" "${ip_name}/sync"
    ad_connect "${ip_name}/sysref" "${ip_name}/rx/sysref"
#    ad_connect "${ip_name}/phy_ready" "${ip_name}/rx/phy_ready"
    ad_connect "${ip_name}/rx/phy_en_char_align" "${ip_name}/phy_en_char_align"
    ad_connect "${ip_name}/rx/rx_data" "${ip_name}/rx_data_tdata"
    ad_connect "${ip_name}/rx/rx_valid" "${ip_name}/rx_data_tvalid"
    ad_connect "${ip_name}/rx/rx_eof" "${ip_name}/rx_eof"
    ad_connect "${ip_name}/rx/rx_sof" "${ip_name}/rx_sof"

    for {set i 0} {$i < $num_lanes} {incr i} {
      create_bd_intf_pin -mode Slave -vlnv xilinx.com:display_jesd204:jesd204_rx_bus_rtl:1.0 "${ip_name}/rx_phy${i}"
      ad_connect "${ip_name}/rx/rx_phy${i}" "${ip_name}/rx_phy${i}"
    }
  } resulttext resultoptions]

  dict unset resultoptions -level

  endgroup

  if {$result != 0} {
    undo -quiet
  }

  return -options $resultoptions $resulttext
}
