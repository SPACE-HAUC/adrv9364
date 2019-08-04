//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Sun Aug  4 05:26:31 2019
//Host        : sunip-desktop running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (ddr_addr,
    ddr_ba,
    ddr_cas_n,
    ddr_ck_n,
    ddr_ck_p,
    ddr_cke,
    ddr_cs_n,
    ddr_dm,
    ddr_dq,
    ddr_dqs_n,
    ddr_dqs_p,
    ddr_odt,
    ddr_ras_n,
    ddr_reset_n,
    ddr_we_n,
    enable,
    fixed_io_ddr_vrn,
    fixed_io_ddr_vrp,
    fixed_io_mio,
    fixed_io_ps_clk,
    fixed_io_ps_porb,
    fixed_io_ps_srstb,
    gp_in_0,
    gp_out_0,
    gpio_i,
    gpio_o,
    gpio_t,
    gps_pps,
    iic_main_scl_io,
    iic_main_sda_io,
    i2c0_scl_io,
    i2c0_sda_io,
    i2c1_scl_io,
    i2c1_sda_io,
    otg_vbusoc,
    ps_intr_00,
    ps_intr_01,
    ps_intr_02,
    ps_intr_03,
    ps_intr_04,
    ps_intr_05,
    ps_intr_06,
    ps_intr_07,
    ps_intr_08,
    ps_intr_09,
    ps_intr_10,
    ps_intr_11,
    ps_intr_12,
    ps_intr_13,
    ps_intr_15,
    rx_clk_in,
    rx_data_in,
    rx_frame_in,
    spi0_clk_i,
    spi0_clk_o,
    spi0_csn_0_o,
    spi0_csn_1_o,
    spi0_csn_2_o,
    spi0_csn_i,
    spi0_sdi_i,
    spi0_sdo_i,
    spi0_sdo_o,
    spi1_clk_i,
    spi1_clk_o,
    spi1_csn_0_o,
    spi1_csn_1_o,
    spi1_csn_2_o,
    spi1_csn_i,
    spi1_sdi_i,
    spi1_sdo_i,
    spi1_sdo_o,
    tdd_sync_i,
    tdd_sync_o,
    tdd_sync_t,
    tx_clk_out,
    tx_data_out,
    tx_frame_out,
    txnrx,
    up_enable,
    up_txnrx);
  inout [14:0]ddr_addr;
  inout [2:0]ddr_ba;
  inout ddr_cas_n;
  inout ddr_ck_n;
  inout ddr_ck_p;
  inout ddr_cke;
  inout ddr_cs_n;
  inout [3:0]ddr_dm;
  inout [31:0]ddr_dq;
  inout [3:0]ddr_dqs_n;
  inout [3:0]ddr_dqs_p;
  inout ddr_odt;
  inout ddr_ras_n;
  inout ddr_reset_n;
  inout ddr_we_n;
  output enable;
  inout fixed_io_ddr_vrn;
  inout fixed_io_ddr_vrp;
  inout [53:0]fixed_io_mio;
  inout fixed_io_ps_clk;
  inout fixed_io_ps_porb;
  inout fixed_io_ps_srstb;
  input [31:0]gp_in_0;
  output [31:0]gp_out_0;
  input [63:0]gpio_i;
  output [63:0]gpio_o;
  output [63:0]gpio_t;
  input gps_pps;
  inout iic_main_scl_io;
  inout iic_main_sda_io;
  inout i2c0_scl_io;
  inout i2c0_sda_io;
  inout i2c1_scl_io;
  inout i2c1_sda_io;
  input otg_vbusoc;
  input ps_intr_00;
  input ps_intr_01;
  input ps_intr_02;
  input ps_intr_03;
  input ps_intr_04;
  input ps_intr_05;
  input ps_intr_06;
  input ps_intr_07;
  input ps_intr_08;
  input ps_intr_09;
  input ps_intr_10;
  input ps_intr_11;
  input ps_intr_12;
  input ps_intr_13;
  input ps_intr_15;
  input rx_clk_in;
  input [11:0]rx_data_in;
  input rx_frame_in;
  input spi0_clk_i;
  output spi0_clk_o;
  output spi0_csn_0_o;
  output spi0_csn_1_o;
  output spi0_csn_2_o;
  input spi0_csn_i;
  input spi0_sdi_i;
  input spi0_sdo_i;
  output spi0_sdo_o;
  input spi1_clk_i;
  output spi1_clk_o;
  output spi1_csn_0_o;
  output spi1_csn_1_o;
  output spi1_csn_2_o;
  input spi1_csn_i;
  input spi1_sdi_i;
  input spi1_sdo_i;
  output spi1_sdo_o;
  input tdd_sync_i;
  output tdd_sync_o;
  output tdd_sync_t;
  output tx_clk_out;
  output [11:0]tx_data_out;
  output tx_frame_out;
  output txnrx;
  input up_enable;
  input up_txnrx;

  wire [14:0]ddr_addr;
  wire [2:0]ddr_ba;
  wire ddr_cas_n;
  wire ddr_ck_n;
  wire ddr_ck_p;
  wire ddr_cke;
  wire ddr_cs_n;
  wire [3:0]ddr_dm;
  wire [31:0]ddr_dq;
  wire [3:0]ddr_dqs_n;
  wire [3:0]ddr_dqs_p;
  wire ddr_odt;
  wire ddr_ras_n;
  wire ddr_reset_n;
  wire ddr_we_n;
  wire enable;
  wire fixed_io_ddr_vrn;
  wire fixed_io_ddr_vrp;
  wire [53:0]fixed_io_mio;
  wire fixed_io_ps_clk;
  wire fixed_io_ps_porb;
  wire fixed_io_ps_srstb;
  wire [31:0]gp_in_0;
  wire [31:0]gp_out_0;
  wire [63:0]gpio_i;
  wire [63:0]gpio_o;
  wire [63:0]gpio_t;
  wire gps_pps;
  wire iic_main_scl_i;
  wire iic_main_scl_io;
  wire iic_main_scl_o;
  wire iic_main_scl_t;
  wire iic_main_sda_i;
  wire iic_main_sda_io;
  wire iic_main_sda_o;
  wire iic_main_sda_t;
  wire i2c0_scl_io;
  wire i2c0_sda_io;
  wire i2c0_scl_i;
  wire i2c0_scl_o;
  wire i2c0_scl_t;
  wire i2c0_sda_i;
  wire i2c0_sda_o;
  wire i2c0_sda_t;
  wire i2c1_scl_io;
  wire i2c1_sda_io;
  wire i2c1_scl_i;
  wire i2c1_scl_o;
  wire i2c1_scl_t;
  wire i2c1_sda_i;
  wire i2c1_sda_o;
  wire i2c1_sda_t;
  wire otg_vbusoc;
  wire ps_intr_00;
  wire ps_intr_01;
  wire ps_intr_02;
  wire ps_intr_03;
  wire ps_intr_04;
  wire ps_intr_05;
  wire ps_intr_06;
  wire ps_intr_07;
  wire ps_intr_08;
  wire ps_intr_09;
  wire ps_intr_10;
  wire ps_intr_11;
  wire ps_intr_12;
  wire ps_intr_13;
  wire ps_intr_15;
  wire rx_clk_in;
  wire [11:0]rx_data_in;
  wire rx_frame_in;
  wire spi0_clk_i;
  wire spi0_clk_o;
  wire spi0_csn_0_o;
  wire spi0_csn_1_o;
  wire spi0_csn_2_o;
  wire spi0_csn_i;
  wire spi0_sdi_i;
  wire spi0_sdo_i;
  wire spi0_sdo_o;
  wire spi1_clk_i;
  wire spi1_clk_o;
  wire spi1_csn_0_o;
  wire spi1_csn_1_o;
  wire spi1_csn_2_o;
  wire spi1_csn_i;
  wire spi1_sdi_i;
  wire spi1_sdo_i;
  wire spi1_sdo_o;
  wire tdd_sync_i;
  wire tdd_sync_o;
  wire tdd_sync_t;
  wire tx_clk_out;
  wire [11:0]tx_data_out;
  wire tx_frame_out;
  wire txnrx;
  wire up_enable;
  wire up_txnrx;

  IOBUF iic_main_scl_iobuf
       (.I(iic_main_scl_o),
        .IO(iic_main_scl_io),
        .O(iic_main_scl_i),
        .T(iic_main_scl_t));
  IOBUF iic_main_sda_iobuf
       (.I(iic_main_sda_o),
        .IO(iic_main_sda_io),
        .O(iic_main_sda_i),
        .T(iic_main_sda_t));
  IOBUF i2c0_scl_iobuf
       (.I(i2c0_scl_o),
        .IO(i2c0_scl_io),
        .O(i2c0_scl_i),
        .T(i2c0_scl_t)
       );
  IOBUF i2c0_sda_iobuf
       (.I(i2c0_sda_o),
        .IO(i2c0_sda_io),
        .O(i2c0_sda_i),
        .T(i2c0_sda_t)
       );
  IOBUF i2c1_scl_iobuf
       (.I(i2c1_scl_o),
        .IO(i2c1_scl_io),
        .O(i2c1_scl_i),
        .T(i2c1_scl_t)
       );
  IOBUF i2c1_sda_iobuf
       (.I(i2c1_sda_o),
        .IO(i2c1_sda_io),
        .O(i2c1_sda_i),
        .T(i2c1_sda_t)
       );
  system system_i
       (.ddr_addr(ddr_addr),
        .ddr_ba(ddr_ba),
        .ddr_cas_n(ddr_cas_n),
        .ddr_ck_n(ddr_ck_n),
        .ddr_ck_p(ddr_ck_p),
        .ddr_cke(ddr_cke),
        .ddr_cs_n(ddr_cs_n),
        .ddr_dm(ddr_dm),
        .ddr_dq(ddr_dq),
        .ddr_dqs_n(ddr_dqs_n),
        .ddr_dqs_p(ddr_dqs_p),
        .ddr_odt(ddr_odt),
        .ddr_ras_n(ddr_ras_n),
        .ddr_reset_n(ddr_reset_n),
        .ddr_we_n(ddr_we_n),
        .enable(enable),
        .fixed_io_ddr_vrn(fixed_io_ddr_vrn),
        .fixed_io_ddr_vrp(fixed_io_ddr_vrp),
        .fixed_io_mio(fixed_io_mio),
        .fixed_io_ps_clk(fixed_io_ps_clk),
        .fixed_io_ps_porb(fixed_io_ps_porb),
        .fixed_io_ps_srstb(fixed_io_ps_srstb),
        .gp_in_0(gp_in_0),
        .gp_out_0(gp_out_0),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .gpio_t(gpio_t),
        .gps_pps(gps_pps),
        .iic_main_scl_i(iic_main_scl_i),
        .iic_main_scl_o(iic_main_scl_o),
        .iic_main_scl_t(iic_main_scl_t),
        .iic_main_sda_i(iic_main_sda_i),
        .iic_main_sda_o(iic_main_sda_o),
        .iic_main_sda_t(iic_main_sda_t),
        .i2c0_sda_i(i2c0_sda_i),
        .i2c0_sda_o(i2c0_sda_o),
        .i2c0_sda_t(i2c0_sda_t),
        .i2c0_scl_i(i2c0_scl_i),
        .i2c0_scl_o(i2c0_scl_o),
        .i2c0_scl_t(i2c0_scl_t),        
        .i2c1_sda_i(i2c1_sda_i),
        .i2c1_sda_o(i2c1_sda_o),
        .i2c1_sda_t(i2c1_sda_t),
        .i2c1_scl_i(i2c1_scl_i),
        .i2c1_scl_o(i2c1_scl_o),
        .i2c1_scl_t(i2c1_scl_t),
        .otg_vbusoc(otg_vbusoc),
        .ps_intr_00(ps_intr_00),
        .ps_intr_01(ps_intr_01),
        .ps_intr_02(ps_intr_02),
        .ps_intr_03(ps_intr_03),
        .ps_intr_04(ps_intr_04),
        .ps_intr_05(ps_intr_05),
        .ps_intr_06(ps_intr_06),
        .ps_intr_07(ps_intr_07),
        .ps_intr_08(ps_intr_08),
        .ps_intr_09(ps_intr_09),
        .ps_intr_10(ps_intr_10),
        .ps_intr_11(ps_intr_11),
        .ps_intr_12(ps_intr_12),
        .ps_intr_13(ps_intr_13),
        .ps_intr_15(ps_intr_15),
        .rx_clk_in(rx_clk_in),
        .rx_data_in(rx_data_in),
        .rx_frame_in(rx_frame_in),
        .spi0_clk_i(spi0_clk_i),
        .spi0_clk_o(spi0_clk_o),
        .spi0_csn_0_o(spi0_csn_0_o),
        .spi0_csn_1_o(spi0_csn_1_o),
        .spi0_csn_2_o(spi0_csn_2_o),
        .spi0_csn_i(spi0_csn_i),
        .spi0_sdi_i(spi0_sdi_i),
        .spi0_sdo_i(spi0_sdo_i),
        .spi0_sdo_o(spi0_sdo_o),
        .spi1_clk_i(spi1_clk_i),
        .spi1_clk_o(spi1_clk_o),
        .spi1_csn_0_o(spi1_csn_0_o),
        .spi1_csn_1_o(spi1_csn_1_o),
        .spi1_csn_2_o(spi1_csn_2_o),
        .spi1_csn_i(spi1_csn_i),
        .spi1_sdi_i(spi1_sdi_i),
        .spi1_sdo_i(spi1_sdo_i),
        .spi1_sdo_o(spi1_sdo_o),
        .tdd_sync_i(tdd_sync_i),
        .tdd_sync_o(tdd_sync_o),
        .tdd_sync_t(tdd_sync_t),
        .tx_clk_out(tx_clk_out),
        .tx_data_out(tx_data_out),
        .tx_frame_out(tx_frame_out),
        .txnrx(txnrx),
        .up_enable(up_enable),
        .up_txnrx(up_txnrx));
endmodule
