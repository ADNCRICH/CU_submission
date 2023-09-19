-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Tue Sep 19 12:54:31 2023
-- Host        : PHUMIPAT-C running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Calculator_CalculatorDisplayer_0_0_sim_netlist.vhdl
-- Design      : Calculator_CalculatorDisplayer_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider is
  port (
    CLK : out STD_LOGIC;
    clock : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider is
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 18 to 18 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \counter_reg_n_0_[9]\ : STD_LOGIC;
  signal cout_i_1_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
begin
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[0]_i_1_n_7\,
      Q => \counter_reg_n_0_[0]\,
      R => '0'
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[3]\,
      S(2) => \counter_reg_n_0_[2]\,
      S(1) => \counter_reg_n_0_[1]\,
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[8]_i_1_n_5\,
      Q => \counter_reg_n_0_[10]\,
      R => '0'
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[8]_i_1_n_4\,
      Q => \counter_reg_n_0_[11]\,
      R => '0'
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[12]_i_1_n_7\,
      Q => \counter_reg_n_0_[12]\,
      R => '0'
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[15]\,
      S(2) => \counter_reg_n_0_[14]\,
      S(1) => \counter_reg_n_0_[13]\,
      S(0) => \counter_reg_n_0_[12]\
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[12]_i_1_n_6\,
      Q => \counter_reg_n_0_[13]\,
      R => '0'
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[12]_i_1_n_5\,
      Q => \counter_reg_n_0_[14]\,
      R => '0'
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[12]_i_1_n_4\,
      Q => \counter_reg_n_0_[15]\,
      R => '0'
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[16]_i_1_n_7\,
      Q => \counter_reg_n_0_[16]\,
      R => '0'
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3 downto 2) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3) => '0',
      S(2) => counter_reg(18),
      S(1) => \counter_reg_n_0_[17]\,
      S(0) => \counter_reg_n_0_[16]\
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[16]_i_1_n_6\,
      Q => \counter_reg_n_0_[17]\,
      R => '0'
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[0]_i_1_n_6\,
      Q => \counter_reg_n_0_[1]\,
      R => '0'
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[0]_i_1_n_5\,
      Q => \counter_reg_n_0_[2]\,
      R => '0'
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[0]_i_1_n_4\,
      Q => \counter_reg_n_0_[3]\,
      R => '0'
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[4]_i_1_n_7\,
      Q => \counter_reg_n_0_[4]\,
      R => '0'
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[7]\,
      S(2) => \counter_reg_n_0_[6]\,
      S(1) => \counter_reg_n_0_[5]\,
      S(0) => \counter_reg_n_0_[4]\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[4]_i_1_n_6\,
      Q => \counter_reg_n_0_[5]\,
      R => '0'
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[4]_i_1_n_5\,
      Q => \counter_reg_n_0_[6]\,
      R => '0'
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[4]_i_1_n_4\,
      Q => \counter_reg_n_0_[7]\,
      R => '0'
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[8]_i_1_n_7\,
      Q => \counter_reg_n_0_[8]\,
      R => '0'
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[11]\,
      S(2) => \counter_reg_n_0_[10]\,
      S(1) => \counter_reg_n_0_[9]\,
      S(0) => \counter_reg_n_0_[8]\
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => \counter_reg[8]_i_1_n_6\,
      Q => \counter_reg_n_0_[9]\,
      R => '0'
    );
cout_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(18),
      O => cout_i_1_n_0
    );
cout_reg: unisim.vcomponents.FDRE
     port map (
      C => clock,
      CE => '1',
      D => cout_i_1_n_0,
      Q => CLK,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM is
  port (
    DOADO : out STD_LOGIC_VECTOR ( 12 downto 0 );
    clock : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM is
  signal NLW_outData_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 13 );
  signal NLW_outData_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_outData_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_outData_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of outData_reg : label is "p0_d13";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of outData_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of outData_reg : label is 13312;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of outData_reg : label is "inst/DataROM/outData_reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of outData_reg : label is "RAM_SP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of outData_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of outData_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of outData_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of outData_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of outData_reg : label is 12;
begin
outData_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"1000100018031003100010001802100210001000180110011000100010001000",
      INIT_01 => X"1000100018071007100010001806100610001000180510051000100018041004",
      INIT_02 => X"1000100018111011100010001810101010001000180910091000100018081008",
      INIT_03 => X"1000100018151015100010001814101410001000181310131000100018121012",
      INIT_04 => X"1000100318021004100010021801100310011001100010021000100010011001",
      INIT_05 => X"1000100718061008100010061805100710001005180410061000100418031005",
      INIT_06 => X"1000101118101012100010101809101110001009180810101000100818071009",
      INIT_07 => X"1000101518141016100010141813101510001013181210141000101218111013",
      INIT_08 => X"1000100618011005100110041000100410021002100110031000100010021002",
      INIT_09 => X"1000101418051009100010121804100810001010180310071000100818021006",
      INIT_0A => X"1000102218091013100010201808101210001018180710111000101618061010",
      INIT_0B => X"1000103018131017100010281812101610001026181110151000102418101014",
      INIT_0C => X"1001100910001006100110061001100510031003100210041000100010031003",
      INIT_0D => X"1000102118041010100010181803100910001015180210081000101218011007",
      INIT_0E => X"1000103318081014100010301807101310001027180610121000102418051011",
      INIT_0F => X"1000104518121018100010421811101710001039181010161000103618091015",
      INIT_10 => X"1001101210011007100210081002100610041004100310051000100010041004",
      INIT_11 => X"1000102818031011100010241802101010001020180110091001101610001008",
      INIT_12 => X"1000104418071015100010401806101410001036180510131000103218041012",
      INIT_13 => X"1000106018111019100010561810101810001052180910171000104818081016",
      INIT_14 => X"1001101510021008100210101003100710051005100410061000100010051005",
      INIT_15 => X"1000103518021012100010301801101110011025100010101001102010011009",
      INIT_16 => X"1000105518061016100010501805101510001045180410141000104018031013",
      INIT_17 => X"1000107518101020100010701809101910001065180810181000106018071017",
      INIT_18 => X"1002101810031009100310121004100810061006100510071000100010061006",
      INIT_19 => X"1000104218011013100110361000101210011030100110111001102410021010",
      INIT_1A => X"1000106618051017100010601804101610001054180310151000104818021014",
      INIT_1B => X"1000109018091021100010841808102010001078180710191000107218061018",
      INIT_1C => X"1002102110041010100310141005100910071007100610081000100010071007",
      INIT_1D => X"1001104910001014100110421001101310011035100210121001102810031011",
      INIT_1E => X"1000107718041018100010701803101710001063180210161000105618011015",
      INIT_1F => X"1000110518081022100010981807102110001091180610201000108418051019",
      INIT_20 => X"1002102410051011100410161006101010081008100710091000100010081008",
      INIT_21 => X"1001105610011015100110481002101410011040100310131002103210041012",
      INIT_22 => X"1000108818031019100010801802101810001072180110171001106410001016",
      INIT_23 => X"1000112018071023100011121806102210001104180510211000109618041020",
      INIT_24 => X"1003102710061012100410181007101110091009100810101000100010091009",
      INIT_25 => X"1001106310021016100110541003101510011045100410141002103610051013",
      INIT_26 => X"1000109918021020100010901801101910011081100010181001107210011017",
      INIT_27 => X"1000113518061024100011261805102310001117180410221000110818031021",
      INIT_28 => X"1003103010071013100510201008101210101010100910111000100010101010",
      INIT_29 => X"1001107010031017100110601004101610021050100510151002104010061014",
      INIT_2A => X"1000111018011021100111001000102010011090100110191001108010021018",
      INIT_2B => X"1000115018051025100011401804102410001130180310231000112018021022",
      INIT_2C => X"1003103310081014100510221009101310111011101010121000100010111011",
      INIT_2D => X"1001107710041018100110661005101710021055100610161002104410071015",
      INIT_2E => X"1001112110001022100111101001102110011099100210201001108810031019",
      INIT_2F => X"1000116518041026100011541803102510001143180210241000113218011023",
      INIT_30 => X"1004103610091015100610241010101410121012101110131000100010121012",
      INIT_31 => X"1001108410051019100210721006101810021060100710171003104810081016",
      INIT_32 => X"1001113210011023100111201002102210011108100310211001109610041020",
      INIT_33 => X"1000118018031027100011681802102610001156180110251001114410001024",
      INIT_34 => X"1004103910101016100610261011101510131013101210141000100010131013",
      INIT_35 => X"1001109110061020100210781007101910021065100810181003105210091017",
      INIT_36 => X"1001114310021024100111301003102310011117100410221001110410051021",
      INIT_37 => X"1000119518021028100011821801102710011169100010261001115610011025",
      INIT_38 => X"1004104210111017100710281012101610141014101310151000100010141014",
      INIT_39 => X"1002109810071021100210841008102010021070100910191003105610101018",
      INIT_3A => X"1001115410031025100111401004102410011126100510231001111210061022",
      INIT_3B => X"1000121018011029100111961000102810011182100110271001116810021026",
      INIT_3C => X"1005104510121018100710301013101710151015101410161000100010151015",
      INIT_3D => X"1002110510081022100210901009102110031075101010201003106010111019",
      INIT_3E => X"1001116510041026100111501005102510011135100610241001112010071023",
      INIT_3F => X"1001122510001030100112101001102910011195100210281001118010031027",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13 downto 4) => Q(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => clock,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"0001111111111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 13) => NLW_outData_reg_DOADO_UNCONNECTED(15 downto 13),
      DOADO(12 downto 0) => DOADO(12 downto 0),
      DOBDO(15 downto 0) => NLW_outData_reg_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_outData_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_outData_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder is
  port (
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \seg[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \seg[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \seg[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \seg[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \seg[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \seg[5]_INST_0\ : label is "soft_lutpair2";
begin
\seg[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A894"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => seg(0)
    );
\seg[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A4C8"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      O => seg(1)
    );
\seg[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A210"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      O => seg(2)
    );
\seg[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CA14"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => seg(3)
    );
\seg[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D790"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      O => seg(4)
    );
\seg[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D990"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      O => seg(5)
    );
\seg[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6025"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => seg(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer is
  port (
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clock : in STD_LOGIC;
    btnR : in STD_LOGIC;
    btnD : in STD_LOGIC;
    btnL : in STD_LOGIC;
    btnU : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer is
  signal HEX : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \HEX[0]_i_1_n_0\ : STD_LOGIC;
  signal \HEX[1]_i_1_n_0\ : STD_LOGIC;
  signal \HEX[2]_i_1_n_0\ : STD_LOGIC;
  signal \HEX[3]_i_1_n_0\ : STD_LOGIC;
  signal \^address\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal address_n_0 : STD_LOGIC;
  signal \address_reg_n_0_[0]\ : STD_LOGIC;
  signal \address_reg_n_0_[1]\ : STD_LOGIC;
  signal \address_reg_n_0_[2]\ : STD_LOGIC;
  signal \address_reg_n_0_[3]\ : STD_LOGIC;
  signal \address_reg_n_0_[4]\ : STD_LOGIC;
  signal \address_reg_n_0_[5]\ : STD_LOGIC;
  signal \address_reg_n_0_[6]\ : STD_LOGIC;
  signal \address_reg_n_0_[7]\ : STD_LOGIC;
  signal \address_reg_n_0_[8]\ : STD_LOGIC;
  signal \address_reg_n_0_[9]\ : STD_LOGIC;
  signal \an[0]_i_1_n_0\ : STD_LOGIC;
  signal \an[1]_i_1_n_0\ : STD_LOGIC;
  signal \an[2]_i_1_n_0\ : STD_LOGIC;
  signal \an[3]_i_1_n_0\ : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[1]_i_1_n_0\ : STD_LOGIC;
  signal cout : STD_LOGIC;
  signal inp : STD_LOGIC_VECTOR ( 13 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \address[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \address[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \address[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \address[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \an[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \an[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \an[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \an[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair5";
begin
DataROM: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM
     port map (
      DOADO(12 downto 11) => inp(13 downto 12),
      DOADO(10 downto 0) => inp(10 downto 0),
      Q(9) => \address_reg_n_0_[9]\,
      Q(8) => \address_reg_n_0_[8]\,
      Q(7) => \address_reg_n_0_[7]\,
      Q(6) => \address_reg_n_0_[6]\,
      Q(5) => \address_reg_n_0_[5]\,
      Q(4) => \address_reg_n_0_[4]\,
      Q(3) => \address_reg_n_0_[3]\,
      Q(2) => \address_reg_n_0_[2]\,
      Q(1) => \address_reg_n_0_[1]\,
      Q(0) => \address_reg_n_0_[0]\,
      clock => clock
    );
\HEX[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inp(4),
      I1 => inp(0),
      I2 => inp(12),
      I3 => counter(1),
      I4 => counter(0),
      I5 => inp(8),
      O => \HEX[0]_i_1_n_0\
    );
\HEX[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inp(5),
      I1 => inp(1),
      I2 => inp(13),
      I3 => counter(1),
      I4 => counter(0),
      I5 => inp(9),
      O => \HEX[1]_i_1_n_0\
    );
\HEX[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inp(6),
      I1 => inp(2),
      I2 => inp(13),
      I3 => counter(1),
      I4 => counter(0),
      I5 => inp(10),
      O => \HEX[2]_i_1_n_0\
    );
\HEX[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => inp(7),
      I1 => inp(3),
      I2 => inp(13),
      I3 => counter(1),
      I4 => counter(0),
      I5 => inp(10),
      O => \HEX[3]_i_1_n_0\
    );
\HEX_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \HEX[0]_i_1_n_0\,
      Q => HEX(0),
      R => '0'
    );
\HEX_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \HEX[1]_i_1_n_0\,
      Q => HEX(1),
      R => '0'
    );
\HEX_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \HEX[2]_i_1_n_0\,
      Q => HEX(2),
      R => '0'
    );
\HEX_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \HEX[3]_i_1_n_0\,
      Q => HEX(3),
      R => '0'
    );
address: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0116"
    )
        port map (
      I0 => btnR,
      I1 => btnD,
      I2 => btnL,
      I3 => btnU,
      O => address_n_0
    );
\address[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => btnR,
      I1 => btnL,
      O => \^address\(0)
    );
\address[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => btnR,
      I1 => btnD,
      O => \^address\(1)
    );
\address[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(0),
      I4 => btnU,
      O => \^address\(2)
    );
\address[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(1),
      I4 => btnU,
      O => \^address\(3)
    );
\address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(2),
      I4 => btnU,
      O => \^address\(4)
    );
\address[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(3),
      I4 => btnU,
      O => \^address\(5)
    );
\address[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(4),
      I4 => btnU,
      O => \^address\(6)
    );
\address[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(5),
      I4 => btnU,
      O => \^address\(7)
    );
\address[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(6),
      I4 => btnU,
      O => \^address\(8)
    );
\address[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00FE00"
    )
        port map (
      I0 => btnD,
      I1 => btnL,
      I2 => btnR,
      I3 => sw(7),
      I4 => btnU,
      O => \^address\(9)
    );
\address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(0),
      Q => \address_reg_n_0_[0]\,
      R => '0'
    );
\address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(1),
      Q => \address_reg_n_0_[1]\,
      R => '0'
    );
\address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(2),
      Q => \address_reg_n_0_[2]\,
      R => '0'
    );
\address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(3),
      Q => \address_reg_n_0_[3]\,
      R => '0'
    );
\address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(4),
      Q => \address_reg_n_0_[4]\,
      R => '0'
    );
\address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(5),
      Q => \address_reg_n_0_[5]\,
      R => '0'
    );
\address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(6),
      Q => \address_reg_n_0_[6]\,
      R => '0'
    );
\address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(7),
      Q => \address_reg_n_0_[7]\,
      R => '0'
    );
\address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(8),
      Q => \address_reg_n_0_[8]\,
      R => '0'
    );
\address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clock,
      CE => address_n_0,
      D => \^address\(9),
      Q => \address_reg_n_0_[9]\,
      R => '0'
    );
\an[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \an[0]_i_1_n_0\
    );
\an[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \an[1]_i_1_n_0\
    );
\an[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      O => \an[2]_i_1_n_0\
    );
\an[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      O => \an[3]_i_1_n_0\
    );
\an_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \an[0]_i_1_n_0\,
      Q => an(0),
      R => '0'
    );
\an_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \an[1]_i_1_n_0\,
      Q => an(1),
      R => '0'
    );
\an_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \an[2]_i_1_n_0\,
      Q => an(2),
      R => '0'
    );
\an_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \an[3]_i_1_n_0\,
      Q => an(3),
      R => '0'
    );
cd: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider
     port map (
      CLK => cout,
      clock => clock
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => \counter[0]_i_1_n_0\
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      O => \counter[1]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \counter[0]_i_1_n_0\,
      Q => counter(0),
      R => '0'
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => cout,
      CE => '1',
      D => \counter[1]_i_1_n_0\,
      Q => counter(1),
      R => '0'
    );
ss: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder
     port map (
      Q(3 downto 0) => HEX(3 downto 0),
      seg(6 downto 0) => seg(6 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 7 downto 0 );
    btnU : in STD_LOGIC;
    btnL : in STD_LOGIC;
    btnD : in STD_LOGIC;
    btnR : in STD_LOGIC;
    clock : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "Calculator_CalculatorDisplayer_0_0,CalculatorDisplayer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "CalculatorDisplayer,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clock : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clock : signal is "XIL_INTERFACENAME clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Calculator_clock_0, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer
     port map (
      an(3 downto 0) => an(3 downto 0),
      btnD => btnD,
      btnL => btnL,
      btnR => btnR,
      btnU => btnU,
      clock => clock,
      seg(6 downto 0) => seg(6 downto 0),
      sw(7 downto 0) => sw(7 downto 0)
    );
end STRUCTURE;
