-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Jan 25 10:20:59 2019
-- Host        : xanadu running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ LEDcpu_ws2811fader_0_1_sim_netlist.vhdl
-- Design      : LEDcpu_ws2811fader_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader is
  port (
    \curLed_reg[9]_0\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \ctrl_reg[0]\ : out STD_LOGIC;
    ws2811data : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    DOBDO : in STD_LOGIC_VECTOR ( 23 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader is
  signal bitNum : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \bitNum[0]_i_1_n_0\ : STD_LOGIC;
  signal \bitNum[1]_i_1_n_0\ : STD_LOGIC;
  signal \bitNum[2]_i_1_n_0\ : STD_LOGIC;
  signal \bitNum[3]_i_1_n_0\ : STD_LOGIC;
  signal \bitNum[4]_i_2_n_0\ : STD_LOGIC;
  signal \bitNum[4]_i_3_n_0\ : STD_LOGIC;
  signal \bitNum[4]_i_4_n_0\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal colorData_reg_i_14_n_0 : STD_LOGIC;
  signal colorData_reg_i_15_n_0 : STD_LOGIC;
  signal colorData_reg_i_16_n_0 : STD_LOGIC;
  signal curLed : STD_LOGIC;
  signal \curLed[4]_i_1_n_0\ : STD_LOGIC;
  signal \curLed[5]_i_1_n_0\ : STD_LOGIC;
  signal \curLed[5]_i_2_n_0\ : STD_LOGIC;
  signal \curLed[6]_i_1_n_0\ : STD_LOGIC;
  signal \curLed[7]_i_1_n_0\ : STD_LOGIC;
  signal \curLed[8]_i_1_n_0\ : STD_LOGIC;
  signal \curLed[9]_i_2_n_0\ : STD_LOGIC;
  signal \curLed[9]_i_3_n_0\ : STD_LOGIC;
  signal \curLed[9]_i_4_n_0\ : STD_LOGIC;
  signal \curLed[9]_i_5_n_0\ : STD_LOGIC;
  signal \curLed[9]_i_6_n_0\ : STD_LOGIC;
  signal \^curled_reg[9]_0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \interBitClk[0]_i_1_n_0\ : STD_LOGIC;
  signal \interBitClk[2]_i_1_n_0\ : STD_LOGIC;
  signal \interBitClk[3]_i_1_n_0\ : STD_LOGIC;
  signal \interBitClk[6]_i_1_n_0\ : STD_LOGIC;
  signal \interBitClk[6]_i_3_n_0\ : STD_LOGIC;
  signal \interBitClk_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \interPrefaceClk[0]_i_1_n_0\ : STD_LOGIC;
  signal \interPrefaceClk[0]_i_2_n_0\ : STD_LOGIC;
  signal \interPrefaceClk[0]_i_4_n_0\ : STD_LOGIC;
  signal \interPrefaceClk[0]_i_5_n_0\ : STD_LOGIC;
  signal \interPrefaceClk[0]_i_6_n_0\ : STD_LOGIC;
  signal \interPrefaceClk[0]_i_7_n_0\ : STD_LOGIC;
  signal interPrefaceClk_reg : STD_LOGIC_VECTOR ( 14 downto 4 );
  signal \interPrefaceClk_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \interPrefaceClk_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \interPrefaceClk_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \interPrefaceClk_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \interPrefaceClk_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \interPrefaceClk_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \interPrefaceClk_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \interPrefaceClk_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \interPrefaceClk_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \interPrefaceClk_reg_n_0_[0]\ : STD_LOGIC;
  signal \interPrefaceClk_reg_n_0_[1]\ : STD_LOGIC;
  signal \interPrefaceClk_reg_n_0_[2]\ : STD_LOGIC;
  signal \interPrefaceClk_reg_n_0_[3]\ : STD_LOGIC;
  signal led_num : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal rebegin : STD_LOGIC;
  signal rebegin_i_1_n_0 : STD_LOGIC;
  signal state_i_1_n_0 : STD_LOGIC;
  signal state_reg_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_10_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_11_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_12_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_13_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_1_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_2_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_3_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_4_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_5_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_6_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_7_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_8_n_0 : STD_LOGIC;
  signal ws2811data_INST_0_i_9_n_0 : STD_LOGIC;
  signal \NLW_interPrefaceClk_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_interPrefaceClk_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bitNum[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bitNum[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bitNum[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bitNum[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bitNum[4]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bitNum[4]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of colorData_reg_i_14 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of colorData_reg_i_15 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of colorData_reg_i_16 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \curLed[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \curLed[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \curLed[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \curLed[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \curLed[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \curLed[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \curLed[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \curLed[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \curLed[9]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \interBitClk[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \interBitClk[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \interBitClk[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \interBitClk[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of ws2811data_INST_0_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of ws2811data_INST_0_i_3 : label is "soft_lutpair8";
begin
  \curLed_reg[9]_0\(9 downto 0) <= \^curled_reg[9]_0\(9 downto 0);
\bitNum[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bitNum(0),
      O => \bitNum[0]_i_1_n_0\
    );
\bitNum[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bitNum(1),
      I1 => bitNum(0),
      O => \bitNum[1]_i_1_n_0\
    );
\bitNum[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => bitNum(2),
      I1 => bitNum(0),
      I2 => bitNum(1),
      O => \bitNum[2]_i_1_n_0\
    );
\bitNum[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1CCCCCCC"
    )
        port map (
      I0 => bitNum(4),
      I1 => bitNum(3),
      I2 => bitNum(2),
      I3 => bitNum(1),
      I4 => bitNum(0),
      O => \bitNum[3]_i_1_n_0\
    );
\bitNum[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Q(0),
      O => clear
    );
\bitNum[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \interBitClk_reg__0\(0),
      I1 => \interBitClk_reg__0\(1),
      I2 => \bitNum[4]_i_4_n_0\,
      O => \bitNum[4]_i_2_n_0\
    );
\bitNum[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3FFF8000"
    )
        port map (
      I0 => bitNum(3),
      I1 => bitNum(0),
      I2 => bitNum(1),
      I3 => bitNum(2),
      I4 => bitNum(4),
      O => \bitNum[4]_i_3_n_0\
    );
\bitNum[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \interBitClk_reg__0\(2),
      I1 => \interBitClk_reg__0\(5),
      I2 => \interBitClk_reg__0\(4),
      I3 => \interBitClk_reg__0\(3),
      I4 => \interBitClk_reg__0\(6),
      O => \bitNum[4]_i_4_n_0\
    );
\bitNum_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \bitNum[4]_i_2_n_0\,
      D => \bitNum[0]_i_1_n_0\,
      Q => bitNum(0),
      R => clear
    );
\bitNum_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \bitNum[4]_i_2_n_0\,
      D => \bitNum[1]_i_1_n_0\,
      Q => bitNum(1),
      R => clear
    );
\bitNum_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \bitNum[4]_i_2_n_0\,
      D => \bitNum[2]_i_1_n_0\,
      Q => bitNum(2),
      R => clear
    );
\bitNum_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \bitNum[4]_i_2_n_0\,
      D => \bitNum[3]_i_1_n_0\,
      Q => bitNum(3),
      R => clear
    );
\bitNum_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \bitNum[4]_i_2_n_0\,
      D => \bitNum[4]_i_3_n_0\,
      Q => bitNum(4),
      R => clear
    );
colorData_reg_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => bitNum(0),
      I1 => bitNum(1),
      I2 => bitNum(2),
      I3 => bitNum(3),
      I4 => bitNum(4),
      O => colorData_reg_i_14_n_0
    );
colorData_reg_i_15: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \interBitClk_reg__0\(5),
      I1 => \interBitClk_reg__0\(4),
      I2 => \interBitClk_reg__0\(3),
      O => colorData_reg_i_15_n_0
    );
colorData_reg_i_16: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \interBitClk_reg__0\(1),
      I1 => \interBitClk_reg__0\(0),
      O => colorData_reg_i_16_n_0
    );
colorData_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => colorData_reg_i_14_n_0,
      I1 => colorData_reg_i_15_n_0,
      I2 => Q(0),
      I3 => \interBitClk_reg__0\(2),
      I4 => colorData_reg_i_16_n_0,
      I5 => \interBitClk_reg__0\(6),
      O => \ctrl_reg[0]\
    );
\curLed[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^curled_reg[9]_0\(0),
      I1 => \curLed[9]_i_4_n_0\,
      O => led_num(0)
    );
\curLed[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \^curled_reg[9]_0\(1),
      I1 => \^curled_reg[9]_0\(0),
      I2 => \curLed[9]_i_4_n_0\,
      O => led_num(1)
    );
\curLed[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0078"
    )
        port map (
      I0 => \^curled_reg[9]_0\(0),
      I1 => \^curled_reg[9]_0\(1),
      I2 => \^curled_reg[9]_0\(2),
      I3 => \curLed[9]_i_4_n_0\,
      O => led_num(2)
    );
\curLed[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007F80"
    )
        port map (
      I0 => \^curled_reg[9]_0\(1),
      I1 => \^curled_reg[9]_0\(0),
      I2 => \^curled_reg[9]_0\(2),
      I3 => \^curled_reg[9]_0\(3),
      I4 => \curLed[9]_i_4_n_0\,
      O => led_num(3)
    );
\curLed[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1555555540000000"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \^curled_reg[9]_0\(2),
      I2 => \^curled_reg[9]_0\(0),
      I3 => \^curled_reg[9]_0\(1),
      I4 => \^curled_reg[9]_0\(3),
      I5 => \^curled_reg[9]_0\(4),
      O => \curLed[4]_i_1_n_0\
    );
\curLed[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \curLed[5]_i_2_n_0\,
      I2 => \^curled_reg[9]_0\(5),
      O => \curLed[5]_i_1_n_0\
    );
\curLed[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \^curled_reg[9]_0\(3),
      I1 => \^curled_reg[9]_0\(1),
      I2 => \^curled_reg[9]_0\(0),
      I3 => \^curled_reg[9]_0\(2),
      I4 => \^curled_reg[9]_0\(4),
      O => \curLed[5]_i_2_n_0\
    );
\curLed[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \curLed[9]_i_5_n_0\,
      I2 => \^curled_reg[9]_0\(6),
      O => \curLed[6]_i_1_n_0\
    );
\curLed[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4510"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \curLed[9]_i_5_n_0\,
      I2 => \^curled_reg[9]_0\(6),
      I3 => \^curled_reg[9]_0\(7),
      O => \curLed[7]_i_1_n_0\
    );
\curLed[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55150040"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \^curled_reg[9]_0\(7),
      I2 => \^curled_reg[9]_0\(6),
      I3 => \curLed[9]_i_5_n_0\,
      I4 => \^curled_reg[9]_0\(8),
      O => \curLed[8]_i_1_n_0\
    );
\curLed[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \bitNum[4]_i_4_n_0\,
      I1 => \interBitClk_reg__0\(1),
      I2 => \interBitClk_reg__0\(0),
      I3 => \curLed[9]_i_3_n_0\,
      I4 => bitNum(0),
      I5 => bitNum(1),
      O => curLed
    );
\curLed[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555510000000"
    )
        port map (
      I0 => \curLed[9]_i_4_n_0\,
      I1 => \curLed[9]_i_5_n_0\,
      I2 => \^curled_reg[9]_0\(6),
      I3 => \^curled_reg[9]_0\(7),
      I4 => \^curled_reg[9]_0\(8),
      I5 => \^curled_reg[9]_0\(9),
      O => \curLed[9]_i_2_n_0\
    );
\curLed[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => bitNum(4),
      I1 => bitNum(3),
      I2 => bitNum(2),
      O => \curLed[9]_i_3_n_0\
    );
\curLed[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \^curled_reg[9]_0\(6),
      I1 => \^curled_reg[9]_0\(8),
      I2 => \^curled_reg[9]_0\(5),
      I3 => \curLed[9]_i_6_n_0\,
      O => \curLed[9]_i_4_n_0\
    );
\curLed[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^curled_reg[9]_0\(4),
      I1 => \^curled_reg[9]_0\(2),
      I2 => \^curled_reg[9]_0\(0),
      I3 => \^curled_reg[9]_0\(1),
      I4 => \^curled_reg[9]_0\(3),
      I5 => \^curled_reg[9]_0\(5),
      O => \curLed[9]_i_5_n_0\
    );
\curLed[9]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FFF"
    )
        port map (
      I0 => \^curled_reg[9]_0\(4),
      I1 => \^curled_reg[9]_0\(3),
      I2 => \^curled_reg[9]_0\(9),
      I3 => \^curled_reg[9]_0\(7),
      O => \curLed[9]_i_6_n_0\
    );
\curLed_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => led_num(0),
      Q => \^curled_reg[9]_0\(0),
      R => clear
    );
\curLed_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => led_num(1),
      Q => \^curled_reg[9]_0\(1),
      R => clear
    );
\curLed_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => led_num(2),
      Q => \^curled_reg[9]_0\(2),
      R => clear
    );
\curLed_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => led_num(3),
      Q => \^curled_reg[9]_0\(3),
      R => clear
    );
\curLed_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[4]_i_1_n_0\,
      Q => \^curled_reg[9]_0\(4),
      R => clear
    );
\curLed_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[5]_i_1_n_0\,
      Q => \^curled_reg[9]_0\(5),
      R => clear
    );
\curLed_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[6]_i_1_n_0\,
      Q => \^curled_reg[9]_0\(6),
      R => clear
    );
\curLed_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[7]_i_1_n_0\,
      Q => \^curled_reg[9]_0\(7),
      R => clear
    );
\curLed_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[8]_i_1_n_0\,
      Q => \^curled_reg[9]_0\(8),
      R => clear
    );
\curLed_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => curLed,
      D => \curLed[9]_i_2_n_0\,
      Q => \^curled_reg[9]_0\(9),
      R => clear
    );
\interBitClk[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \interBitClk_reg__0\(0),
      O => \interBitClk[0]_i_1_n_0\
    );
\interBitClk[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \interBitClk_reg__0\(1),
      I1 => \interBitClk_reg__0\(0),
      O => p_0_in(1)
    );
\interBitClk[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \interBitClk_reg__0\(2),
      I1 => \interBitClk_reg__0\(0),
      I2 => \interBitClk_reg__0\(1),
      O => \interBitClk[2]_i_1_n_0\
    );
\interBitClk[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \interBitClk_reg__0\(3),
      I1 => \interBitClk_reg__0\(2),
      I2 => \interBitClk_reg__0\(1),
      I3 => \interBitClk_reg__0\(0),
      O => \interBitClk[3]_i_1_n_0\
    );
\interBitClk[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \interBitClk_reg__0\(2),
      I1 => \interBitClk_reg__0\(1),
      I2 => \interBitClk_reg__0\(0),
      I3 => \interBitClk_reg__0\(3),
      I4 => \interBitClk_reg__0\(4),
      O => p_0_in(4)
    );
\interBitClk[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \interBitClk_reg__0\(5),
      I1 => \interBitClk_reg__0\(2),
      I2 => \interBitClk_reg__0\(1),
      I3 => \interBitClk_reg__0\(0),
      I4 => \interBitClk_reg__0\(3),
      I5 => \interBitClk_reg__0\(4),
      O => p_0_in(5)
    );
\interBitClk[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \interBitClk[6]_i_3_n_0\,
      I1 => Q(0),
      O => \interBitClk[6]_i_1_n_0\
    );
\interBitClk[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \interBitClk_reg__0\(6),
      I1 => colorData_reg_i_16_n_0,
      I2 => \interBitClk_reg__0\(3),
      I3 => \interBitClk_reg__0\(4),
      I4 => \interBitClk_reg__0\(5),
      I5 => \interBitClk_reg__0\(2),
      O => p_0_in(6)
    );
\interBitClk[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => state_reg_n_0,
      I1 => \interBitClk_reg__0\(6),
      I2 => \interBitClk_reg__0\(3),
      I3 => \interBitClk_reg__0\(4),
      I4 => \interBitClk_reg__0\(5),
      I5 => \interBitClk_reg__0\(2),
      O => \interBitClk[6]_i_3_n_0\
    );
\interBitClk_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => \interBitClk[0]_i_1_n_0\,
      Q => \interBitClk_reg__0\(0),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => p_0_in(1),
      Q => \interBitClk_reg__0\(1),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => \interBitClk[2]_i_1_n_0\,
      Q => \interBitClk_reg__0\(2),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => \interBitClk[3]_i_1_n_0\,
      Q => \interBitClk_reg__0\(3),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => p_0_in(4),
      Q => \interBitClk_reg__0\(4),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => p_0_in(5),
      Q => \interBitClk_reg__0\(5),
      R => \interBitClk[6]_i_1_n_0\
    );
\interBitClk_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => state_reg_n_0,
      D => p_0_in(6),
      Q => \interBitClk_reg__0\(6),
      R => \interBitClk[6]_i_1_n_0\
    );
\interPrefaceClk[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \interPrefaceClk[0]_i_4_n_0\,
      I1 => Q(0),
      O => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state_reg_n_0,
      O => \interPrefaceClk[0]_i_2_n_0\
    );
\interPrefaceClk[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F2"
    )
        port map (
      I0 => interPrefaceClk_reg(10),
      I1 => \interPrefaceClk[0]_i_6_n_0\,
      I2 => interPrefaceClk_reg(11),
      I3 => \interPrefaceClk[0]_i_7_n_0\,
      O => \interPrefaceClk[0]_i_4_n_0\
    );
\interPrefaceClk[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \interPrefaceClk_reg_n_0_[0]\,
      O => \interPrefaceClk[0]_i_5_n_0\
    );
\interPrefaceClk[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005555557F"
    )
        port map (
      I0 => interPrefaceClk_reg(8),
      I1 => interPrefaceClk_reg(4),
      I2 => interPrefaceClk_reg(5),
      I3 => interPrefaceClk_reg(6),
      I4 => interPrefaceClk_reg(7),
      I5 => interPrefaceClk_reg(9),
      O => \interPrefaceClk[0]_i_6_n_0\
    );
\interPrefaceClk[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => interPrefaceClk_reg(13),
      I1 => interPrefaceClk_reg(14),
      I2 => interPrefaceClk_reg(12),
      I3 => state_reg_n_0,
      O => \interPrefaceClk[0]_i_7_n_0\
    );
\interPrefaceClk_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[0]_i_3_n_7\,
      Q => \interPrefaceClk_reg_n_0_[0]\,
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \interPrefaceClk_reg[0]_i_3_n_0\,
      CO(2) => \interPrefaceClk_reg[0]_i_3_n_1\,
      CO(1) => \interPrefaceClk_reg[0]_i_3_n_2\,
      CO(0) => \interPrefaceClk_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \interPrefaceClk_reg[0]_i_3_n_4\,
      O(2) => \interPrefaceClk_reg[0]_i_3_n_5\,
      O(1) => \interPrefaceClk_reg[0]_i_3_n_6\,
      O(0) => \interPrefaceClk_reg[0]_i_3_n_7\,
      S(3) => \interPrefaceClk_reg_n_0_[3]\,
      S(2) => \interPrefaceClk_reg_n_0_[2]\,
      S(1) => \interPrefaceClk_reg_n_0_[1]\,
      S(0) => \interPrefaceClk[0]_i_5_n_0\
    );
\interPrefaceClk_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[8]_i_1_n_5\,
      Q => interPrefaceClk_reg(10),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[8]_i_1_n_4\,
      Q => interPrefaceClk_reg(11),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[12]_i_1_n_7\,
      Q => interPrefaceClk_reg(12),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interPrefaceClk_reg[8]_i_1_n_0\,
      CO(3 downto 2) => \NLW_interPrefaceClk_reg[12]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \interPrefaceClk_reg[12]_i_1_n_2\,
      CO(0) => \interPrefaceClk_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_interPrefaceClk_reg[12]_i_1_O_UNCONNECTED\(3),
      O(2) => \interPrefaceClk_reg[12]_i_1_n_5\,
      O(1) => \interPrefaceClk_reg[12]_i_1_n_6\,
      O(0) => \interPrefaceClk_reg[12]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => interPrefaceClk_reg(14 downto 12)
    );
\interPrefaceClk_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[12]_i_1_n_6\,
      Q => interPrefaceClk_reg(13),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[12]_i_1_n_5\,
      Q => interPrefaceClk_reg(14),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[0]_i_3_n_6\,
      Q => \interPrefaceClk_reg_n_0_[1]\,
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[0]_i_3_n_5\,
      Q => \interPrefaceClk_reg_n_0_[2]\,
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[0]_i_3_n_4\,
      Q => \interPrefaceClk_reg_n_0_[3]\,
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[4]_i_1_n_7\,
      Q => interPrefaceClk_reg(4),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interPrefaceClk_reg[0]_i_3_n_0\,
      CO(3) => \interPrefaceClk_reg[4]_i_1_n_0\,
      CO(2) => \interPrefaceClk_reg[4]_i_1_n_1\,
      CO(1) => \interPrefaceClk_reg[4]_i_1_n_2\,
      CO(0) => \interPrefaceClk_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \interPrefaceClk_reg[4]_i_1_n_4\,
      O(2) => \interPrefaceClk_reg[4]_i_1_n_5\,
      O(1) => \interPrefaceClk_reg[4]_i_1_n_6\,
      O(0) => \interPrefaceClk_reg[4]_i_1_n_7\,
      S(3 downto 0) => interPrefaceClk_reg(7 downto 4)
    );
\interPrefaceClk_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[4]_i_1_n_6\,
      Q => interPrefaceClk_reg(5),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[4]_i_1_n_5\,
      Q => interPrefaceClk_reg(6),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[4]_i_1_n_4\,
      Q => interPrefaceClk_reg(7),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[8]_i_1_n_7\,
      Q => interPrefaceClk_reg(8),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
\interPrefaceClk_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \interPrefaceClk_reg[4]_i_1_n_0\,
      CO(3) => \interPrefaceClk_reg[8]_i_1_n_0\,
      CO(2) => \interPrefaceClk_reg[8]_i_1_n_1\,
      CO(1) => \interPrefaceClk_reg[8]_i_1_n_2\,
      CO(0) => \interPrefaceClk_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \interPrefaceClk_reg[8]_i_1_n_4\,
      O(2) => \interPrefaceClk_reg[8]_i_1_n_5\,
      O(1) => \interPrefaceClk_reg[8]_i_1_n_6\,
      O(0) => \interPrefaceClk_reg[8]_i_1_n_7\,
      S(3 downto 0) => interPrefaceClk_reg(11 downto 8)
    );
\interPrefaceClk_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \interPrefaceClk[0]_i_2_n_0\,
      D => \interPrefaceClk_reg[8]_i_1_n_6\,
      Q => interPrefaceClk_reg(9),
      R => \interPrefaceClk[0]_i_1_n_0\
    );
rebegin_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD58080"
    )
        port map (
      I0 => Q(0),
      I1 => curLed,
      I2 => \curLed[9]_i_4_n_0\,
      I3 => state_reg_n_0,
      I4 => rebegin,
      O => rebegin_i_1_n_0
    );
rebegin_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => rebegin_i_1_n_0,
      Q => rebegin,
      R => '0'
    );
state_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5666666600000000"
    )
        port map (
      I0 => state_reg_n_0,
      I1 => \interPrefaceClk[0]_i_4_n_0\,
      I2 => rebegin,
      I3 => colorData_reg_i_14_n_0,
      I4 => \interBitClk[6]_i_3_n_0\,
      I5 => Q(0),
      O => state_i_1_n_0
    );
state_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => state_i_1_n_0,
      Q => state_reg_n_0,
      R => '0'
    );
ws2811data_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005404FFFF"
    )
        port map (
      I0 => ws2811data_INST_0_i_1_n_0,
      I1 => ws2811data_INST_0_i_2_n_0,
      I2 => ws2811data_INST_0_i_3_n_0,
      I3 => ws2811data_INST_0_i_4_n_0,
      I4 => \interBitClk_reg__0\(5),
      I5 => ws2811data_INST_0_i_5_n_0,
      O => ws2811data
    );
ws2811data_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \interBitClk_reg__0\(4),
      I1 => \interBitClk_reg__0\(3),
      I2 => \interBitClk_reg__0\(0),
      I3 => \interBitClk_reg__0\(1),
      I4 => \interBitClk_reg__0\(2),
      O => ws2811data_INST_0_i_1_n_0
    );
ws2811data_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(4),
      I1 => DOBDO(5),
      I2 => bitNum(1),
      I3 => DOBDO(6),
      I4 => bitNum(0),
      I5 => DOBDO(7),
      O => ws2811data_INST_0_i_10_n_0
    );
ws2811data_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(0),
      I1 => DOBDO(1),
      I2 => bitNum(1),
      I3 => DOBDO(2),
      I4 => bitNum(0),
      I5 => DOBDO(3),
      O => ws2811data_INST_0_i_11_n_0
    );
ws2811data_INST_0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(12),
      I1 => DOBDO(13),
      I2 => bitNum(1),
      I3 => DOBDO(14),
      I4 => bitNum(0),
      I5 => DOBDO(15),
      O => ws2811data_INST_0_i_12_n_0
    );
ws2811data_INST_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(8),
      I1 => DOBDO(9),
      I2 => bitNum(1),
      I3 => DOBDO(10),
      I4 => bitNum(0),
      I5 => DOBDO(11),
      O => ws2811data_INST_0_i_13_n_0
    );
ws2811data_INST_0_i_2: unisim.vcomponents.MUXF8
     port map (
      I0 => ws2811data_INST_0_i_6_n_0,
      I1 => ws2811data_INST_0_i_7_n_0,
      O => ws2811data_INST_0_i_2_n_0,
      S => bitNum(3)
    );
ws2811data_INST_0_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => bitNum(4),
      I1 => bitNum(3),
      O => ws2811data_INST_0_i_3_n_0
    );
ws2811data_INST_0_i_4: unisim.vcomponents.MUXF7
     port map (
      I0 => ws2811data_INST_0_i_8_n_0,
      I1 => ws2811data_INST_0_i_9_n_0,
      O => ws2811data_INST_0_i_4_n_0,
      S => bitNum(2)
    );
ws2811data_INST_0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => Q(0),
      I1 => \interBitClk_reg__0\(6),
      I2 => state_reg_n_0,
      O => ws2811data_INST_0_i_5_n_0
    );
ws2811data_INST_0_i_6: unisim.vcomponents.MUXF7
     port map (
      I0 => ws2811data_INST_0_i_10_n_0,
      I1 => ws2811data_INST_0_i_11_n_0,
      O => ws2811data_INST_0_i_6_n_0,
      S => bitNum(2)
    );
ws2811data_INST_0_i_7: unisim.vcomponents.MUXF7
     port map (
      I0 => ws2811data_INST_0_i_12_n_0,
      I1 => ws2811data_INST_0_i_13_n_0,
      O => ws2811data_INST_0_i_7_n_0,
      S => bitNum(2)
    );
ws2811data_INST_0_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(20),
      I1 => DOBDO(21),
      I2 => bitNum(1),
      I3 => DOBDO(22),
      I4 => bitNum(0),
      I5 => DOBDO(23),
      O => ws2811data_INST_0_i_8_n_0
    );
ws2811data_INST_0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOBDO(16),
      I1 => DOBDO(17),
      I2 => bitNum(1),
      I3 => DOBDO(18),
      I4 => bitNum(0),
      I5 => DOBDO(19),
      O => ws2811data_INST_0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR is
  port (
    axi_wready_reg_0 : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    s_axi_intr_bvalid : out STD_LOGIC;
    s_axi_intr_rvalid : out STD_LOGIC;
    s_axi_intr_rdata : out STD_LOGIC_VECTOR ( 0 to 0 );
    irq : out STD_LOGIC;
    s_axi_intr_aclk : in STD_LOGIC;
    s_axi_intr_aresetn : in STD_LOGIC;
    s_axi_intr_awvalid : in STD_LOGIC;
    s_axi_intr_wvalid : in STD_LOGIC;
    s_axi_intr_bready : in STD_LOGIC;
    s_axi_intr_arvalid : in STD_LOGIC;
    s_axi_intr_rready : in STD_LOGIC;
    s_axi_intr_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_intr_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_intr_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR is
  signal \aw_en_i_1__0_n_0\ : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[4]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 4 downto 2 );
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[4]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal \axi_awready_i_1__0_n_0\ : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal \axi_bvalid_i_1__0_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rvalid_i_1__0_n_0\ : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal det_intr : STD_LOGIC;
  signal \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_intr_detection[0].s_irq_lvl_i_1_n_0\ : STD_LOGIC;
  signal \gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_intr_reg[0].reg_intr_en[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\ : STD_LOGIC;
  signal \intr__0\ : STD_LOGIC;
  signal intr_ack_all : STD_LOGIC;
  signal intr_ack_all_ff : STD_LOGIC;
  signal intr_ack_all_i_1_n_0 : STD_LOGIC;
  signal intr_all : STD_LOGIC;
  signal intr_all_i_1_n_0 : STD_LOGIC;
  signal intr_counter : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \intr_counter0__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal intr_counter0_n_0 : STD_LOGIC;
  signal \intr_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \intr_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \intr_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal intr_n_0 : STD_LOGIC;
  signal \intr_reg_wren__2\ : STD_LOGIC;
  signal \^irq\ : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal reg_data_out : STD_LOGIC;
  signal reg_global_intr_en : STD_LOGIC;
  signal reg_intr_ack : STD_LOGIC;
  signal reg_intr_en : STD_LOGIC;
  signal reg_intr_pending : STD_LOGIC;
  signal reg_intr_sts : STD_LOGIC;
  signal \^s_axi_intr_bvalid\ : STD_LOGIC;
  signal \^s_axi_intr_rdata\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_intr_rvalid\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \axi_arready_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \axi_wready_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gen_intr_reg[0].reg_global_intr_en[0]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of intr_ack_all_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of intr_all_i_1 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \intr_counter[0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \intr_counter[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \intr_counter[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \intr_counter[3]_i_1\ : label is "soft_lutpair15";
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  irq <= \^irq\;
  s_axi_intr_bvalid <= \^s_axi_intr_bvalid\;
  s_axi_intr_rdata(0) <= \^s_axi_intr_rdata\(0);
  s_axi_intr_rvalid <= \^s_axi_intr_rvalid\;
\aw_en_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFF8CCC8CCC8CCC"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => aw_en_reg_n_0,
      I2 => s_axi_intr_wvalid,
      I3 => s_axi_intr_awvalid,
      I4 => s_axi_intr_bready,
      I5 => \^s_axi_intr_bvalid\,
      O => \aw_en_i_1__0_n_0\
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \aw_en_i_1__0_n_0\,
      Q => aw_en_reg_n_0,
      S => \axi_awready_i_1__0_n_0\
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s_axi_intr_araddr(0),
      I1 => s_axi_intr_arvalid,
      I2 => \^axi_arready_reg_0\,
      I3 => sel0(0),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s_axi_intr_araddr(1),
      I1 => s_axi_intr_arvalid,
      I2 => \^axi_arready_reg_0\,
      I3 => sel0(1),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s_axi_intr_araddr(2),
      I1 => s_axi_intr_arvalid,
      I2 => \^axi_arready_reg_0\,
      I3 => sel0(2),
      O => \axi_araddr[4]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => sel0(0),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => sel0(1),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_araddr[4]_i_1_n_0\,
      Q => sel0(2),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_arready_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_intr_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^axi_arready_reg_0\,
      R => \axi_awready_i_1__0_n_0\
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s_axi_intr_awaddr(0),
      I1 => s_axi_intr_awvalid,
      I2 => s_axi_intr_wvalid,
      I3 => aw_en_reg_n_0,
      I4 => \^axi_awready_reg_0\,
      I5 => axi_awaddr(2),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s_axi_intr_awaddr(1),
      I1 => s_axi_intr_awvalid,
      I2 => s_axi_intr_wvalid,
      I3 => aw_en_reg_n_0,
      I4 => \^axi_awready_reg_0\,
      I5 => axi_awaddr(3),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => s_axi_intr_awaddr(2),
      I1 => s_axi_intr_awvalid,
      I2 => s_axi_intr_wvalid,
      I3 => aw_en_reg_n_0,
      I4 => \^axi_awready_reg_0\,
      I5 => axi_awaddr(4),
      O => \axi_awaddr[4]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => axi_awaddr(2),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => axi_awaddr(3),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_awaddr[4]_i_1_n_0\,
      Q => axi_awaddr(4),
      R => \axi_awready_i_1__0_n_0\
    );
\axi_awready_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_intr_aresetn,
      O => \axi_awready_i_1__0_n_0\
    );
\axi_awready_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s_axi_intr_awvalid,
      I1 => s_axi_intr_wvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^axi_awready_reg_0\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^axi_awready_reg_0\,
      R => \axi_awready_i_1__0_n_0\
    );
\axi_bvalid_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s_axi_intr_awvalid,
      I1 => \^axi_wready_reg_0\,
      I2 => \^axi_awready_reg_0\,
      I3 => s_axi_intr_wvalid,
      I4 => s_axi_intr_bready,
      I5 => \^s_axi_intr_bvalid\,
      O => \axi_bvalid_i_1__0_n_0\
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_bvalid_i_1__0_n_0\,
      Q => \^s_axi_intr_bvalid\,
      R => \axi_awready_i_1__0_n_0\
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0C0A0A0A0A0A0"
    )
        port map (
      I0 => \^s_axi_intr_rdata\(0),
      I1 => reg_data_out,
      I2 => s_axi_intr_aresetn,
      I3 => \^axi_arready_reg_0\,
      I4 => \^s_axi_intr_rvalid\,
      I5 => s_axi_intr_arvalid,
      O => \axi_rdata[0]_i_1_n_0\
    );
\axi_rdata[0]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A0A3A0A"
    )
        port map (
      I0 => \axi_rdata[0]_i_3_n_0\,
      I1 => sel0(1),
      I2 => sel0(2),
      I3 => reg_intr_pending,
      I4 => sel0(0),
      O => reg_data_out
    );
\axi_rdata[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => reg_intr_ack,
      I1 => reg_intr_sts,
      I2 => sel0(1),
      I3 => reg_intr_en,
      I4 => sel0(0),
      I5 => reg_global_intr_en,
      O => \axi_rdata[0]_i_3_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_rdata[0]_i_1_n_0\,
      Q => \^s_axi_intr_rdata\(0),
      R => '0'
    );
\axi_rvalid_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s_axi_intr_arvalid,
      I2 => \^s_axi_intr_rvalid\,
      I3 => s_axi_intr_rready,
      O => \axi_rvalid_i_1__0_n_0\
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \axi_rvalid_i_1__0_n_0\,
      Q => \^s_axi_intr_rvalid\,
      R => \axi_awready_i_1__0_n_0\
    );
\axi_wready_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s_axi_intr_awvalid,
      I1 => s_axi_intr_wvalid,
      I2 => aw_en_reg_n_0,
      I3 => \^axi_wready_reg_0\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => \axi_awready_i_1__0_n_0\
    );
\gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \intr__0\,
      I1 => det_intr,
      O => \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0\
    );
\gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \gen_intr_detection[0].gen_intr_level_detect.gen_intr_active_high_detect.det_intr[0]_i_1_n_0\,
      Q => det_intr,
      R => \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\
    );
\gen_intr_detection[0].s_irq_lvl_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EA00"
    )
        port map (
      I0 => \^irq\,
      I1 => reg_global_intr_en,
      I2 => intr_all,
      I3 => s_axi_intr_aresetn,
      I4 => intr_ack_all,
      O => \gen_intr_detection[0].s_irq_lvl_i_1_n_0\
    );
\gen_intr_detection[0].s_irq_lvl_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \gen_intr_detection[0].s_irq_lvl_i_1_n_0\,
      Q => \^irq\,
      R => '0'
    );
\gen_intr_reg[0].reg_global_intr_en[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => s_axi_intr_wdata(0),
      I1 => axi_awaddr(4),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      I4 => \intr_reg_wren__2\,
      I5 => reg_global_intr_en,
      O => \gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_global_intr_en[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => s_axi_intr_awvalid,
      I1 => \^axi_wready_reg_0\,
      I2 => \^axi_awready_reg_0\,
      I3 => s_axi_intr_wvalid,
      O => \intr_reg_wren__2\
    );
\gen_intr_reg[0].reg_global_intr_en_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \gen_intr_reg[0].reg_global_intr_en[0]_i_1_n_0\,
      Q => reg_global_intr_en,
      R => \axi_awready_i_1__0_n_0\
    );
\gen_intr_reg[0].reg_intr_ack[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => s_axi_intr_wdata(0),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => \intr_reg_wren__2\,
      O => \gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_intr_ack_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \gen_intr_reg[0].reg_intr_ack[0]_i_1_n_0\,
      Q => reg_intr_ack,
      R => \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_intr_en[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF02000000"
    )
        port map (
      I0 => s_axi_intr_wdata(0),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(4),
      I3 => axi_awaddr(2),
      I4 => \intr_reg_wren__2\,
      I5 => reg_intr_en,
      O => \gen_intr_reg[0].reg_intr_en[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_intr_en_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => \gen_intr_reg[0].reg_intr_en[0]_i_1_n_0\,
      Q => reg_intr_en,
      R => \axi_awready_i_1__0_n_0\
    );
\gen_intr_reg[0].reg_intr_pending[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => reg_intr_en,
      I1 => reg_intr_sts,
      O => p_3_out
    );
\gen_intr_reg[0].reg_intr_pending_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => p_3_out,
      Q => reg_intr_pending,
      R => \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_intr_sts[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reg_intr_ack,
      I1 => s_axi_intr_aresetn,
      O => \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\
    );
\gen_intr_reg[0].reg_intr_sts_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => det_intr,
      Q => reg_intr_sts,
      R => \gen_intr_reg[0].reg_intr_sts[0]_i_1_n_0\
    );
intr: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => intr_counter(2),
      I1 => intr_counter(0),
      I2 => intr_counter(3),
      I3 => intr_counter(1),
      O => intr_n_0
    );
intr_ack_all_ff_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => intr_ack_all,
      Q => intr_ack_all_ff,
      R => \axi_awready_i_1__0_n_0\
    );
intr_ack_all_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => reg_intr_ack,
      I1 => s_axi_intr_aresetn,
      I2 => intr_ack_all_ff,
      O => intr_ack_all_i_1_n_0
    );
intr_ack_all_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => intr_ack_all_i_1_n_0,
      Q => intr_ack_all,
      R => '0'
    );
intr_all_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => reg_intr_pending,
      I1 => s_axi_intr_aresetn,
      I2 => intr_ack_all_ff,
      O => intr_all_i_1_n_0
    );
intr_all_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => intr_all_i_1_n_0,
      Q => intr_all,
      R => '0'
    );
intr_counter0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => intr_counter(1),
      I1 => intr_counter(0),
      I2 => intr_counter(2),
      I3 => intr_counter(3),
      O => intr_counter0_n_0
    );
\intr_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => intr_counter(0),
      O => \intr_counter0__0\(0)
    );
\intr_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => intr_counter(0),
      I1 => intr_counter(1),
      O => \intr_counter[1]_i_1_n_0\
    );
\intr_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => intr_counter(1),
      I1 => intr_counter(0),
      I2 => intr_counter(2),
      O => \intr_counter[2]_i_1_n_0\
    );
\intr_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => intr_counter(0),
      I1 => intr_counter(1),
      I2 => intr_counter(2),
      I3 => intr_counter(3),
      O => \intr_counter[3]_i_1_n_0\
    );
\intr_counter_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_intr_aclk,
      CE => intr_counter0_n_0,
      D => \intr_counter0__0\(0),
      Q => intr_counter(0),
      S => \axi_awready_i_1__0_n_0\
    );
\intr_counter_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_intr_aclk,
      CE => intr_counter0_n_0,
      D => \intr_counter[1]_i_1_n_0\,
      Q => intr_counter(1),
      S => \axi_awready_i_1__0_n_0\
    );
\intr_counter_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_intr_aclk,
      CE => intr_counter0_n_0,
      D => \intr_counter[2]_i_1_n_0\,
      Q => intr_counter(2),
      S => \axi_awready_i_1__0_n_0\
    );
\intr_counter_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_intr_aclk,
      CE => intr_counter0_n_0,
      D => \intr_counter[3]_i_1_n_0\,
      Q => intr_counter(3),
      S => \axi_awready_i_1__0_n_0\
    );
\intr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_intr_aclk,
      CE => '1',
      D => intr_n_0,
      Q => \intr__0\,
      R => \axi_awready_i_1__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI is
  port (
    axi_wready_reg_0 : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ws2811data : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI is
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 14 downto 2 );
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal colorData : STD_LOGIC;
  signal colorData_reg_i_12_n_0 : STD_LOGIC;
  signal colorData_reg_i_13_n_0 : STD_LOGIC;
  signal colorData_reg_i_17_n_0 : STD_LOGIC;
  signal colorData_reg_i_18_n_0 : STD_LOGIC;
  signal colorData_reg_i_19_n_0 : STD_LOGIC;
  signal colorData_reg_i_1_n_0 : STD_LOGIC;
  signal ctrl : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \ctrl[15]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[23]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[31]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl[7]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[10]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[11]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[12]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[13]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[14]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[15]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[16]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[17]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[18]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[19]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[1]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[20]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[21]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[22]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[23]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[24]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[25]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[26]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[27]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[28]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[29]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[2]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[30]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[31]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[3]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[4]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[5]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[6]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[7]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[8]\ : STD_LOGIC;
  signal \ctrl_reg_n_0_[9]\ : STD_LOGIC;
  signal curCol : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal curLed : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal nolabel_line452_n_10 : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 9 downto 2 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  signal NLW_colorData_reg_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_DBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_INJECTDBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_INJECTSBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_SBITERR_UNCONNECTED : STD_LOGIC;
  signal NLW_colorData_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_colorData_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal NLW_colorData_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_colorData_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_colorData_reg_ECCPARITY_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_colorData_reg_RDADDRECC_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair12";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of colorData_reg : label is "p0_d32";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of colorData_reg : label is "p0_d32";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of colorData_reg : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of colorData_reg : label is 32032;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of colorData_reg : label is "colorData";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of colorData_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of colorData_reg : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of colorData_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of colorData_reg : label is 31;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of colorData_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of colorData_reg : label is 1023;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of colorData_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of colorData_reg : label is 31;
  attribute SOFT_HLUTNM of colorData_reg_i_12 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of colorData_reg_i_17 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \ctrl[31]_i_2\ : label is "soft_lutpair12";
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88880FFF8888"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => \^s00_axi_bvalid\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      I4 => aw_en_reg_n_0,
      I5 => \^axi_awready_reg_0\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(8),
      Q => axi_araddr(10),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(9),
      Q => axi_araddr(11),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(10),
      Q => axi_araddr(12),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(11),
      Q => axi_araddr(13),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(12),
      Q => axi_araddr(14),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(0),
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(1),
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(2),
      Q => axi_araddr(4),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(3),
      Q => axi_araddr(5),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(4),
      Q => axi_araddr(6),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(5),
      Q => axi_araddr(7),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(6),
      Q => axi_araddr(8),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(7),
      Q => axi_araddr(9),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^axi_arready_reg_0\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(8),
      Q => p_0_in_0(8),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(9),
      Q => p_0_in_0(9),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(10),
      Q => p_0_in_0(10),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(11),
      Q => p_0_in_0(11),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(12),
      Q => p_0_in_0(12),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(0),
      Q => p_0_in_0(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(1),
      Q => p_0_in_0(1),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(2),
      Q => p_0_in_0(2),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(3),
      Q => p_0_in_0(3),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(4),
      Q => p_0_in_0(4),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(5),
      Q => p_0_in_0(5),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(6),
      Q => p_0_in_0(6),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(7),
      Q => p_0_in_0(7),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => aw_en_reg_n_0,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^axi_awready_reg_0\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555C0000000"
    )
        port map (
      I0 => s00_axi_bready,
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^axi_wready_reg_0\,
      I4 => \^axi_awready_reg_0\,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[0]_i_2_n_0\,
      O => \axi_rdata[0]_i_1__0_n_0\
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(0),
      I1 => slv_reg3(0),
      I2 => ctrl(0),
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(0),
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[10]_i_2_n_0\,
      O => \axi_rdata[10]_i_1_n_0\
    );
\axi_rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(10),
      I1 => slv_reg3(10),
      I2 => \ctrl_reg_n_0_[10]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(10),
      O => \axi_rdata[10]_i_2_n_0\
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[11]_i_2_n_0\,
      O => \axi_rdata[11]_i_1_n_0\
    );
\axi_rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(11),
      I1 => slv_reg3(11),
      I2 => \ctrl_reg_n_0_[11]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(11),
      O => \axi_rdata[11]_i_2_n_0\
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[12]_i_2_n_0\,
      O => \axi_rdata[12]_i_1_n_0\
    );
\axi_rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(12),
      I1 => slv_reg3(12),
      I2 => \ctrl_reg_n_0_[12]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(12),
      O => \axi_rdata[12]_i_2_n_0\
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[13]_i_2_n_0\,
      O => \axi_rdata[13]_i_1_n_0\
    );
\axi_rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(13),
      I1 => slv_reg3(13),
      I2 => \ctrl_reg_n_0_[13]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(13),
      O => \axi_rdata[13]_i_2_n_0\
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[14]_i_2_n_0\,
      O => \axi_rdata[14]_i_1_n_0\
    );
\axi_rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(14),
      I1 => slv_reg3(14),
      I2 => \ctrl_reg_n_0_[14]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(14),
      O => \axi_rdata[14]_i_2_n_0\
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[15]_i_2_n_0\,
      O => \axi_rdata[15]_i_1_n_0\
    );
\axi_rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(15),
      I1 => slv_reg3(15),
      I2 => \ctrl_reg_n_0_[15]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(15),
      O => \axi_rdata[15]_i_2_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[16]_i_2_n_0\,
      O => \axi_rdata[16]_i_1_n_0\
    );
\axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(16),
      I1 => slv_reg3(16),
      I2 => \ctrl_reg_n_0_[16]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(16),
      O => \axi_rdata[16]_i_2_n_0\
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[17]_i_2_n_0\,
      O => \axi_rdata[17]_i_1_n_0\
    );
\axi_rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(17),
      I1 => slv_reg3(17),
      I2 => \ctrl_reg_n_0_[17]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(17),
      O => \axi_rdata[17]_i_2_n_0\
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[18]_i_2_n_0\,
      O => \axi_rdata[18]_i_1_n_0\
    );
\axi_rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(18),
      I1 => slv_reg3(18),
      I2 => \ctrl_reg_n_0_[18]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(18),
      O => \axi_rdata[18]_i_2_n_0\
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[19]_i_2_n_0\,
      O => \axi_rdata[19]_i_1_n_0\
    );
\axi_rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(19),
      I1 => slv_reg3(19),
      I2 => \ctrl_reg_n_0_[19]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(19),
      O => \axi_rdata[19]_i_2_n_0\
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[1]_i_2_n_0\,
      O => \axi_rdata[1]_i_1_n_0\
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(1),
      I1 => slv_reg3(1),
      I2 => \ctrl_reg_n_0_[1]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(1),
      O => \axi_rdata[1]_i_2_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[20]_i_2_n_0\,
      O => \axi_rdata[20]_i_1_n_0\
    );
\axi_rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(20),
      I1 => slv_reg3(20),
      I2 => \ctrl_reg_n_0_[20]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(20),
      O => \axi_rdata[20]_i_2_n_0\
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[21]_i_2_n_0\,
      O => \axi_rdata[21]_i_1_n_0\
    );
\axi_rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(21),
      I1 => slv_reg3(21),
      I2 => \ctrl_reg_n_0_[21]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(21),
      O => \axi_rdata[21]_i_2_n_0\
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[22]_i_2_n_0\,
      O => \axi_rdata[22]_i_1_n_0\
    );
\axi_rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(22),
      I1 => slv_reg3(22),
      I2 => \ctrl_reg_n_0_[22]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(22),
      O => \axi_rdata[22]_i_2_n_0\
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[23]_i_2_n_0\,
      O => \axi_rdata[23]_i_1_n_0\
    );
\axi_rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(23),
      I1 => slv_reg3(23),
      I2 => \ctrl_reg_n_0_[23]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(23),
      O => \axi_rdata[23]_i_2_n_0\
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[24]_i_2_n_0\,
      O => \axi_rdata[24]_i_1_n_0\
    );
\axi_rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(24),
      I1 => slv_reg3(24),
      I2 => \ctrl_reg_n_0_[24]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(24),
      O => \axi_rdata[24]_i_2_n_0\
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[25]_i_2_n_0\,
      O => \axi_rdata[25]_i_1_n_0\
    );
\axi_rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(25),
      I1 => slv_reg3(25),
      I2 => \ctrl_reg_n_0_[25]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(25),
      O => \axi_rdata[25]_i_2_n_0\
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[26]_i_2_n_0\,
      O => \axi_rdata[26]_i_1_n_0\
    );
\axi_rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(26),
      I1 => slv_reg3(26),
      I2 => \ctrl_reg_n_0_[26]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(26),
      O => \axi_rdata[26]_i_2_n_0\
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[27]_i_2_n_0\,
      O => \axi_rdata[27]_i_1_n_0\
    );
\axi_rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(27),
      I1 => slv_reg3(27),
      I2 => \ctrl_reg_n_0_[27]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(27),
      O => \axi_rdata[27]_i_2_n_0\
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[28]_i_2_n_0\,
      O => \axi_rdata[28]_i_1_n_0\
    );
\axi_rdata[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(28),
      I1 => slv_reg3(28),
      I2 => \ctrl_reg_n_0_[28]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(28),
      O => \axi_rdata[28]_i_2_n_0\
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[29]_i_2_n_0\,
      O => \axi_rdata[29]_i_1_n_0\
    );
\axi_rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(29),
      I1 => slv_reg3(29),
      I2 => \ctrl_reg_n_0_[29]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(29),
      O => \axi_rdata[29]_i_2_n_0\
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[2]_i_2_n_0\,
      O => \axi_rdata[2]_i_1_n_0\
    );
\axi_rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(2),
      I1 => slv_reg3(2),
      I2 => \ctrl_reg_n_0_[2]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(2),
      O => \axi_rdata[2]_i_2_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[30]_i_2_n_0\,
      O => \axi_rdata[30]_i_1_n_0\
    );
\axi_rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(30),
      I1 => slv_reg3(30),
      I2 => \ctrl_reg_n_0_[30]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(30),
      O => \axi_rdata[30]_i_2_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => axi_araddr(13),
      I1 => axi_araddr(5),
      I2 => axi_araddr(10),
      I3 => axi_araddr(8),
      O => \axi_rdata[31]_i_2_n_0\
    );
\axi_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => axi_araddr(14),
      I1 => axi_araddr(11),
      I2 => axi_araddr(12),
      I3 => axi_araddr(6),
      O => \axi_rdata[31]_i_3_n_0\
    );
\axi_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(31),
      I1 => slv_reg3(31),
      I2 => \ctrl_reg_n_0_[31]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(31),
      O => \axi_rdata[31]_i_4_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[3]_i_2_n_0\,
      O => \axi_rdata[3]_i_1_n_0\
    );
\axi_rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(3),
      I1 => slv_reg3(3),
      I2 => \ctrl_reg_n_0_[3]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(3),
      O => \axi_rdata[3]_i_2_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[4]_i_2_n_0\,
      O => \axi_rdata[4]_i_1_n_0\
    );
\axi_rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(4),
      I1 => slv_reg3(4),
      I2 => \ctrl_reg_n_0_[4]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(4),
      O => \axi_rdata[4]_i_2_n_0\
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[5]_i_2_n_0\,
      O => \axi_rdata[5]_i_1_n_0\
    );
\axi_rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(5),
      I1 => slv_reg3(5),
      I2 => \ctrl_reg_n_0_[5]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(5),
      O => \axi_rdata[5]_i_2_n_0\
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[6]_i_2_n_0\,
      O => \axi_rdata[6]_i_1_n_0\
    );
\axi_rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(6),
      I1 => slv_reg3(6),
      I2 => \ctrl_reg_n_0_[6]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(6),
      O => \axi_rdata[6]_i_2_n_0\
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[7]_i_2_n_0\,
      O => \axi_rdata[7]_i_1_n_0\
    );
\axi_rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(7),
      I1 => slv_reg3(7),
      I2 => \ctrl_reg_n_0_[7]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(7),
      O => \axi_rdata[7]_i_2_n_0\
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[8]_i_2_n_0\,
      O => \axi_rdata[8]_i_1_n_0\
    );
\axi_rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(8),
      I1 => slv_reg3(8),
      I2 => \ctrl_reg_n_0_[8]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(8),
      O => \axi_rdata[8]_i_2_n_0\
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => axi_araddr(7),
      I1 => axi_araddr(4),
      I2 => axi_araddr(9),
      I3 => \axi_rdata[31]_i_2_n_0\,
      I4 => \axi_rdata[31]_i_3_n_0\,
      I5 => \axi_rdata[9]_i_2_n_0\,
      O => \axi_rdata[9]_i_1_n_0\
    );
\axi_rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3355000F3355FF0F"
    )
        port map (
      I0 => slv_reg2(9),
      I1 => slv_reg3(9),
      I2 => \ctrl_reg_n_0_[9]\,
      I3 => axi_araddr(2),
      I4 => axi_araddr(3),
      I5 => slv_reg1(9),
      O => \axi_rdata[9]_i_2_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[0]_i_1__0_n_0\,
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[10]_i_1_n_0\,
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[11]_i_1_n_0\,
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[12]_i_1_n_0\,
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[13]_i_1_n_0\,
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[14]_i_1_n_0\,
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[15]_i_1_n_0\,
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[16]_i_1_n_0\,
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[17]_i_1_n_0\,
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[18]_i_1_n_0\,
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[19]_i_1_n_0\,
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[1]_i_1_n_0\,
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[20]_i_1_n_0\,
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[21]_i_1_n_0\,
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[22]_i_1_n_0\,
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[23]_i_1_n_0\,
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[24]_i_1_n_0\,
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[25]_i_1_n_0\,
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[26]_i_1_n_0\,
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[27]_i_1_n_0\,
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[28]_i_1_n_0\,
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[29]_i_1_n_0\,
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[2]_i_1_n_0\,
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[30]_i_1_n_0\,
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[31]_i_1_n_0\,
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[3]_i_1_n_0\,
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[4]_i_1_n_0\,
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[5]_i_1_n_0\,
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[6]_i_1_n_0\,
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[7]_i_1_n_0\,
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[8]_i_1_n_0\,
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => \axi_rdata[9]_i_1_n_0\,
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => aw_en_reg_n_0,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => axi_awready_i_1_n_0
    );
colorData_reg: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 7) => p_1_in(9 downto 2),
      ADDRARDADDR(6 downto 5) => p_0_in_0(1 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 5) => curLed(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => NLW_colorData_reg_CASCADEOUTA_UNCONNECTED,
      CASCADEOUTB => NLW_colorData_reg_CASCADEOUTB_UNCONNECTED,
      CLKARDCLK => s00_axi_aclk,
      CLKBWRCLK => s00_axi_aclk,
      DBITERR => NLW_colorData_reg_DBITERR_UNCONNECTED,
      DIADI(31 downto 0) => s00_axi_wdata(31 downto 0),
      DIBDI(31 downto 0) => B"11111111111111111111111111111111",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => NLW_colorData_reg_DOADO_UNCONNECTED(31 downto 0),
      DOBDO(31 downto 24) => NLW_colorData_reg_DOBDO_UNCONNECTED(31 downto 24),
      DOBDO(23 downto 0) => curCol(23 downto 0),
      DOPADOP(3 downto 0) => NLW_colorData_reg_DOPADOP_UNCONNECTED(3 downto 0),
      DOPBDOP(3 downto 0) => NLW_colorData_reg_DOPBDOP_UNCONNECTED(3 downto 0),
      ECCPARITY(7 downto 0) => NLW_colorData_reg_ECCPARITY_UNCONNECTED(7 downto 0),
      ENARDEN => colorData_reg_i_1_n_0,
      ENBWREN => '1',
      INJECTDBITERR => NLW_colorData_reg_INJECTDBITERR_UNCONNECTED,
      INJECTSBITERR => NLW_colorData_reg_INJECTSBITERR_UNCONNECTED,
      RDADDRECC(8 downto 0) => NLW_colorData_reg_RDADDRECC_UNCONNECTED(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => nolabel_line452_n_10,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => NLW_colorData_reg_SBITERR_UNCONNECTED,
      WEA(3) => colorData,
      WEA(2) => colorData,
      WEA(1) => colorData,
      WEA(0) => colorData,
      WEBWE(7 downto 0) => B"00000000"
    );
colorData_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010101"
    )
        port map (
      I0 => p_0_in_0(10),
      I1 => p_0_in_0(11),
      I2 => p_0_in_0(12),
      I3 => colorData_reg_i_12_n_0,
      I4 => colorData_reg_i_13_n_0,
      O => colorData_reg_i_1_n_0
    );
colorData_reg_i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_0(2),
      O => p_1_in(2)
    );
colorData_reg_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => \^axi_wready_reg_0\,
      I2 => \^axi_awready_reg_0\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_wvalid,
      I5 => colorData_reg_i_18_n_0,
      O => colorData
    );
colorData_reg_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => p_0_in_0(4),
      I2 => p_0_in_0(3),
      O => colorData_reg_i_12_n_0
    );
colorData_reg_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_0_in_0(9),
      I1 => p_0_in_0(8),
      I2 => p_0_in_0(7),
      I3 => p_0_in_0(6),
      O => colorData_reg_i_13_n_0
    );
colorData_reg_i_17: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_0_in_0(2),
      I1 => p_0_in_0(3),
      I2 => p_0_in_0(4),
      O => colorData_reg_i_17_n_0
    );
colorData_reg_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => colorData_reg_i_19_n_0,
      I1 => p_0_in_0(2),
      I2 => p_0_in_0(3),
      I3 => p_0_in_0(4),
      I4 => p_0_in_0(11),
      I5 => p_0_in_0(10),
      O => colorData_reg_i_18_n_0
    );
colorData_reg_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_0_in_0(8),
      I1 => p_0_in_0(12),
      I2 => p_0_in_0(6),
      I3 => p_0_in_0(9),
      I4 => p_0_in_0(7),
      I5 => p_0_in_0(5),
      O => colorData_reg_i_19_n_0
    );
colorData_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => p_0_in_0(8),
      I1 => p_0_in_0(6),
      I2 => colorData_reg_i_17_n_0,
      I3 => p_0_in_0(5),
      I4 => p_0_in_0(7),
      I5 => p_0_in_0(9),
      O => p_1_in(9)
    );
colorData_reg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => p_0_in_0(8),
      I1 => p_0_in_0(6),
      I2 => colorData_reg_i_17_n_0,
      I3 => p_0_in_0(5),
      I4 => p_0_in_0(7),
      O => p_1_in(8)
    );
colorData_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA9"
    )
        port map (
      I0 => p_0_in_0(7),
      I1 => p_0_in_0(5),
      I2 => p_0_in_0(2),
      I3 => p_0_in_0(3),
      I4 => p_0_in_0(4),
      I5 => p_0_in_0(6),
      O => p_1_in(7)
    );
colorData_reg_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => p_0_in_0(2),
      I2 => p_0_in_0(3),
      I3 => p_0_in_0(4),
      I4 => p_0_in_0(6),
      O => p_1_in(6)
    );
colorData_reg_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => p_0_in_0(5),
      I1 => p_0_in_0(2),
      I2 => p_0_in_0(3),
      I3 => p_0_in_0(4),
      O => p_1_in(5)
    );
colorData_reg_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => p_0_in_0(4),
      I1 => p_0_in_0(3),
      I2 => p_0_in_0(2),
      O => p_1_in(4)
    );
colorData_reg_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_0_in_0(2),
      I1 => p_0_in_0(3),
      O => p_1_in(3)
    );
\ctrl[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(1),
      O => \ctrl[15]_i_1_n_0\
    );
\ctrl[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(2),
      O => \ctrl[23]_i_1_n_0\
    );
\ctrl[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(3),
      O => \ctrl[31]_i_1_n_0\
    );
\ctrl[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\ctrl[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(0),
      O => \ctrl[7]_i_1_n_0\
    );
\ctrl_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => ctrl(0),
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \ctrl_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \ctrl_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \ctrl_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \ctrl_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \ctrl_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \ctrl_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \ctrl_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \ctrl_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \ctrl_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \ctrl_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \ctrl_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \ctrl_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \ctrl_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \ctrl_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \ctrl_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \ctrl_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \ctrl_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \ctrl_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \ctrl_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \ctrl_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \ctrl_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \ctrl_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \ctrl_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \ctrl_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \ctrl_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \ctrl_reg_n_0_[4]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \ctrl_reg_n_0_[5]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \ctrl_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \ctrl_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \ctrl_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\ctrl_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \ctrl[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \ctrl_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
nolabel_line452: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader
     port map (
      DOBDO(23 downto 0) => curCol(23 downto 0),
      Q(0) => ctrl(0),
      \ctrl_reg[0]\ => nolabel_line452_n_10,
      \curLed_reg[9]_0\(9 downto 0) => curLed(9 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      ws2811data => ws2811data
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg1(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg1(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg1(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg1(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg1(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg1(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg1(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg1(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg1(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg1(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg1(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg1(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg1(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg1(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg1(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg1(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg1(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg1(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg1(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg1(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg1(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg1(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg1(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg1(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg1(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg1(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg1(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg1(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg1(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg1(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg1(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg1(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg2(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg2(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg2(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg2(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg2(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg2(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg2(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg2(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg2(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg2(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg2(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg2(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg2(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg2(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg2(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(1),
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(2),
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(3),
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => p_0_in_0(0),
      I1 => colorData_reg_i_18_n_0,
      I2 => \slv_reg_wren__0\,
      I3 => p_0_in_0(1),
      I4 => s00_axi_wstrb(0),
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => axi_awready_i_1_n_0
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^axi_arready_reg_0\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0 is
  port (
    s00_axi_wready : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_intr_wready : out STD_LOGIC;
    s_axi_intr_awready : out STD_LOGIC;
    s_axi_intr_arready : out STD_LOGIC;
    ws2811data : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s_axi_intr_rdata : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_intr_rvalid : out STD_LOGIC;
    irq : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s_axi_intr_bvalid : out STD_LOGIC;
    s_axi_intr_aresetn : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_intr_aclk : in STD_LOGIC;
    s_axi_intr_awaddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_intr_awvalid : in STD_LOGIC;
    s_axi_intr_wvalid : in STD_LOGIC;
    s_axi_intr_araddr : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_intr_arvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s_axi_intr_bready : in STD_LOGIC;
    s_axi_intr_rready : in STD_LOGIC;
    s_axi_intr_wdata : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0 is
begin
ws2811fader_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S00_AXI
     port map (
      axi_arready_reg_0 => s00_axi_arready,
      axi_awready_reg_0 => s00_axi_awready,
      axi_wready_reg_0 => s00_axi_wready,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(12 downto 0) => s00_axi_araddr(12 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(12 downto 0) => s00_axi_awaddr(12 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      ws2811data => ws2811data
    );
ws2811fader_v1_0_S_AXI_INTR_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0_S_AXI_INTR
     port map (
      axi_arready_reg_0 => s_axi_intr_arready,
      axi_awready_reg_0 => s_axi_intr_awready,
      axi_wready_reg_0 => s_axi_intr_wready,
      irq => irq,
      s_axi_intr_aclk => s_axi_intr_aclk,
      s_axi_intr_araddr(2 downto 0) => s_axi_intr_araddr(2 downto 0),
      s_axi_intr_aresetn => s_axi_intr_aresetn,
      s_axi_intr_arvalid => s_axi_intr_arvalid,
      s_axi_intr_awaddr(2 downto 0) => s_axi_intr_awaddr(2 downto 0),
      s_axi_intr_awvalid => s_axi_intr_awvalid,
      s_axi_intr_bready => s_axi_intr_bready,
      s_axi_intr_bvalid => s_axi_intr_bvalid,
      s_axi_intr_rdata(0) => s_axi_intr_rdata(0),
      s_axi_intr_rready => s_axi_intr_rready,
      s_axi_intr_rvalid => s_axi_intr_rvalid,
      s_axi_intr_wdata(0) => s_axi_intr_wdata(0),
      s_axi_intr_wvalid => s_axi_intr_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    ws2811data : out STD_LOGIC;
    irq : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s_axi_intr_awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_intr_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_intr_awvalid : in STD_LOGIC;
    s_axi_intr_awready : out STD_LOGIC;
    s_axi_intr_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_intr_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_intr_wvalid : in STD_LOGIC;
    s_axi_intr_wready : out STD_LOGIC;
    s_axi_intr_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_intr_bvalid : out STD_LOGIC;
    s_axi_intr_bready : in STD_LOGIC;
    s_axi_intr_araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_intr_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_intr_arvalid : in STD_LOGIC;
    s_axi_intr_arready : out STD_LOGIC;
    s_axi_intr_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_intr_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_intr_rvalid : out STD_LOGIC;
    s_axi_intr_rready : in STD_LOGIC;
    s_axi_intr_aclk : in STD_LOGIC;
    s_axi_intr_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "LEDcpu_ws2811fader_0_1,ws2811fader_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "ws2811fader_v1_0,Vivado 2018.3";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_intr_rdata\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of irq : signal is "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of irq : signal is "XIL_INTERFACENAME IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s_axi_intr_aclk : signal is "xilinx.com:signal:clock:1.0 S_AXI_INTR_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s_axi_intr_aclk : signal is "XIL_INTERFACENAME S_AXI_INTR_CLK, ASSOCIATED_BUSIF S_AXI_INTR, ASSOCIATED_RESET s_axi_intr_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_intr_aresetn : signal is "xilinx.com:signal:reset:1.0 S_AXI_INTR_RST RST";
  attribute X_INTERFACE_PARAMETER of s_axi_intr_aresetn : signal is "XIL_INTERFACENAME S_AXI_INTR_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_intr_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARREADY";
  attribute X_INTERFACE_INFO of s_axi_intr_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARVALID";
  attribute X_INTERFACE_INFO of s_axi_intr_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWREADY";
  attribute X_INTERFACE_INFO of s_axi_intr_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWVALID";
  attribute X_INTERFACE_INFO of s_axi_intr_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR BREADY";
  attribute X_INTERFACE_INFO of s_axi_intr_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR BVALID";
  attribute X_INTERFACE_INFO of s_axi_intr_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_intr_rready : signal is "XIL_INTERFACENAME S_AXI_INTR, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 5, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN LEDcpu_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_intr_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR RVALID";
  attribute X_INTERFACE_INFO of s_axi_intr_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR WREADY";
  attribute X_INTERFACE_INFO of s_axi_intr_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
  attribute X_INTERFACE_INFO of s_axi_intr_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARADDR";
  attribute X_INTERFACE_INFO of s_axi_intr_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR ARPROT";
  attribute X_INTERFACE_INFO of s_axi_intr_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWADDR";
  attribute X_INTERFACE_INFO of s_axi_intr_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR AWPROT";
  attribute X_INTERFACE_INFO of s_axi_intr_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR BRESP";
  attribute X_INTERFACE_INFO of s_axi_intr_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR RDATA";
  attribute X_INTERFACE_INFO of s_axi_intr_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR RRESP";
  attribute X_INTERFACE_INFO of s_axi_intr_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR WDATA";
  attribute X_INTERFACE_INFO of s_axi_intr_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI_INTR WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
  s_axi_intr_bresp(1) <= \<const0>\;
  s_axi_intr_bresp(0) <= \<const0>\;
  s_axi_intr_rdata(31) <= \<const0>\;
  s_axi_intr_rdata(30) <= \<const0>\;
  s_axi_intr_rdata(29) <= \<const0>\;
  s_axi_intr_rdata(28) <= \<const0>\;
  s_axi_intr_rdata(27) <= \<const0>\;
  s_axi_intr_rdata(26) <= \<const0>\;
  s_axi_intr_rdata(25) <= \<const0>\;
  s_axi_intr_rdata(24) <= \<const0>\;
  s_axi_intr_rdata(23) <= \<const0>\;
  s_axi_intr_rdata(22) <= \<const0>\;
  s_axi_intr_rdata(21) <= \<const0>\;
  s_axi_intr_rdata(20) <= \<const0>\;
  s_axi_intr_rdata(19) <= \<const0>\;
  s_axi_intr_rdata(18) <= \<const0>\;
  s_axi_intr_rdata(17) <= \<const0>\;
  s_axi_intr_rdata(16) <= \<const0>\;
  s_axi_intr_rdata(15) <= \<const0>\;
  s_axi_intr_rdata(14) <= \<const0>\;
  s_axi_intr_rdata(13) <= \<const0>\;
  s_axi_intr_rdata(12) <= \<const0>\;
  s_axi_intr_rdata(11) <= \<const0>\;
  s_axi_intr_rdata(10) <= \<const0>\;
  s_axi_intr_rdata(9) <= \<const0>\;
  s_axi_intr_rdata(8) <= \<const0>\;
  s_axi_intr_rdata(7) <= \<const0>\;
  s_axi_intr_rdata(6) <= \<const0>\;
  s_axi_intr_rdata(5) <= \<const0>\;
  s_axi_intr_rdata(4) <= \<const0>\;
  s_axi_intr_rdata(3) <= \<const0>\;
  s_axi_intr_rdata(2) <= \<const0>\;
  s_axi_intr_rdata(1) <= \<const0>\;
  s_axi_intr_rdata(0) <= \^s_axi_intr_rdata\(0);
  s_axi_intr_rresp(1) <= \<const0>\;
  s_axi_intr_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ws2811fader_v1_0
     port map (
      irq => irq,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(12 downto 0) => s00_axi_araddr(14 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(12 downto 0) => s00_axi_awaddr(14 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      s_axi_intr_aclk => s_axi_intr_aclk,
      s_axi_intr_araddr(2 downto 0) => s_axi_intr_araddr(4 downto 2),
      s_axi_intr_aresetn => s_axi_intr_aresetn,
      s_axi_intr_arready => s_axi_intr_arready,
      s_axi_intr_arvalid => s_axi_intr_arvalid,
      s_axi_intr_awaddr(2 downto 0) => s_axi_intr_awaddr(4 downto 2),
      s_axi_intr_awready => s_axi_intr_awready,
      s_axi_intr_awvalid => s_axi_intr_awvalid,
      s_axi_intr_bready => s_axi_intr_bready,
      s_axi_intr_bvalid => s_axi_intr_bvalid,
      s_axi_intr_rdata(0) => \^s_axi_intr_rdata\(0),
      s_axi_intr_rready => s_axi_intr_rready,
      s_axi_intr_rvalid => s_axi_intr_rvalid,
      s_axi_intr_wdata(0) => s_axi_intr_wdata(0),
      s_axi_intr_wready => s_axi_intr_wready,
      s_axi_intr_wvalid => s_axi_intr_wvalid,
      ws2811data => ws2811data
    );
end STRUCTURE;
