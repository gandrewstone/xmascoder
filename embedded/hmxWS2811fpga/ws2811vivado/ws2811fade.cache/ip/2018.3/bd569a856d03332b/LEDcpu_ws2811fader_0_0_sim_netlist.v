// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan 24 22:16:46 2019
// Host        : xanadu running 64-bit Ubuntu 16.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ LEDcpu_ws2811fader_0_0_sim_netlist.v
// Design      : LEDcpu_ws2811fader_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "LEDcpu_ws2811fader_0_0,ws2811fader_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ws2811fader_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (ws2811data,
    irq,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn,
    s_axi_intr_awaddr,
    s_axi_intr_awprot,
    s_axi_intr_awvalid,
    s_axi_intr_awready,
    s_axi_intr_wdata,
    s_axi_intr_wstrb,
    s_axi_intr_wvalid,
    s_axi_intr_wready,
    s_axi_intr_bresp,
    s_axi_intr_bvalid,
    s_axi_intr_bready,
    s_axi_intr_araddr,
    s_axi_intr_arprot,
    s_axi_intr_arvalid,
    s_axi_intr_arready,
    s_axi_intr_rdata,
    s_axi_intr_rresp,
    s_axi_intr_rvalid,
    s_axi_intr_rready,
    s_axi_intr_aclk,
    s_axi_intr_aresetn);
  output ws2811data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWADDR" *) input [4:0]s_axi_intr_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWPROT" *) input [2:0]s_axi_intr_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWVALID" *) input s_axi_intr_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWREADY" *) output s_axi_intr_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR WDATA" *) input [31:0]s_axi_intr_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR WSTRB" *) input [3:0]s_axi_intr_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR WVALID" *) input s_axi_intr_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR WREADY" *) output s_axi_intr_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR BRESP" *) output [1:0]s_axi_intr_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR BVALID" *) output s_axi_intr_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR BREADY" *) input s_axi_intr_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARADDR" *) input [4:0]s_axi_intr_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARPROT" *) input [2:0]s_axi_intr_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARVALID" *) input s_axi_intr_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARREADY" *) output s_axi_intr_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR RDATA" *) output [31:0]s_axi_intr_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR RRESP" *) output [1:0]s_axi_intr_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR RVALID" *) output s_axi_intr_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_INTR RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_INTR, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 5, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_intr_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_INTR_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_INTR_CLK, ASSOCIATED_BUSIF S_AXI_INTR, ASSOCIATED_RESET s_axi_intr_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s_axi_intr_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_INTR_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_INTR_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_intr_aresetn;

  wire \<const0> ;
  wire irq;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s_axi_intr_aclk;
  wire [4:0]s_axi_intr_araddr;
  wire s_axi_intr_aresetn;
  wire s_axi_intr_arready;
  wire s_axi_intr_arvalid;
  wire [4:0]s_axi_intr_awaddr;
  wire s_axi_intr_awready;
  wire s_axi_intr_awvalid;
  wire s_axi_intr_bready;
  wire s_axi_intr_bvalid;
  wire [0:0]\^s_axi_intr_rdata ;
  wire s_axi_intr_rready;
  wire s_axi_intr_rvalid;
  wire [31:0]s_axi_intr_wdata;
  wire s_axi_intr_wready;
  wire s_axi_intr_wvalid;
  wire ws2811data;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  assign s_axi_intr_bresp[1] = \<const0> ;
  assign s_axi_intr_bresp[0] = \<const0> ;
  assign s_axi_intr_rdata[31] = \<const0> ;
  assign s_axi_intr_rdata[30] = \<const0> ;
  assign s_axi_intr_rdata[29] = \<const0> ;
  assign s_axi_intr_rdata[28] = \<const0> ;
  assign s_axi_intr_rdata[27] = \<const0> ;
  assign s_axi_intr_rdata[26] = \<const0> ;
  assign s_axi_intr_rdata[25] = \<const0> ;
  assign s_axi_intr_rdata[24] = \<const0> ;
  assign s_axi_intr_rdata[23] = \<const0> ;
  assign s_axi_intr_rdata[22] = \<const0> ;
  assign s_axi_intr_rdata[21] = \<const0> ;
  assign s_axi_intr_rdata[20] = \<const0> ;
  assign s_axi_intr_rdata[19] = \<const0> ;
  assign s_axi_intr_rdata[18] = \<const0> ;
  assign s_axi_intr_rdata[17] = \<const0> ;
  assign s_axi_intr_rdata[16] = \<const0> ;
  assign s_axi_intr_rdata[15] = \<const0> ;
  assign s_axi_intr_rdata[14] = \<const0> ;
  assign s_axi_intr_rdata[13] = \<const0> ;
  assign s_axi_intr_rdata[12] = \<const0> ;
  assign s_axi_intr_rdata[11] = \<const0> ;
  assign s_axi_intr_rdata[10] = \<const0> ;
  assign s_axi_intr_rdata[9] = \<const0> ;
  assign s_axi_intr_rdata[8] = \<const0> ;
  assign s_axi_intr_rdata[7] = \<const0> ;
  assign s_axi_intr_rdata[6] = \<const0> ;
  assign s_axi_intr_rdata[5] = \<const0> ;
  assign s_axi_intr_rdata[4] = \<const0> ;
  assign s_axi_intr_rdata[3] = \<const0> ;
  assign s_axi_intr_rdata[2] = \<const0> ;
  assign s_axi_intr_rdata[1] = \<const0> ;
  assign s_axi_intr_rdata[0] = \^s_axi_intr_rdata [0];
  assign s_axi_intr_rresp[1] = \<const0> ;
  assign s_axi_intr_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0 inst
       (.irq(irq),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s_axi_intr_aclk(s_axi_intr_aclk),
        .s_axi_intr_araddr(s_axi_intr_araddr[4:2]),
        .s_axi_intr_aresetn(s_axi_intr_aresetn),
        .s_axi_intr_arready(s_axi_intr_arready),
        .s_axi_intr_arvalid(s_axi_intr_arvalid),
        .s_axi_intr_awaddr(s_axi_intr_awaddr[4:2]),
        .s_axi_intr_awready(s_axi_intr_awready),
        .s_axi_intr_awvalid(s_axi_intr_awvalid),
        .s_axi_intr_bready(s_axi_intr_bready),
        .s_axi_intr_bvalid(s_axi_intr_bvalid),
        .s_axi_intr_rdata(\^s_axi_intr_rdata ),
        .s_axi_intr_rready(s_axi_intr_rready),
        .s_axi_intr_rvalid(s_axi_intr_rvalid),
        .s_axi_intr_wdata(s_axi_intr_wdata[0]),
        .s_axi_intr_wready(s_axi_intr_wready),
        .s_axi_intr_wvalid(s_axi_intr_wvalid),
        .ws2811data(ws2811data));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader
   (ws2811data,
    s00_axi_aclk,
    Q);
  output ws2811data;
  input s00_axi_aclk;
  input [0:0]Q;

  wire [0:0]Q;
  wire [4:0]bitNum;
  wire \bitNum[0]_i_1_n_0 ;
  wire \bitNum[1]_i_1_n_0 ;
  wire \bitNum[2]_i_1_n_0 ;
  wire \bitNum[3]_i_1_n_0 ;
  wire \bitNum[4]_i_2_n_0 ;
  wire \bitNum[4]_i_3_n_0 ;
  wire \bitNum[4]_i_4_n_0 ;
  wire clear;
  wire [9:3]curLed;
  wire \curLed[5]_i_2_n_0 ;
  wire \curLed[9]_i_1_n_0 ;
  wire \curLed[9]_i_3_n_0 ;
  wire \curLed[9]_i_4_n_0 ;
  wire \curLed[9]_i_5_n_0 ;
  wire \curLed[9]_i_6_n_0 ;
  wire \curLed_reg_n_0_[0] ;
  wire \curLed_reg_n_0_[1] ;
  wire \curLed_reg_n_0_[2] ;
  wire \interBitClk[0]_i_1_n_0 ;
  wire \interBitClk[6]_i_1_n_0 ;
  wire \interBitClk[6]_i_3_n_0 ;
  wire [6:0]interBitClk_reg__0;
  wire \interPrefaceClk[0]_i_1_n_0 ;
  wire \interPrefaceClk[0]_i_2_n_0 ;
  wire \interPrefaceClk[0]_i_4_n_0 ;
  wire \interPrefaceClk[0]_i_5_n_0 ;
  wire \interPrefaceClk[0]_i_6_n_0 ;
  wire [14:4]interPrefaceClk_reg;
  wire \interPrefaceClk_reg[0]_i_3_n_0 ;
  wire \interPrefaceClk_reg[0]_i_3_n_1 ;
  wire \interPrefaceClk_reg[0]_i_3_n_2 ;
  wire \interPrefaceClk_reg[0]_i_3_n_3 ;
  wire \interPrefaceClk_reg[0]_i_3_n_4 ;
  wire \interPrefaceClk_reg[0]_i_3_n_5 ;
  wire \interPrefaceClk_reg[0]_i_3_n_6 ;
  wire \interPrefaceClk_reg[0]_i_3_n_7 ;
  wire \interPrefaceClk_reg[12]_i_1_n_2 ;
  wire \interPrefaceClk_reg[12]_i_1_n_3 ;
  wire \interPrefaceClk_reg[12]_i_1_n_5 ;
  wire \interPrefaceClk_reg[12]_i_1_n_6 ;
  wire \interPrefaceClk_reg[12]_i_1_n_7 ;
  wire \interPrefaceClk_reg[4]_i_1_n_0 ;
  wire \interPrefaceClk_reg[4]_i_1_n_1 ;
  wire \interPrefaceClk_reg[4]_i_1_n_2 ;
  wire \interPrefaceClk_reg[4]_i_1_n_3 ;
  wire \interPrefaceClk_reg[4]_i_1_n_4 ;
  wire \interPrefaceClk_reg[4]_i_1_n_5 ;
  wire \interPrefaceClk_reg[4]_i_1_n_6 ;
  wire \interPrefaceClk_reg[4]_i_1_n_7 ;
  wire \interPrefaceClk_reg[8]_i_1_n_0 ;
  wire \interPrefaceClk_reg[8]_i_1_n_1 ;
  wire \interPrefaceClk_reg[8]_i_1_n_2 ;
  wire \interPrefaceClk_reg[8]_i_1_n_3 ;
  wire \interPrefaceClk_reg[8]_i_1_n_4 ;
  wire \interPrefaceClk_reg[8]_i_1_n_5 ;
  wire \interPrefaceClk_reg[8]_i_1_n_6 ;
  wire \interPrefaceClk_reg[8]_i_1_n_7 ;
  wire \interPrefaceClk_reg_n_0_[0] ;
  wire \interPrefaceClk_reg_n_0_[1] ;
  wire \interPrefaceClk_reg_n_0_[2] ;
  wire \interPrefaceClk_reg_n_0_[3] ;
  wire [9:0]led_num;
  wire [6:1]p_0_in__0;
  wire rebegin;
  wire rebegin_i_1_n_0;
  wire rebegin_i_2_n_0;
  wire rebegin_i_3_n_0;
  wire s00_axi_aclk;
  wire state_i_1_n_0;
  wire state_i_2_n_0;
  wire state_i_3_n_0;
  wire state_i_4_n_0;
  wire state_reg_n_0;
  wire ws2811data;
  wire [3:2]\NLW_interPrefaceClk_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_interPrefaceClk_reg[12]_i_1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \bitNum[0]_i_1 
       (.I0(bitNum[0]),
        .O(\bitNum[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bitNum[1]_i_1 
       (.I0(bitNum[0]),
        .I1(bitNum[1]),
        .O(\bitNum[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \bitNum[2]_i_1 
       (.I0(bitNum[2]),
        .I1(bitNum[0]),
        .I2(bitNum[1]),
        .O(\bitNum[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h46CCCCCC)) 
    \bitNum[3]_i_1 
       (.I0(bitNum[2]),
        .I1(bitNum[3]),
        .I2(bitNum[4]),
        .I3(bitNum[0]),
        .I4(bitNum[1]),
        .O(\bitNum[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bitNum[4]_i_1 
       (.I0(Q),
        .O(clear));
  LUT5 #(
    .INIT(32'h00000008)) 
    \bitNum[4]_i_2 
       (.I0(interBitClk_reg__0[2]),
        .I1(interBitClk_reg__0[6]),
        .I2(interBitClk_reg__0[0]),
        .I3(interBitClk_reg__0[1]),
        .I4(\bitNum[4]_i_4_n_0 ),
        .O(\bitNum[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h2CCCCCCC)) 
    \bitNum[4]_i_3 
       (.I0(bitNum[3]),
        .I1(bitNum[4]),
        .I2(bitNum[2]),
        .I3(bitNum[0]),
        .I4(bitNum[1]),
        .O(\bitNum[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \bitNum[4]_i_4 
       (.I0(interBitClk_reg__0[4]),
        .I1(interBitClk_reg__0[3]),
        .I2(interBitClk_reg__0[5]),
        .O(\bitNum[4]_i_4_n_0 ));
  FDRE \bitNum_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\bitNum[4]_i_2_n_0 ),
        .D(\bitNum[0]_i_1_n_0 ),
        .Q(bitNum[0]),
        .R(clear));
  FDRE \bitNum_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\bitNum[4]_i_2_n_0 ),
        .D(\bitNum[1]_i_1_n_0 ),
        .Q(bitNum[1]),
        .R(clear));
  FDRE \bitNum_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\bitNum[4]_i_2_n_0 ),
        .D(\bitNum[2]_i_1_n_0 ),
        .Q(bitNum[2]),
        .R(clear));
  FDRE \bitNum_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\bitNum[4]_i_2_n_0 ),
        .D(\bitNum[3]_i_1_n_0 ),
        .Q(bitNum[3]),
        .R(clear));
  FDRE \bitNum_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\bitNum[4]_i_2_n_0 ),
        .D(\bitNum[4]_i_3_n_0 ),
        .Q(bitNum[4]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \curLed[0]_i_1 
       (.I0(\curLed[9]_i_5_n_0 ),
        .I1(\curLed_reg_n_0_[0] ),
        .O(led_num[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \curLed[1]_i_1 
       (.I0(\curLed[9]_i_5_n_0 ),
        .I1(\curLed_reg_n_0_[0] ),
        .I2(\curLed_reg_n_0_[1] ),
        .O(led_num[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \curLed[2]_i_1 
       (.I0(\curLed[9]_i_5_n_0 ),
        .I1(\curLed_reg_n_0_[0] ),
        .I2(\curLed_reg_n_0_[1] ),
        .I3(\curLed_reg_n_0_[2] ),
        .O(led_num[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \curLed[3]_i_1 
       (.I0(\curLed[9]_i_5_n_0 ),
        .I1(\curLed_reg_n_0_[1] ),
        .I2(\curLed_reg_n_0_[0] ),
        .I3(\curLed_reg_n_0_[2] ),
        .I4(curLed[3]),
        .O(led_num[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \curLed[4]_i_1 
       (.I0(\curLed_reg_n_0_[1] ),
        .I1(\curLed_reg_n_0_[0] ),
        .I2(\curLed_reg_n_0_[2] ),
        .I3(curLed[3]),
        .I4(\curLed[9]_i_5_n_0 ),
        .I5(curLed[4]),
        .O(led_num[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \curLed[5]_i_1 
       (.I0(\curLed[5]_i_2_n_0 ),
        .I1(\curLed[9]_i_5_n_0 ),
        .I2(curLed[5]),
        .O(led_num[5]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \curLed[5]_i_2 
       (.I0(curLed[4]),
        .I1(curLed[3]),
        .I2(\curLed_reg_n_0_[2] ),
        .I3(\curLed_reg_n_0_[0] ),
        .I4(\curLed_reg_n_0_[1] ),
        .O(\curLed[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \curLed[6]_i_1 
       (.I0(\curLed[9]_i_4_n_0 ),
        .I1(\curLed[9]_i_5_n_0 ),
        .I2(curLed[6]),
        .O(led_num[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hD020)) 
    \curLed[7]_i_1 
       (.I0(curLed[6]),
        .I1(\curLed[9]_i_4_n_0 ),
        .I2(\curLed[9]_i_5_n_0 ),
        .I3(curLed[7]),
        .O(led_num[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hBF004000)) 
    \curLed[8]_i_1 
       (.I0(\curLed[9]_i_4_n_0 ),
        .I1(curLed[6]),
        .I2(curLed[7]),
        .I3(\curLed[9]_i_5_n_0 ),
        .I4(curLed[8]),
        .O(led_num[8]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \curLed[9]_i_1 
       (.I0(\curLed[9]_i_3_n_0 ),
        .I1(\bitNum[4]_i_4_n_0 ),
        .I2(interBitClk_reg__0[1]),
        .I3(interBitClk_reg__0[0]),
        .I4(interBitClk_reg__0[6]),
        .I5(interBitClk_reg__0[2]),
        .O(\curLed[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF000008000000)) 
    \curLed[9]_i_2 
       (.I0(curLed[7]),
        .I1(curLed[6]),
        .I2(\curLed[9]_i_4_n_0 ),
        .I3(curLed[8]),
        .I4(\curLed[9]_i_5_n_0 ),
        .I5(curLed[9]),
        .O(led_num[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \curLed[9]_i_3 
       (.I0(bitNum[0]),
        .I1(bitNum[1]),
        .I2(bitNum[2]),
        .I3(bitNum[3]),
        .I4(bitNum[4]),
        .O(\curLed[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \curLed[9]_i_4 
       (.I0(\curLed_reg_n_0_[1] ),
        .I1(\curLed_reg_n_0_[0] ),
        .I2(\curLed_reg_n_0_[2] ),
        .I3(curLed[3]),
        .I4(curLed[4]),
        .I5(curLed[5]),
        .O(\curLed[9]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hBBBF)) 
    \curLed[9]_i_5 
       (.I0(\curLed[9]_i_6_n_0 ),
        .I1(curLed[5]),
        .I2(curLed[4]),
        .I3(curLed[3]),
        .O(\curLed[9]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \curLed[9]_i_6 
       (.I0(curLed[9]),
        .I1(curLed[8]),
        .I2(curLed[7]),
        .I3(curLed[6]),
        .O(\curLed[9]_i_6_n_0 ));
  FDRE \curLed_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[0]),
        .Q(\curLed_reg_n_0_[0] ),
        .R(clear));
  FDRE \curLed_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[1]),
        .Q(\curLed_reg_n_0_[1] ),
        .R(clear));
  FDRE \curLed_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[2]),
        .Q(\curLed_reg_n_0_[2] ),
        .R(clear));
  FDRE \curLed_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[3]),
        .Q(curLed[3]),
        .R(clear));
  FDRE \curLed_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[4]),
        .Q(curLed[4]),
        .R(clear));
  FDRE \curLed_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[5]),
        .Q(curLed[5]),
        .R(clear));
  FDRE \curLed_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[6]),
        .Q(curLed[6]),
        .R(clear));
  FDRE \curLed_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[7]),
        .Q(curLed[7]),
        .R(clear));
  FDRE \curLed_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[8]),
        .Q(curLed[8]),
        .R(clear));
  FDRE \curLed_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\curLed[9]_i_1_n_0 ),
        .D(led_num[9]),
        .Q(curLed[9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \interBitClk[0]_i_1 
       (.I0(interBitClk_reg__0[0]),
        .O(\interBitClk[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \interBitClk[1]_i_1 
       (.I0(interBitClk_reg__0[0]),
        .I1(interBitClk_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \interBitClk[2]_i_1 
       (.I0(interBitClk_reg__0[0]),
        .I1(interBitClk_reg__0[1]),
        .I2(interBitClk_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \interBitClk[3]_i_1 
       (.I0(interBitClk_reg__0[1]),
        .I1(interBitClk_reg__0[0]),
        .I2(interBitClk_reg__0[2]),
        .I3(interBitClk_reg__0[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \interBitClk[4]_i_1 
       (.I0(interBitClk_reg__0[3]),
        .I1(interBitClk_reg__0[2]),
        .I2(interBitClk_reg__0[0]),
        .I3(interBitClk_reg__0[1]),
        .I4(interBitClk_reg__0[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \interBitClk[5]_i_1 
       (.I0(interBitClk_reg__0[2]),
        .I1(interBitClk_reg__0[0]),
        .I2(interBitClk_reg__0[1]),
        .I3(interBitClk_reg__0[3]),
        .I4(interBitClk_reg__0[4]),
        .I5(interBitClk_reg__0[5]),
        .O(p_0_in__0[5]));
  LUT5 #(
    .INIT(32'h4000FFFF)) 
    \interBitClk[6]_i_1 
       (.I0(\bitNum[4]_i_4_n_0 ),
        .I1(state_reg_n_0),
        .I2(interBitClk_reg__0[6]),
        .I3(interBitClk_reg__0[2]),
        .I4(Q),
        .O(\interBitClk[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \interBitClk[6]_i_2 
       (.I0(\interBitClk[6]_i_3_n_0 ),
        .I1(interBitClk_reg__0[4]),
        .I2(interBitClk_reg__0[3]),
        .I3(interBitClk_reg__0[5]),
        .I4(interBitClk_reg__0[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \interBitClk[6]_i_3 
       (.I0(interBitClk_reg__0[2]),
        .I1(interBitClk_reg__0[0]),
        .I2(interBitClk_reg__0[1]),
        .O(\interBitClk[6]_i_3_n_0 ));
  FDRE \interBitClk_reg[0] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(\interBitClk[0]_i_1_n_0 ),
        .Q(interBitClk_reg__0[0]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[1] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[1]),
        .Q(interBitClk_reg__0[1]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[2] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[2]),
        .Q(interBitClk_reg__0[2]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[3] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[3]),
        .Q(interBitClk_reg__0[3]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[4] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[4]),
        .Q(interBitClk_reg__0[4]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[5] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[5]),
        .Q(interBitClk_reg__0[5]),
        .R(\interBitClk[6]_i_1_n_0 ));
  FDRE \interBitClk_reg[6] 
       (.C(s00_axi_aclk),
        .CE(state_reg_n_0),
        .D(p_0_in__0[6]),
        .Q(interBitClk_reg__0[6]),
        .R(\interBitClk[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00400000FFFFFFFF)) 
    \interPrefaceClk[0]_i_1 
       (.I0(\interPrefaceClk[0]_i_4_n_0 ),
        .I1(interPrefaceClk_reg[13]),
        .I2(interPrefaceClk_reg[12]),
        .I3(state_reg_n_0),
        .I4(interPrefaceClk_reg[14]),
        .I5(Q),
        .O(\interPrefaceClk[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \interPrefaceClk[0]_i_2 
       (.I0(state_reg_n_0),
        .O(\interPrefaceClk[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h002F)) 
    \interPrefaceClk[0]_i_4 
       (.I0(\interPrefaceClk[0]_i_6_n_0 ),
        .I1(interPrefaceClk_reg[9]),
        .I2(interPrefaceClk_reg[10]),
        .I3(interPrefaceClk_reg[11]),
        .O(\interPrefaceClk[0]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \interPrefaceClk[0]_i_5 
       (.I0(\interPrefaceClk_reg_n_0_[0] ),
        .O(\interPrefaceClk[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0007FFFF)) 
    \interPrefaceClk[0]_i_6 
       (.I0(interPrefaceClk_reg[4]),
        .I1(interPrefaceClk_reg[5]),
        .I2(interPrefaceClk_reg[6]),
        .I3(interPrefaceClk_reg[7]),
        .I4(interPrefaceClk_reg[8]),
        .O(\interPrefaceClk[0]_i_6_n_0 ));
  FDRE \interPrefaceClk_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[0]_i_3_n_7 ),
        .Q(\interPrefaceClk_reg_n_0_[0] ),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  CARRY4 \interPrefaceClk_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\interPrefaceClk_reg[0]_i_3_n_0 ,\interPrefaceClk_reg[0]_i_3_n_1 ,\interPrefaceClk_reg[0]_i_3_n_2 ,\interPrefaceClk_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\interPrefaceClk_reg[0]_i_3_n_4 ,\interPrefaceClk_reg[0]_i_3_n_5 ,\interPrefaceClk_reg[0]_i_3_n_6 ,\interPrefaceClk_reg[0]_i_3_n_7 }),
        .S({\interPrefaceClk_reg_n_0_[3] ,\interPrefaceClk_reg_n_0_[2] ,\interPrefaceClk_reg_n_0_[1] ,\interPrefaceClk[0]_i_5_n_0 }));
  FDRE \interPrefaceClk_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[8]_i_1_n_5 ),
        .Q(interPrefaceClk_reg[10]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[8]_i_1_n_4 ),
        .Q(interPrefaceClk_reg[11]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[12]_i_1_n_7 ),
        .Q(interPrefaceClk_reg[12]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  CARRY4 \interPrefaceClk_reg[12]_i_1 
       (.CI(\interPrefaceClk_reg[8]_i_1_n_0 ),
        .CO({\NLW_interPrefaceClk_reg[12]_i_1_CO_UNCONNECTED [3:2],\interPrefaceClk_reg[12]_i_1_n_2 ,\interPrefaceClk_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_interPrefaceClk_reg[12]_i_1_O_UNCONNECTED [3],\interPrefaceClk_reg[12]_i_1_n_5 ,\interPrefaceClk_reg[12]_i_1_n_6 ,\interPrefaceClk_reg[12]_i_1_n_7 }),
        .S({1'b0,interPrefaceClk_reg[14:12]}));
  FDRE \interPrefaceClk_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[12]_i_1_n_6 ),
        .Q(interPrefaceClk_reg[13]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[12]_i_1_n_5 ),
        .Q(interPrefaceClk_reg[14]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[0]_i_3_n_6 ),
        .Q(\interPrefaceClk_reg_n_0_[1] ),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[0]_i_3_n_5 ),
        .Q(\interPrefaceClk_reg_n_0_[2] ),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[0]_i_3_n_4 ),
        .Q(\interPrefaceClk_reg_n_0_[3] ),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[4]_i_1_n_7 ),
        .Q(interPrefaceClk_reg[4]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  CARRY4 \interPrefaceClk_reg[4]_i_1 
       (.CI(\interPrefaceClk_reg[0]_i_3_n_0 ),
        .CO({\interPrefaceClk_reg[4]_i_1_n_0 ,\interPrefaceClk_reg[4]_i_1_n_1 ,\interPrefaceClk_reg[4]_i_1_n_2 ,\interPrefaceClk_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\interPrefaceClk_reg[4]_i_1_n_4 ,\interPrefaceClk_reg[4]_i_1_n_5 ,\interPrefaceClk_reg[4]_i_1_n_6 ,\interPrefaceClk_reg[4]_i_1_n_7 }),
        .S(interPrefaceClk_reg[7:4]));
  FDRE \interPrefaceClk_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[4]_i_1_n_6 ),
        .Q(interPrefaceClk_reg[5]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[4]_i_1_n_5 ),
        .Q(interPrefaceClk_reg[6]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[4]_i_1_n_4 ),
        .Q(interPrefaceClk_reg[7]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  FDRE \interPrefaceClk_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[8]_i_1_n_7 ),
        .Q(interPrefaceClk_reg[8]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  CARRY4 \interPrefaceClk_reg[8]_i_1 
       (.CI(\interPrefaceClk_reg[4]_i_1_n_0 ),
        .CO({\interPrefaceClk_reg[8]_i_1_n_0 ,\interPrefaceClk_reg[8]_i_1_n_1 ,\interPrefaceClk_reg[8]_i_1_n_2 ,\interPrefaceClk_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\interPrefaceClk_reg[8]_i_1_n_4 ,\interPrefaceClk_reg[8]_i_1_n_5 ,\interPrefaceClk_reg[8]_i_1_n_6 ,\interPrefaceClk_reg[8]_i_1_n_7 }),
        .S(interPrefaceClk_reg[11:8]));
  FDRE \interPrefaceClk_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\interPrefaceClk[0]_i_2_n_0 ),
        .D(\interPrefaceClk_reg[8]_i_1_n_6 ),
        .Q(interPrefaceClk_reg[9]),
        .R(\interPrefaceClk[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2222EFFF22222000)) 
    rebegin_i_1
       (.I0(\curLed[9]_i_1_n_0 ),
        .I1(\curLed[9]_i_5_n_0 ),
        .I2(rebegin_i_2_n_0),
        .I3(\bitNum[4]_i_2_n_0 ),
        .I4(rebegin_i_3_n_0),
        .I5(rebegin),
        .O(rebegin_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000080000000000)) 
    rebegin_i_2
       (.I0(Q),
        .I1(bitNum[1]),
        .I2(bitNum[0]),
        .I3(bitNum[2]),
        .I4(bitNum[3]),
        .I5(bitNum[4]),
        .O(rebegin_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    rebegin_i_3
       (.I0(state_reg_n_0),
        .I1(rebegin),
        .I2(Q),
        .O(rebegin_i_3_n_0));
  FDRE rebegin_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rebegin_i_1_n_0),
        .Q(rebegin),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6A556A6A00000000)) 
    state_i_1
       (.I0(state_reg_n_0),
        .I1(state_i_2_n_0),
        .I2(state_i_3_n_0),
        .I3(\interPrefaceClk[0]_i_4_n_0 ),
        .I4(state_i_4_n_0),
        .I5(Q),
        .O(state_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    state_i_2
       (.I0(interBitClk_reg__0[6]),
        .I1(rebegin),
        .I2(state_reg_n_0),
        .I3(interBitClk_reg__0[2]),
        .I4(bitNum[0]),
        .I5(bitNum[1]),
        .O(state_i_2_n_0));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    state_i_3
       (.I0(bitNum[2]),
        .I1(bitNum[3]),
        .I2(bitNum[4]),
        .I3(interBitClk_reg__0[5]),
        .I4(interBitClk_reg__0[3]),
        .I5(interBitClk_reg__0[4]),
        .O(state_i_3_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    state_i_4
       (.I0(state_reg_n_0),
        .I1(interPrefaceClk_reg[12]),
        .I2(interPrefaceClk_reg[14]),
        .I3(interPrefaceClk_reg[13]),
        .O(state_i_4_n_0));
  FDRE state_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(state_i_1_n_0),
        .Q(state_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    ws2811data_INST_0
       (.I0(interBitClk_reg__0[6]),
        .I1(interBitClk_reg__0[5]),
        .I2(state_reg_n_0),
        .I3(Q),
        .O(ws2811data));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    s_axi_intr_wready,
    s_axi_intr_awready,
    s_axi_intr_arready,
    ws2811data,
    s00_axi_rvalid,
    s_axi_intr_rdata,
    s_axi_intr_rvalid,
    irq,
    s00_axi_bvalid,
    s_axi_intr_bvalid,
    s_axi_intr_aresetn,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aclk,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s_axi_intr_aclk,
    s_axi_intr_awaddr,
    s_axi_intr_awvalid,
    s_axi_intr_wvalid,
    s_axi_intr_araddr,
    s_axi_intr_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready,
    s_axi_intr_bready,
    s_axi_intr_rready,
    s_axi_intr_wdata);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output s_axi_intr_wready;
  output s_axi_intr_awready;
  output s_axi_intr_arready;
  output ws2811data;
  output s00_axi_rvalid;
  output [0:0]s_axi_intr_rdata;
  output s_axi_intr_rvalid;
  output irq;
  output s00_axi_bvalid;
  output s_axi_intr_bvalid;
  input s_axi_intr_aresetn;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aclk;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s_axi_intr_aclk;
  input [2:0]s_axi_intr_awaddr;
  input s_axi_intr_awvalid;
  input s_axi_intr_wvalid;
  input [2:0]s_axi_intr_araddr;
  input s_axi_intr_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;
  input s_axi_intr_bready;
  input s_axi_intr_rready;
  input [0:0]s_axi_intr_wdata;

  wire irq;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire s_axi_intr_aclk;
  wire [2:0]s_axi_intr_araddr;
  wire s_axi_intr_aresetn;
  wire s_axi_intr_arready;
  wire s_axi_intr_arvalid;
  wire [2:0]s_axi_intr_awaddr;
  wire s_axi_intr_awready;
  wire s_axi_intr_awvalid;
  wire s_axi_intr_bready;
  wire s_axi_intr_bvalid;
  wire [0:0]s_axi_intr_rdata;
  wire s_axi_intr_rready;
  wire s_axi_intr_rvalid;
  wire [0:0]s_axi_intr_wdata;
  wire s_axi_intr_wready;
  wire s_axi_intr_wvalid;
  wire ws2811data;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI ws2811fader_v1_0_S00_AXI_inst
       (.s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .ws2811data(ws2811data));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR ws2811fader_v1_0_S_AXI_INTR_inst
       (.axi_arready_reg_0(s_axi_intr_arready),
        .axi_awready_reg_0(s_axi_intr_awready),
        .axi_wready_reg_0(s_axi_intr_wready),
        .irq(irq),
        .s_axi_intr_aclk(s_axi_intr_aclk),
        .s_axi_intr_araddr(s_axi_intr_araddr),
        .s_axi_intr_aresetn(s_axi_intr_aresetn),
        .s_axi_intr_arvalid(s_axi_intr_arvalid),
        .s_axi_intr_awaddr(s_axi_intr_awaddr),
        .s_axi_intr_awvalid(s_axi_intr_awvalid),
        .s_axi_intr_bready(s_axi_intr_bready),
        .s_axi_intr_bvalid(s_axi_intr_bvalid),
        .s_axi_intr_rdata(s_axi_intr_rdata),
        .s_axi_intr_rready(s_axi_intr_rready),
        .s_axi_intr_rvalid(s_axi_intr_rvalid),
        .s_axi_intr_wdata(s_axi_intr_wdata),
        .s_axi_intr_wvalid(s_axi_intr_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI
   (s00_axi_wready,
    s00_axi_awready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    s00_axi_rdata,
    ws2811data,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_wstrb);
  output s00_axi_wready;
  output s00_axi_awready;
  output s00_axi_arready;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output [31:0]s00_axi_rdata;
  output ws2811data;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [3:0]s00_axi_wstrb;

  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1__0_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [0:0]ctrl;
  wire \ctrl[15]_i_1_n_0 ;
  wire \ctrl[23]_i_1_n_0 ;
  wire \ctrl[31]_i_1_n_0 ;
  wire \ctrl[7]_i_1_n_0 ;
  wire \ctrl_reg_n_0_[10] ;
  wire \ctrl_reg_n_0_[11] ;
  wire \ctrl_reg_n_0_[12] ;
  wire \ctrl_reg_n_0_[13] ;
  wire \ctrl_reg_n_0_[14] ;
  wire \ctrl_reg_n_0_[15] ;
  wire \ctrl_reg_n_0_[16] ;
  wire \ctrl_reg_n_0_[17] ;
  wire \ctrl_reg_n_0_[18] ;
  wire \ctrl_reg_n_0_[19] ;
  wire \ctrl_reg_n_0_[1] ;
  wire \ctrl_reg_n_0_[20] ;
  wire \ctrl_reg_n_0_[21] ;
  wire \ctrl_reg_n_0_[22] ;
  wire \ctrl_reg_n_0_[23] ;
  wire \ctrl_reg_n_0_[24] ;
  wire \ctrl_reg_n_0_[25] ;
  wire \ctrl_reg_n_0_[26] ;
  wire \ctrl_reg_n_0_[27] ;
  wire \ctrl_reg_n_0_[28] ;
  wire \ctrl_reg_n_0_[29] ;
  wire \ctrl_reg_n_0_[2] ;
  wire \ctrl_reg_n_0_[30] ;
  wire \ctrl_reg_n_0_[31] ;
  wire \ctrl_reg_n_0_[3] ;
  wire \ctrl_reg_n_0_[4] ;
  wire \ctrl_reg_n_0_[5] ;
  wire \ctrl_reg_n_0_[6] ;
  wire \ctrl_reg_n_0_[7] ;
  wire \ctrl_reg_n_0_[8] ;
  wire \ctrl_reg_n_0_[9] ;
  wire [1:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire ws2811data;

  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_awready),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_arready),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s00_axi_arready),
        .R(axi_awready_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(axi_awready_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1__0
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awready),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s00_axi_awready),
        .R(axi_awready_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(s00_axi_wready),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg2[0]),
        .I1(slv_reg3[0]),
        .I2(ctrl),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[0]),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg2[10]),
        .I1(slv_reg3[10]),
        .I2(\ctrl_reg_n_0_[10] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg2[11]),
        .I1(slv_reg3[11]),
        .I2(\ctrl_reg_n_0_[11] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg2[12]),
        .I1(slv_reg3[12]),
        .I2(\ctrl_reg_n_0_[12] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg2[13]),
        .I1(slv_reg3[13]),
        .I2(\ctrl_reg_n_0_[13] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg2[14]),
        .I1(slv_reg3[14]),
        .I2(\ctrl_reg_n_0_[14] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg2[15]),
        .I1(slv_reg3[15]),
        .I2(\ctrl_reg_n_0_[15] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg2[16]),
        .I1(slv_reg3[16]),
        .I2(\ctrl_reg_n_0_[16] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg2[17]),
        .I1(slv_reg3[17]),
        .I2(\ctrl_reg_n_0_[17] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg2[18]),
        .I1(slv_reg3[18]),
        .I2(\ctrl_reg_n_0_[18] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg2[19]),
        .I1(slv_reg3[19]),
        .I2(\ctrl_reg_n_0_[19] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg2[1]),
        .I1(slv_reg3[1]),
        .I2(\ctrl_reg_n_0_[1] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg2[20]),
        .I1(slv_reg3[20]),
        .I2(\ctrl_reg_n_0_[20] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg2[21]),
        .I1(slv_reg3[21]),
        .I2(\ctrl_reg_n_0_[21] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg2[22]),
        .I1(slv_reg3[22]),
        .I2(\ctrl_reg_n_0_[22] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg2[23]),
        .I1(slv_reg3[23]),
        .I2(\ctrl_reg_n_0_[23] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg2[24]),
        .I1(slv_reg3[24]),
        .I2(\ctrl_reg_n_0_[24] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg2[25]),
        .I1(slv_reg3[25]),
        .I2(\ctrl_reg_n_0_[25] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg2[26]),
        .I1(slv_reg3[26]),
        .I2(\ctrl_reg_n_0_[26] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg2[27]),
        .I1(slv_reg3[27]),
        .I2(\ctrl_reg_n_0_[27] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg2[28]),
        .I1(slv_reg3[28]),
        .I2(\ctrl_reg_n_0_[28] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg2[29]),
        .I1(slv_reg3[29]),
        .I2(\ctrl_reg_n_0_[29] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg2[2]),
        .I1(slv_reg3[2]),
        .I2(\ctrl_reg_n_0_[2] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg2[30]),
        .I1(slv_reg3[30]),
        .I2(\ctrl_reg_n_0_[30] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[30]),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg2[31]),
        .I1(slv_reg3[31]),
        .I2(\ctrl_reg_n_0_[31] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg2[3]),
        .I1(slv_reg3[3]),
        .I2(\ctrl_reg_n_0_[3] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg2[4]),
        .I1(slv_reg3[4]),
        .I2(\ctrl_reg_n_0_[4] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg2[5]),
        .I1(slv_reg3[5]),
        .I2(\ctrl_reg_n_0_[5] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg2[6]),
        .I1(slv_reg3[6]),
        .I2(\ctrl_reg_n_0_[6] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg2[7]),
        .I1(slv_reg3[7]),
        .I2(\ctrl_reg_n_0_[7] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg2[8]),
        .I1(slv_reg3[8]),
        .I2(\ctrl_reg_n_0_[8] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg2[9]),
        .I1(slv_reg3[9]),
        .I2(\ctrl_reg_n_0_[9] ),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg1[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arready),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wready),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(s00_axi_wready),
        .R(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    \ctrl[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(\ctrl[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \ctrl[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(\ctrl[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \ctrl[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(\ctrl[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \ctrl[31]_i_2 
       (.I0(s00_axi_wready),
        .I1(s00_axi_awready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0200)) 
    \ctrl[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(\ctrl[7]_i_1_n_0 ));
  FDRE \ctrl_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(ctrl),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\ctrl_reg_n_0_[10] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\ctrl_reg_n_0_[11] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\ctrl_reg_n_0_[12] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\ctrl_reg_n_0_[13] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\ctrl_reg_n_0_[14] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\ctrl_reg_n_0_[15] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\ctrl_reg_n_0_[16] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\ctrl_reg_n_0_[17] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\ctrl_reg_n_0_[18] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\ctrl_reg_n_0_[19] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\ctrl_reg_n_0_[1] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\ctrl_reg_n_0_[20] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\ctrl_reg_n_0_[21] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\ctrl_reg_n_0_[22] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\ctrl_reg_n_0_[23] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\ctrl_reg_n_0_[24] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\ctrl_reg_n_0_[25] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\ctrl_reg_n_0_[26] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\ctrl_reg_n_0_[27] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\ctrl_reg_n_0_[28] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\ctrl_reg_n_0_[29] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\ctrl_reg_n_0_[2] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\ctrl_reg_n_0_[30] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\ctrl_reg_n_0_[31] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\ctrl_reg_n_0_[3] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\ctrl_reg_n_0_[4] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\ctrl_reg_n_0_[5] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\ctrl_reg_n_0_[6] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\ctrl_reg_n_0_[7] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\ctrl_reg_n_0_[8] ),
        .R(axi_awready_i_1__0_n_0));
  FDRE \ctrl_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\ctrl[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\ctrl_reg_n_0_[9] ),
        .R(axi_awready_i_1__0_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader nolabel_line424
       (.Q(ctrl),
        .s00_axi_aclk(s00_axi_aclk),
        .ws2811data(ws2811data));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1__0_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR
   (axi_wready_reg_0,
    axi_awready_reg_0,
    axi_arready_reg_0,
    s_axi_intr_bvalid,
    s_axi_intr_rvalid,
    s_axi_intr_rdata,
    irq,
    s_axi_intr_aclk,
    s_axi_intr_aresetn,
    s_axi_intr_awvalid,
    s_axi_intr_wvalid,
    s_axi_intr_bready,
    s_axi_intr_arvalid,
    s_axi_intr_rready,
    s_axi_intr_wdata,
    s_axi_intr_awaddr,
    s_axi_intr_araddr);
  output axi_wready_reg_0;
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output s_axi_intr_bvalid;
  output s_axi_intr_rvalid;
  output [0:0]s_axi_intr_rdata;
  output irq;
  input s_axi_intr_aclk;
  input s_axi_intr_aresetn;
  input s_axi_intr_awvalid;
  input s_axi_intr_wvalid;
  input s_axi_intr_bready;
  input s_axi_intr_arvalid;
  input s_axi_intr_rready;
  input [0:0]s_axi_intr_wdata;
  input [2:0]s_axi_intr_awaddr;
  input [2:0]s_axi_intr_araddr;

  wire aw_en_i_1__0_n_0;
  wire aw_en_reg_n_0;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire \axi_araddr[4]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_arready_reg_0;
  wire [4:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire \axi_awaddr[4]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1__0_n_0;
  wire \axi_rdata[0]_i_1__0_n_0 ;
  wire \axi_rdata[0]_i_3_n_0 ;
  wire axi_rvalid_i_1__0_n_0;
  wire axi_wready0;
  wire axi_wready_reg_0;
  wire det_intr;
  wire \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0 ;
  wire \gen_intr_detection[0].s_irq_lvl_i_1_n_0 ;
  wire \gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0 ;
  wire \gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0 ;
  wire \gen_intr_reg[0].reg_intr_en[0]_i_1_n_0 ;
  wire \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ;
  wire intr__0;
  wire intr_ack_all;
  wire intr_ack_all_ff;
  wire intr_ack_all_i_1_n_0;
  wire intr_all;
  wire intr_all_i_1_n_0;
  wire [3:0]intr_counter;
  wire [0:0]intr_counter0__0;
  wire intr_counter0_n_0;
  wire \intr_counter[1]_i_1_n_0 ;
  wire \intr_counter[2]_i_1_n_0 ;
  wire \intr_counter[3]_i_1_n_0 ;
  wire intr_n_0;
  wire intr_reg_wren__2;
  wire irq;
  wire p_3_out;
  wire reg_data_out;
  wire reg_global_intr_en;
  wire reg_intr_ack;
  wire reg_intr_en;
  wire reg_intr_pending;
  wire reg_intr_sts;
  wire s_axi_intr_aclk;
  wire [2:0]s_axi_intr_araddr;
  wire s_axi_intr_aresetn;
  wire s_axi_intr_arvalid;
  wire [2:0]s_axi_intr_awaddr;
  wire s_axi_intr_awvalid;
  wire s_axi_intr_bready;
  wire s_axi_intr_bvalid;
  wire [0:0]s_axi_intr_rdata;
  wire s_axi_intr_rready;
  wire s_axi_intr_rvalid;
  wire [0:0]s_axi_intr_wdata;
  wire s_axi_intr_wvalid;
  wire [2:0]sel0;

  LUT6 #(
    .INIT(64'hBFFF8CCC8CCC8CCC)) 
    aw_en_i_1__0
       (.I0(axi_awready_reg_0),
        .I1(aw_en_reg_n_0),
        .I2(s_axi_intr_wvalid),
        .I3(s_axi_intr_awvalid),
        .I4(s_axi_intr_bready),
        .I5(s_axi_intr_bvalid),
        .O(aw_en_i_1__0_n_0));
  FDSE aw_en_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(aw_en_i_1__0_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s_axi_intr_araddr[0]),
        .I1(s_axi_intr_arvalid),
        .I2(axi_arready_reg_0),
        .I3(sel0[0]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s_axi_intr_araddr[1]),
        .I1(s_axi_intr_arvalid),
        .I2(axi_arready_reg_0),
        .I3(sel0[1]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[4]_i_1 
       (.I0(s_axi_intr_araddr[2]),
        .I1(s_axi_intr_arvalid),
        .I2(axi_arready_reg_0),
        .I3(sel0[2]),
        .O(\axi_araddr[4]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(sel0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(sel0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[4] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_araddr[4]_i_1_n_0 ),
        .Q(sel0[2]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1__0
       (.I0(s_axi_intr_arvalid),
        .I1(axi_arready_reg_0),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(axi_arready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s_axi_intr_awaddr[0]),
        .I1(s_axi_intr_awvalid),
        .I2(s_axi_intr_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(axi_awready_reg_0),
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s_axi_intr_awaddr[1]),
        .I1(s_axi_intr_awvalid),
        .I2(s_axi_intr_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(axi_awready_reg_0),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_awaddr[4]_i_1 
       (.I0(s_axi_intr_awaddr[2]),
        .I1(s_axi_intr_awvalid),
        .I2(s_axi_intr_wvalid),
        .I3(aw_en_reg_n_0),
        .I4(axi_awready_reg_0),
        .I5(axi_awaddr[4]),
        .O(\axi_awaddr[4]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[4] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[4]_i_1_n_0 ),
        .Q(axi_awaddr[4]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s_axi_intr_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    axi_awready_i_2__0
       (.I0(s_axi_intr_awvalid),
        .I1(s_axi_intr_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(axi_awready_reg_0),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(axi_awready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1__0
       (.I0(s_axi_intr_awvalid),
        .I1(axi_wready_reg_0),
        .I2(axi_awready_reg_0),
        .I3(s_axi_intr_wvalid),
        .I4(s_axi_intr_bready),
        .I5(s_axi_intr_bvalid),
        .O(axi_bvalid_i_1__0_n_0));
  FDRE axi_bvalid_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1__0_n_0),
        .Q(s_axi_intr_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hA0A0C0A0A0A0A0A0)) 
    \axi_rdata[0]_i_1__0 
       (.I0(s_axi_intr_rdata),
        .I1(reg_data_out),
        .I2(s_axi_intr_aresetn),
        .I3(axi_arready_reg_0),
        .I4(s_axi_intr_rvalid),
        .I5(s_axi_intr_arvalid),
        .O(\axi_rdata[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h0A0A3A0A)) 
    \axi_rdata[0]_i_2 
       (.I0(\axi_rdata[0]_i_3_n_0 ),
        .I1(sel0[1]),
        .I2(sel0[2]),
        .I3(reg_intr_pending),
        .I4(sel0[0]),
        .O(reg_data_out));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_3 
       (.I0(reg_intr_ack),
        .I1(reg_intr_sts),
        .I2(sel0[1]),
        .I3(reg_intr_en),
        .I4(sel0[0]),
        .I5(reg_global_intr_en),
        .O(\axi_rdata[0]_i_3_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\axi_rdata[0]_i_1__0_n_0 ),
        .Q(s_axi_intr_rdata),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1__0
       (.I0(axi_arready_reg_0),
        .I1(s_axi_intr_arvalid),
        .I2(s_axi_intr_rvalid),
        .I3(s_axi_intr_rready),
        .O(axi_rvalid_i_1__0_n_0));
  FDRE axi_rvalid_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1__0_n_0),
        .Q(s_axi_intr_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    axi_wready_i_1__0
       (.I0(s_axi_intr_awvalid),
        .I1(s_axi_intr_wvalid),
        .I2(aw_en_reg_n_0),
        .I3(axi_wready_reg_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(axi_wready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1 
       (.I0(intr__0),
        .I1(det_intr),
        .O(\gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0 ));
  FDRE \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0 ),
        .Q(det_intr),
        .R(\gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000EA00)) 
    \gen_intr_detection[0].s_irq_lvl_i_1 
       (.I0(irq),
        .I1(reg_global_intr_en),
        .I2(intr_all),
        .I3(s_axi_intr_aresetn),
        .I4(intr_ack_all),
        .O(\gen_intr_detection[0].s_irq_lvl_i_1_n_0 ));
  FDRE \gen_intr_detection[0].s_irq_lvl_reg 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\gen_intr_detection[0].s_irq_lvl_i_1_n_0 ),
        .Q(irq),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    \gen_intr_reg[0].reg_global_intr_en[0]_i_1 
       (.I0(s_axi_intr_wdata),
        .I1(axi_awaddr[4]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[3]),
        .I4(intr_reg_wren__2),
        .I5(reg_global_intr_en),
        .O(\gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_intr_reg[0].reg_global_intr_en[0]_i_2 
       (.I0(s_axi_intr_awvalid),
        .I1(axi_wready_reg_0),
        .I2(axi_awready_reg_0),
        .I3(s_axi_intr_wvalid),
        .O(intr_reg_wren__2));
  FDRE \gen_intr_reg[0].reg_global_intr_en_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0 ),
        .Q(reg_global_intr_en),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'h00800000)) 
    \gen_intr_reg[0].reg_intr_ack[0]_i_1 
       (.I0(s_axi_intr_wdata),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(axi_awaddr[4]),
        .I4(intr_reg_wren__2),
        .O(\gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0 ));
  FDRE \gen_intr_reg[0].reg_intr_ack_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0 ),
        .Q(reg_intr_ack),
        .R(\gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFFFF02000000)) 
    \gen_intr_reg[0].reg_intr_en[0]_i_1 
       (.I0(s_axi_intr_wdata),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[4]),
        .I3(axi_awaddr[2]),
        .I4(intr_reg_wren__2),
        .I5(reg_intr_en),
        .O(\gen_intr_reg[0].reg_intr_en[0]_i_1_n_0 ));
  FDRE \gen_intr_reg[0].reg_intr_en_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(\gen_intr_reg[0].reg_intr_en[0]_i_1_n_0 ),
        .Q(reg_intr_en),
        .R(axi_awready_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \gen_intr_reg[0].reg_intr_pending[0]_i_1 
       (.I0(reg_intr_en),
        .I1(reg_intr_sts),
        .O(p_3_out));
  FDRE \gen_intr_reg[0].reg_intr_pending_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(p_3_out),
        .Q(reg_intr_pending),
        .R(\gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \gen_intr_reg[0].reg_intr_sts[0]_i_1 
       (.I0(reg_intr_ack),
        .I1(s_axi_intr_aresetn),
        .O(\gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ));
  FDRE \gen_intr_reg[0].reg_intr_sts_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(det_intr),
        .Q(reg_intr_sts),
        .R(\gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1000)) 
    intr
       (.I0(intr_counter[2]),
        .I1(intr_counter[0]),
        .I2(intr_counter[3]),
        .I3(intr_counter[1]),
        .O(intr_n_0));
  FDRE intr_ack_all_ff_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(intr_ack_all),
        .Q(intr_ack_all_ff),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    intr_ack_all_i_1
       (.I0(reg_intr_ack),
        .I1(s_axi_intr_aresetn),
        .I2(intr_ack_all_ff),
        .O(intr_ack_all_i_1_n_0));
  FDRE intr_ack_all_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(intr_ack_all_i_1_n_0),
        .Q(intr_ack_all),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    intr_all_i_1
       (.I0(reg_intr_pending),
        .I1(s_axi_intr_aresetn),
        .I2(intr_ack_all_ff),
        .O(intr_all_i_1_n_0));
  FDRE intr_all_reg
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(intr_all_i_1_n_0),
        .Q(intr_all),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    intr_counter0
       (.I0(intr_counter[1]),
        .I1(intr_counter[0]),
        .I2(intr_counter[2]),
        .I3(intr_counter[3]),
        .O(intr_counter0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \intr_counter[0]_i_1 
       (.I0(intr_counter[0]),
        .O(intr_counter0__0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \intr_counter[1]_i_1 
       (.I0(intr_counter[0]),
        .I1(intr_counter[1]),
        .O(\intr_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \intr_counter[2]_i_1 
       (.I0(intr_counter[1]),
        .I1(intr_counter[0]),
        .I2(intr_counter[2]),
        .O(\intr_counter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \intr_counter[3]_i_1 
       (.I0(intr_counter[0]),
        .I1(intr_counter[1]),
        .I2(intr_counter[2]),
        .I3(intr_counter[3]),
        .O(\intr_counter[3]_i_1_n_0 ));
  FDSE \intr_counter_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(intr_counter0_n_0),
        .D(intr_counter0__0),
        .Q(intr_counter[0]),
        .S(axi_awready_i_1_n_0));
  FDSE \intr_counter_reg[1] 
       (.C(s_axi_intr_aclk),
        .CE(intr_counter0_n_0),
        .D(\intr_counter[1]_i_1_n_0 ),
        .Q(intr_counter[1]),
        .S(axi_awready_i_1_n_0));
  FDSE \intr_counter_reg[2] 
       (.C(s_axi_intr_aclk),
        .CE(intr_counter0_n_0),
        .D(\intr_counter[2]_i_1_n_0 ),
        .Q(intr_counter[2]),
        .S(axi_awready_i_1_n_0));
  FDSE \intr_counter_reg[3] 
       (.C(s_axi_intr_aclk),
        .CE(intr_counter0_n_0),
        .D(\intr_counter[3]_i_1_n_0 ),
        .Q(intr_counter[3]),
        .S(axi_awready_i_1_n_0));
  FDRE \intr_reg[0] 
       (.C(s_axi_intr_aclk),
        .CE(1'b1),
        .D(intr_n_0),
        .Q(intr__0),
        .R(axi_awready_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
