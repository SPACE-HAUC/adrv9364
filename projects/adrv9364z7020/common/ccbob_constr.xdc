
## constraints (ccbrk.c + ccbrk_lb.a)
## ad9361 clkout forward

set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports clkout_out] 

## push-buttons- led- dip-switches- loopbacks- (ps7 gpio)

set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[0]}] ; ##U1,Y14,PB_GPIO_1,JX4,38,P6,19 [S7 on BOB]     960
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[1]}] ; ##U1,T16,PB_GPIO_2,JX4,41,P6,26 [S8 on BOB]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[2]}] ; ##U1,U17,PB_GPIO_3,JX4,41,P6,28 [S9 on BOB]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[3]}] ; ##U1,Y19,LED_GPIO_0,JX4,69,P7,16 [DS3 on BOB]

## orphans- io- (ps7 gpio)

set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[4]}] ; ##U1,V5,IO_L06_13_JX2_P,JX2,16,P2,13             964
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[5]}] ; ##U1,V11,IO_L21_13_JX2_P,JX2,67,P2,52
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[6]}] ; ##U1,V10,IO_L21_13_JX2_N,JX2,69,P2,54
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[7]}] ; ##U1,V16,IO_L18_34_JX4_P,JX4,68,P7,30 [PWM for BOB fan]

## ps7- fixed io- to- fpga regular io (ps7 gpio)

set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[8]}] ; ##U1,V15,IO_L10_34_JX4_P,JX4,42,P6,25           968
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[9]}] ; ##U1,Y18,IO_L17_34_JX4_P,JX4,67,P6,9
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[10]}] ; ##U1,Y17,IO_L07_34_JX4_N,JX4,37,P6,20

## ps7 gpio

set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[11]}] ; ##U1,V20,IO_L16_34_JX4_P,JX4,58,P7,5           971
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[12]}] ; ##U1,V17,IO_L21_34_JX4_P,JX4,77,P7,26
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[13]}] ; ##U1,R17,IO_L19_34_JX4_N,JX4,75,P7,20
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[14]}] ; ##U1,P20,IO_L14_SRCC_34_JX4_N,JX4,54,P7,3
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[15]}] ; ##U1,R16,IO_L19_34_JX4_P,JX4,73,P7,18          975
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[16]}] ; ##U1,N20,IO_L14_SRCC_34_JX4_P,JX4,52,P7,1
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[17]}] ; ##U1,P19,IO_L13_MRCC_34_JX4_N,JX4,53,P7,4
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[18]}] ; ##U1,W14,IO_L08_34_JX4_P,JX4,36,P6,17
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[19]}] ; ##U1,T20,IO_L15_34_JX4_P,JX4,57,P7,6
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[20]}] ; ##U1,U18,IO_L12_MRCC_34_JX4_P,JX4,46,P6,29     980
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[21]}] ; ##U1,T15,IO_L05_34_JX4_N,JX4,33,P6,16
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[22]}] ; ##U1,U12,IO_L02_34_JX4_N,JX4,34,P6,3
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[23]}] ; ##U1,Y16,IO_L07_34_JX4_P,JX4,35,P6,18
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[24]}] ; ##U1,V12,IO_L04_34_JX4_P,JX4,26,P6,5
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[25]}] ; ##U1,U14,IO_L11_SRCC_34_JX4_P,JX4,45,P6,30     985
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[26]}] ; ##U1,W13,IO_L04_34_JX4_N,JX4,28,P6,7
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[27]}] ; ##U1,U15,IO_L11_SRCC_34_JX4_N,JX4,47,P6,32
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[28]}] ; ##U1,P14,IO_L06_34_JX4_P,JX4,32,P6,13
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[29]}] ; ##U1,N18,IO_L13_MRCC_34_JX4_P,JX4,51,P7,2
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {gpio_bd[30]}] ; ##U1,R14,IO_L06_34_JX4_N,JX4,34,P6,15          990

## ps7- fixed io- to- ps7- fixed io (reference only)
## U1,B14,PS_MIO47_501_JX4,JX4,94,PS_MIO47_501_JX4,P7,24 == U1,D16,PS_MIO46_501_JX4,JX4,92,PS_MIO46_501_JX4,P7,22

## ps7- fixed io- orphans (reference only)
## U1,E6,PS_MIO00_500_JX4,JX4,97,PS_MIO00_500_JX4,P5,21
## U1,E8,PS_MIO13_500_JX4,JX4,91,PS_MIO13_500_JX4,P5,9
## U1,C5,PS_MIO14_500_JX4,JX4,93,PS_MIO14_500_JX4,P5,11
## U1,D9,PS_MIO12_500_JX4,JX4,86,PS_MIO12_500_JX4,P7,10
## U1,C6,PS_MIO11_500_JX4,JX4,88,PS_MIO11_500_JX4,P7,12

## fpga- regular io

#set_property  -dict {PACKAGE_PIN  U7      IOSTANDARD  LVCMOS25} [get_ports  gp_out[0]]    ; ## U1,U7,IO_L11_SRCC_13_JX2_P,JX2,35,IO_L11_SRCC_13_JX2_P,P2,28
#set_property  -dict {PACKAGE_PIN  T9      IOSTANDARD  LVCMOS25} [get_ports  gp_in[0]]     ; ## U1,T9,IO_L12_MRCC_13_JX2_P,JX2,36,IO_L12_MRCC_13_JX2_P,P2,27
#set_property  -dict {PACKAGE_PIN  V7      IOSTANDARD  LVCMOS25} [get_ports  gp_out[1]]    ; ## U1,V7,IO_L11_SRCC_13_JX2_N,JX2,37,IO_L11_SRCC_13_JX2_N,P2,30
#set_property  -dict {PACKAGE_PIN  U10     IOSTANDARD  LVCMOS25} [get_ports  gp_in[1]]     ; ## U1,U10,IO_L12_MRCC_13_JX2_N,JX2,38,IO_L12_MRCC_13_JX2_N,P2,29
#set_property  -dict {PACKAGE_PIN  Y7      IOSTANDARD  LVCMOS25} [get_ports  gp_out[2]]    ; ## U1,Y7,IO_L13_MRCC_13_JX2_P,JX2,41,IO_L13_MRCC_13_JX2_P,P2,32
#set_property  -dict {PACKAGE_PIN  Y9      IOSTANDARD  LVCMOS25} [get_ports  gp_in[2]]     ; ## U1,Y9,IO_L14_SRCC_13_JX2_P,JX2,42,IO_L14_SRCC_13_JX2_P,P2,31
#set_property  -dict {PACKAGE_PIN  Y6      IOSTANDARD  LVCMOS25} [get_ports  gp_out[3]]    ; ## U1,Y6,IO_L13_MRCC_13_JX2_N,JX2,43,IO_L13_MRCC_13_JX2_N,P2,34
#set_property  -dict {PACKAGE_PIN  Y8      IOSTANDARD  LVCMOS25} [get_ports  gp_in[3]]     ; ## U1,Y8,IO_L14_SRCC_13_JX2_N,JX2,44,IO_L14_SRCC_13_JX2_N,P2,33
#set_property  -dict {PACKAGE_PIN  V8      IOSTANDARD  LVCMOS25} [get_ports  gp_out[4]]    ; ## U1,V8,IO_L15_13_JX2_P,JX2,47,IO_L15_13_JX2_P,P2,38
#set_property  -dict {PACKAGE_PIN  W10     IOSTANDARD  LVCMOS25} [get_ports  gp_in[4]]     ; ## U1,W10,IO_L16_13_JX2_P,JX2,48,IO_L16_13_JX2_P,P2,37
#set_property  -dict {PACKAGE_PIN  W8      IOSTANDARD  LVCMOS25} [get_ports  gp_out[5]]    ; ## U1,W8,IO_L15_13_JX2_N,JX2,49,IO_L15_13_JX2_N,P2,40
#set_property  -dict {PACKAGE_PIN  W9      IOSTANDARD  LVCMOS25} [get_ports  gp_in[5]]     ; ## U1,W9,IO_L16_13_JX2_N,JX2,50,IO_L16_13_JX2_N,P2,39
#set_property  -dict {PACKAGE_PIN  U9      IOSTANDARD  LVCMOS25} [get_ports  gp_out[6]]    ; ## U1,U9,IO_L17_13_JX2_P,JX2,53,IO_L17_13_JX2_P,P2,42
#set_property  -dict {PACKAGE_PIN  W11     IOSTANDARD  LVCMOS25} [get_ports  gp_in[6]]     ; ## U1,W11,IO_L18_13_JX2_P,JX2,54,IO_L18_13_JX2_P,P2,41
#set_property  -dict {PACKAGE_PIN  U8      IOSTANDARD  LVCMOS25} [get_ports  gp_out[7]]    ; ## U1,U8,IO_L17_13_JX2_N,JX2,55,IO_L17_13_JX2_N,P2,44
#set_property  -dict {PACKAGE_PIN  Y11     IOSTANDARD  LVCMOS25} [get_ports  gp_in[7]]     ; ## U1,Y11,IO_L18_13_JX2_N,JX2,56,IO_L18_13_JX2_N,P2,43
#set_property  -dict {PACKAGE_PIN  T5      IOSTANDARD  LVCMOS25} [get_ports  gp_out[8]]    ; ## U1,T5,IO_L19_13_JX2_P,JX2,61,IO_L19_13_JX2_P,P2,46
#set_property  -dict {PACKAGE_PIN  Y12     IOSTANDARD  LVCMOS25} [get_ports  gp_in[8]]     ; ## U1,Y12,IO_L20_13_JX2_P,JX2,62,IO_L20_13_JX2_P,P2,45
#set_property  -dict {PACKAGE_PIN  U5      IOSTANDARD  LVCMOS25} [get_ports  gp_out[9]]    ; ## U1,U5,IO_L19_13_JX2_N,JX2,63,IO_L19_13_JX2_N,P2,48
#set_property  -dict {PACKAGE_PIN  Y13     IOSTANDARD  LVCMOS25} [get_ports  gp_in[9]]     ; ## U1,Y13,IO_L20_13_JX2_N,JX2,64,IO_L20_13_JX2_N,P2,47
#set_property  -dict {PACKAGE_PIN  W15     IOSTANDARD  LVCMOS25} [get_ports  gp_out[10]]   ; ## U1,W15,IO_L10_34_JX4_N,JX4,44,IO_L10_34_JX4_N,P6,27
#set_property  -dict {PACKAGE_PIN  T19     IOSTANDARD  LVCMOS25} [get_ports  gp_in[10]]    ; ## U1,T19,IO_25_34_JX4,JX4,64,IO_25_34_JX4,P5,23
#set_property  -dict {PACKAGE_PIN  T11     IOSTANDARD  LVCMOS25} [get_ports  gp_out[11]]   ; ## U1,T11,IO_L01_34_JX4_P,JX4,19,IO_L01_34_JX4_P,P6,2
#set_property  -dict {PACKAGE_PIN  T12     IOSTANDARD  LVCMOS25} [get_ports  gp_in[11]]    ; ## U1,T12,IO_L02_34_JX4_P,JX4,20,IO_L02_34_JX4_P,P6,1
#set_property  -dict {PACKAGE_PIN  T10     IOSTANDARD  LVCMOS25} [get_ports  gp_out[12]]   ; ## U1,T10,IO_L01_34_JX4_N,JX4,21,IO_L01_34_JX4_N,P6,4
#set_property  -dict {PACKAGE_PIN  U12     IOSTANDARD  LVCMOS25} [get_ports  gp_in[12]]    ; ## U1,U12,IO_L02_34_JX4_N,JX4,22,IO_L02_34_JX4_N,P6,3
#set_property  -dict {PACKAGE_PIN  U13     IOSTANDARD  LVCMOS25} [get_ports  gp_out[13]]   ; ## U1,U13,IO_L03_34_JX4_P,JX4,25,IO_L03_34_JX4_P,P6,6
#set_property  -dict {PACKAGE_PIN  V12     IOSTANDARD  LVCMOS25} [get_ports  gp_in[13]]    ; ## U1,V12,IO_L04_34_JX4_P,JX4,26,IO_L04_34_JX4_P,P6,5
#set_property  -dict {PACKAGE_PIN  V13     IOSTANDARD  LVCMOS25} [get_ports  gp_out[14]]   ; ## U1,V13,IO_L03_34_JX4_N,JX4,27,IO_L03_34_JX4_N,P6,8
#set_property  -dict {PACKAGE_PIN  W13     IOSTANDARD  LVCMOS25} [get_ports  gp_in[14]]    ; ## U1,W13,IO_L04_34_JX4_N,JX4,28,IO_L04_34_JX4_N,P6,7
#set_property  -dict {PACKAGE_PIN  T14     IOSTANDARD  LVCMOS25} [get_ports  gp_out[15]]   ; ## U1,T14,IO_L05_34_JX4_P,JX4,31,IO_L05_34_JX4_P,P6,14
#set_property  -dict {PACKAGE_PIN  P14     IOSTANDARD  LVCMOS25} [get_ports  gp_in[15]]    ; ## U1,P14,IO_L06_34_JX4_P,JX4,32,IO_L06_34_JX4_P,P6,13
#set_property  -dict {PACKAGE_PIN  T15     IOSTANDARD  LVCMOS25} [get_ports  gp_out[16]]   ; ## U1,T15,IO_L05_34_JX4_N,JX4,33,IO_L05_34_JX4_N,P6,16
#set_property  -dict {PACKAGE_PIN  R14     IOSTANDARD  LVCMOS25} [get_ports  gp_in[16]]    ; ## U1,R14,IO_L06_34_JX4_N,JX4,34,IO_L06_34_JX4_N,P6,15
#set_property  -dict {PACKAGE_PIN  Y16     IOSTANDARD  LVCMOS25} [get_ports  gp_out[17]]   ; ## U1,Y16,IO_L07_34_JX4_P,JX4,35,IO_L07_34_JX4_P,P6,18
#set_property  -dict {PACKAGE_PIN  W14     IOSTANDARD  LVCMOS25} [get_ports  gp_in[17]]    ; ## U1,W14,IO_L08_34_JX4_P,JX4,36,IO_L08_34_JX4_P,P6,17
#set_property  -dict {PACKAGE_PIN  U14     IOSTANDARD  LVCMOS25} [get_ports  gp_out[18]]   ; ## U1,U14,IO_L11_SRCC_34_JX4_P,JX4,45,IO_L11_SRCC_34_JX4_P,P6,30
#set_property  -dict {PACKAGE_PIN  U18     IOSTANDARD  LVCMOS25} [get_ports  gp_in[18]]    ; ## U1,U18,IO_L12_MRCC_34_JX4_P,JX4,46,IO_L12_MRCC_34_JX4_P,P6,29
#set_property  -dict {PACKAGE_PIN  U15     IOSTANDARD  LVCMOS25} [get_ports  gp_out[19]]   ; ## U1,U15,IO_L11_SRCC_34_JX4_N,JX4,47,IO_L11_SRCC_34_JX4_N,P6,32
#set_property  -dict {PACKAGE_PIN  U19     IOSTANDARD  LVCMOS25} [get_ports  gp_in[19]]    ; ## U1,U19,IO_L12_MRCC_34_JX4_N,JX4,48,IO_L12_MRCC_34_JX4_N,P6,31
#set_property  -dict {PACKAGE_PIN  N18     IOSTANDARD  LVCMOS25} [get_ports  gp_out[20]]   ; ## U1,N18,IO_L13_MRCC_34_JX4_P,JX4,51,IO_L13_MRCC_34_JX4_P,P7,2
#set_property  -dict {PACKAGE_PIN  N20     IOSTANDARD  LVCMOS25} [get_ports  gp_in[20]]    ; ## U1,N20,IO_L14_SRCC_34_JX4_P,JX4,52,IO_L14_SRCC_34_JX4_P,P7,1
#set_property  -dict {PACKAGE_PIN  P19     IOSTANDARD  LVCMOS25} [get_ports  gp_out[21]]   ; ## U1,P19,IO_L13_MRCC_34_JX4_N,JX4,53,IO_L13_MRCC_34_JX4_N,P7,4
#set_property  -dict {PACKAGE_PIN  P20     IOSTANDARD  LVCMOS25} [get_ports  gp_in[21]]    ; ## U1,P20,IO_L14_SRCC_34_JX4_N,JX4,54,IO_L14_SRCC_34_JX4_N,P7,3
#set_property  -dict {PACKAGE_PIN  T20     IOSTANDARD  LVCMOS25} [get_ports  gp_out[22]]   ; ## U1,T20,IO_L15_34_JX4_P,JX4,57,IO_L15_34_JX4_P,P7,6
#set_property  -dict {PACKAGE_PIN  V20     IOSTANDARD  LVCMOS25} [get_ports  gp_in[22]]    ; ## U1,V20,IO_L16_34_JX4_P,JX4,58,IO_L16_34_JX4_P,P7,5
#set_property  -dict {PACKAGE_PIN  U20     IOSTANDARD  LVCMOS25} [get_ports  gp_out[23]]   ; ## U1,U20,IO_L15_34_JX4_N,JX4,59,IO_L15_34_JX4_N,P7,8
#set_property  -dict {PACKAGE_PIN  W20     IOSTANDARD  LVCMOS25} [get_ports  gp_in[23]]    ; ## U1,W20,IO_L16_34_JX4_N,JX4,60,IO_L16_34_JX4_N,P7,7
#set_property  -dict {PACKAGE_PIN  R16     IOSTANDARD  LVCMOS25} [get_ports  gp_out[24]]   ; ## U1,R16,IO_L19_34_JX4_P,JX4,73,IO_L19_34_JX4_P,P7,18
#set_property  -dict {PACKAGE_PIN  T17     IOSTANDARD  LVCMOS25} [get_ports  gp_in[24]]    ; ## U1,T17,IO_L20_34_JX4_P,JX4,74,IO_L20_34_JX4_P,P7,17
#set_property  -dict {PACKAGE_PIN  R17     IOSTANDARD  LVCMOS25} [get_ports  gp_out[25]]   ; ## U1,R17,IO_L19_34_JX4_N,JX4,75,IO_L19_34_JX4_N,P7,20
#set_property  -dict {PACKAGE_PIN  R18     IOSTANDARD  LVCMOS25} [get_ports  gp_in[25]]    ; ## U1,R18,IO_L20_34_JX4_N,JX4,76,IO_L20_34_JX4_N,P7,19
#set_property  -dict {PACKAGE_PIN  V17     IOSTANDARD  LVCMOS25} [get_ports  gp_out[26]]   ; ## U1,V17,IO_L21_34_JX4_P,JX4,77,IO_L21_34_JX4_P,P7,26
#set_property  -dict {PACKAGE_PIN  W18     IOSTANDARD  LVCMOS25} [get_ports  gp_in[26]]    ; ## U1,W18,IO_L22_34_JX4_P,JX4,78,IO_L22_34_JX4_P,P7,25
#set_property  -dict {PACKAGE_PIN  V18     IOSTANDARD  LVCMOS25} [get_ports  gp_out[27]]   ; ## U1,V18,IO_L21_34_JX4_N,JX4,79,IO_L21_34_JX4_N,P7,28
#set_property  -dict {PACKAGE_PIN  W19     IOSTANDARD  LVCMOS25} [get_ports  gp_in[27]]    ; ## U1,W19,IO_L22_34_JX4_N,JX4,80,IO_L22_34_JX4_N,P7,27


set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports spi1_mosi]
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33} [get_ports spi1_miso]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports spi1_clk]
set_property PACKAGE_PIN U13 [get_ports spi1_csn0]
set_property IOSTANDARD LVCMOS33 [get_ports spi1_csn0]
set_property PULLUP true [get_ports spi1_csn0]
set_property PACKAGE_PIN V13 [get_ports spi1_csn1]
set_property IOSTANDARD LVCMOS33 [get_ports spi1_csn1]
set_property PULLUP true [get_ports spi1_csn1]
set_property PACKAGE_PIN T14 [get_ports spi1_csn2]
set_property IOSTANDARD LVCMOS33 [get_ports spi1_csn2]
set_property PULLUP true [get_ports spi1_csn2]


set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {gp_out[0]}]
set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {gp_in[0]}]
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports {gp_out[1]}]
set_property -dict {PACKAGE_PIN U10 IOSTANDARD LVCMOS33} [get_ports {gp_in[1]}]
set_property -dict {PACKAGE_PIN Y7 IOSTANDARD LVCMOS33} [get_ports {gp_out[2]}]
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports {gp_in[2]}]
set_property -dict {PACKAGE_PIN Y6 IOSTANDARD LVCMOS33} [get_ports {gp_out[3]}]
set_property -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS33} [get_ports {gp_in[3]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {gp_out[4]}]
set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports {gp_in[4]}]
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33} [get_ports {gp_out[5]}]
set_property -dict {PACKAGE_PIN W9 IOSTANDARD LVCMOS33} [get_ports {gp_in[5]}]
set_property -dict {PACKAGE_PIN U9 IOSTANDARD LVCMOS33} [get_ports {gp_out[6]}]
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports {gp_in[6]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {gp_out[7]}]
set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33} [get_ports {gp_in[7]}]
set_property -dict {PACKAGE_PIN T5 IOSTANDARD LVCMOS33} [get_ports {gp_out[8]}]
set_property -dict {PACKAGE_PIN Y12 IOSTANDARD LVCMOS33} [get_ports {gp_in[8]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {gp_out[9]}]
set_property -dict {PACKAGE_PIN Y13 IOSTANDARD LVCMOS33} [get_ports {gp_in[9]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {gp_out[10]}]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS33} [get_ports {gp_in[10]}]


set_property PACKAGE_PIN U19 [get_ports i2c1_scl] ; ##U1,U19,IO_L12_MRCC_34_JX4_N,JX4,48,P6,31
set_property IOSTANDARD LVCMOS33 [get_ports i2c1_scl]
set_property PULLUP true [get_ports i2c1_scl]

set_property PACKAGE_PIN U20 [get_ports i2c1_sda] ; ##U1,U20,IO_L15_34_JX4_N,JX4,59,P7,8
set_property IOSTANDARD LVCMOS33 [get_ports i2c1_sda]
set_property PULLUP true [get_ports i2c1_sda]

set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports {spi_clk}]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {spi_miso}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {spi_mosi}]
set_property PACKAGE_PIN W18 [get_ports spi_csn]
set_property IOSTANDARD LVCMOS33 [get_ports spi_csn]
set_property PULLUP true [get_ports spi_csn]
set_property PACKAGE_PIN V18 [get_ports spi_csn1]
set_property IOSTANDARD LVCMOS33 [get_ports spi_csn1]
set_property PULLUP true [get_ports spi_csn1]
set_property PACKAGE_PIN W19 [get_ports spi_csn2]
set_property IOSTANDARD LVCMOS33 [get_ports spi_csn2]
set_property PULLUP true [get_ports spi_csn2]

#set_property -dict {PACKAGE_PIN W18 IOSTANDARD PULLTYPE PULLUP LVCMOS33} [get_ports {spi_csn}]
#set_property -dict {PACKAGE_PIN V18 IOSTANDARD PULLTYPE PULLUP LVCMOS33} [get_ports {spi_csn1}]
#set_property -dict {PACKAGE_PIN W19 IOSTANDARD PULLTYPE PULLUP LVCMOS33} [get_ports {spi_csn2}]

