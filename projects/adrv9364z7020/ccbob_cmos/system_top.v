// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

/*
 Existence of these external ports in the IP (block design) must be verified:
   i2c0_scl_i;
   i2c0_scl_o;
   i2c0_scl_t;
   i2c0_sda_i;
   i2c0_sda_o;
   i2c0_sda_t;
   i2c1_scl_i;
   i2c1_scl_o;
   i2c1_scl_t;
   i2c1_sda_i;
   i2c1_sda_o;
   i2c1_sda_t;
   
   These ports must be connected to their counterparts (e.g. I2C0_SCL_T) on the
   Zynq SOC.
   
*/

`timescale 1ns/100ps

module system_top (

  inout   [14:0]  ddr_addr,
  inout   [ 2:0]  ddr_ba,
  inout           ddr_cas_n,
  inout           ddr_ck_n,
  inout           ddr_ck_p,
  inout           ddr_cke,
  inout           ddr_cs_n,
  inout   [ 3:0]  ddr_dm,
  inout   [31:0]  ddr_dq,
  inout   [ 3:0]  ddr_dqs_n,
  inout   [ 3:0]  ddr_dqs_p,
  inout           ddr_odt,
  inout           ddr_ras_n,
  inout           ddr_reset_n,
  inout           ddr_we_n,

  inout           fixed_io_ddr_vrn,
  inout           fixed_io_ddr_vrp,
  inout   [53:0]  fixed_io_mio,
  inout           fixed_io_ps_clk,
  inout           fixed_io_ps_porb,
  inout           fixed_io_ps_srstb,

  inout           iic_scl,
  inout           iic_sda,

  inout   [31:0]  gpio_bd,

  input           rx_clk_in,
  input           rx_frame_in,
  input   [11:0]  rx_data_in,
  output          tx_clk_out,
  output          tx_frame_out,
  output  [11:0]  tx_data_out,
  output  [ 1:0]  tx_gnd,

  output          enable,
  output          txnrx,
  input           clkout_in,
  output          clkout_out,

  inout           gpio_clksel,
  inout           gpio_resetb,
  inout           gpio_sync,
  inout           gpio_en_agc,
  inout   [ 3:0]  gpio_ctl,
  inout   [ 7:0]  gpio_status,

  output          spi_csn,
  output          spi_clk,
  output          spi_mosi,
  input           spi_miso,
  
  

  output          spi1_csn0,
  output          spi1_csn1,
  output          spi1_csn2,
  output          spi1_clk,
  output          spi1_mosi,
  input           spi1_miso,
//  );//,
  inout           i2c1_sda,
  inout           i2c1_scl,
  
  inout           i2c0_sda,
  inout           i2c0_scl,
  
  input           uart0_rx,
  output          uart0_tx,
  
  output  [8:0]  gp_out,
  input   [8:0]  gp_in);


  // internal signals

  wire    [31:0]  gp_out_s;
  wire    [31:0]  gp_in_s;
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;

  // assignments

  assign tx_gnd = 2'd0;
  assign clkout_out = clkout_in;
  assign gp_out[8:0] = gp_out_s[8:0];
  assign gp_in_s[31:9] = gp_out_s[31:9];
  assign gp_in_s[8: 0] = gp_in[8:0];

  // board gpio - 31-0

  //assign gpio_i[31:31] = gpio_o[31:31];

  ad_iobuf #(.DATA_WIDTH(32)) i_iobuf_bd (
      .dio_t (gpio_t[31:0]),
      .dio_i (gpio_o[31:0]),
      .dio_o (gpio_i[31:0]),
      .dio_p (gpio_bd));

  // ad9361 gpio - 63-32

  assign gpio_i[63:52] = gpio_o[63:52];
  assign gpio_i[50:47] = gpio_o[50:47];

  ad_iobuf #(.DATA_WIDTH(16)) i_iobuf (
    .dio_t ({gpio_t[51], gpio_t[46:32]}),
    .dio_i ({gpio_o[51], gpio_o[46:32]}),
    .dio_o ({gpio_i[51], gpio_i[46:32]}),
    .dio_p ({ gpio_clksel,        // 51:51
              gpio_resetb,        // 46:46
              gpio_sync,          // 45:45
              gpio_en_agc,        // 44:44
              gpio_ctl,           // 43:40
              gpio_status}));     // 39:32

  // instantiations

  system_wrapper i_system_wrapper (
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_cas_n (ddr_cas_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dm (ddr_dm),
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_odt (ddr_odt),
    .ddr_ras_n (ddr_ras_n),
    .ddr_reset_n (ddr_reset_n),
    .ddr_we_n (ddr_we_n),
    .enable (enable),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    .gp_in_0 (gp_in_s[31:0]),
    .gp_out_0 (gp_out_s[31:0]),
    .gpio_i (gpio_i),
    .gpio_o (gpio_o),
    .gpio_t (gpio_t),
    .gps_pps (1'b0),
    .iic_main_scl_io (iic_scl),
    .iic_main_sda_io (iic_sda),
    .i2c0_scl_io (i2c0_scl),
    .i2c0_sda_io (i2c0_sda),
    .i2c1_scl_io (i2c1_scl),
    .i2c1_sda_io (i2c1_sda),
    .otg_vbusoc (1'b0),
    .rx_clk_in (rx_clk_in),
    .rx_data_in (rx_data_in),
    .rx_frame_in (rx_frame_in),
    .spi0_clk_i (1'b0),
    .spi0_clk_o (spi_clk),
    .spi0_csn_0_o (spi_csn),
    .spi0_csn_1_o (),
    .spi0_csn_2_o (),
    .spi0_csn_i (1'b1),
    .spi0_sdi_i (spi_miso),
    .spi0_sdo_i (1'b0),
    .spi0_sdo_o (spi_mosi),
    .spi1_clk_i (1'b0),
    .spi1_clk_o (spi1_clk),
    .spi1_csn_0_o (spi1_csn0),
    .spi1_csn_1_o (spi1_csn1),
    .spi1_csn_2_o (spi1_csn2),
    .spi1_csn_i (1'b1),
    .spi1_sdi_i (spi1_miso),
    .spi1_sdo_i (1'b0),
    .spi1_sdo_o (spi1_mosi),
    .uart0_tx(uart0_tx),
    .uart0_rx(uart0_rx),
    .tdd_sync_i (1'b0),
    .tdd_sync_o (),
    .tdd_sync_t (),
    .tx_clk_out (tx_clk_out),
    .tx_data_out (tx_data_out),
    .tx_frame_out (tx_frame_out),
    .txnrx (txnrx),
    .up_enable (gpio_o[47]),
    .up_txnrx (gpio_o[48]));

endmodule

// ***************************************************************************
// ***************************************************************************
