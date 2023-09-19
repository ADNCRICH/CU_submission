// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Tue Sep 19 12:54:31 2023
// Host        : PHUMIPAT-C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Calculator_CalculatorDisplayer_0_0_sim_netlist.v
// Design      : Calculator_CalculatorDisplayer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer
   (seg,
    an,
    clock,
    btnR,
    btnD,
    btnL,
    btnU,
    sw);
  output [6:0]seg;
  output [3:0]an;
  input clock;
  input btnR;
  input btnD;
  input btnL;
  input btnU;
  input [7:0]sw;

  wire [3:0]HEX;
  wire \HEX[0]_i_1_n_0 ;
  wire \HEX[1]_i_1_n_0 ;
  wire \HEX[2]_i_1_n_0 ;
  wire \HEX[3]_i_1_n_0 ;
  wire [9:0]\^address ;
  wire address_n_0;
  wire \address_reg_n_0_[0] ;
  wire \address_reg_n_0_[1] ;
  wire \address_reg_n_0_[2] ;
  wire \address_reg_n_0_[3] ;
  wire \address_reg_n_0_[4] ;
  wire \address_reg_n_0_[5] ;
  wire \address_reg_n_0_[6] ;
  wire \address_reg_n_0_[7] ;
  wire \address_reg_n_0_[8] ;
  wire \address_reg_n_0_[9] ;
  wire [3:0]an;
  wire \an[0]_i_1_n_0 ;
  wire \an[1]_i_1_n_0 ;
  wire \an[2]_i_1_n_0 ;
  wire \an[3]_i_1_n_0 ;
  wire btnD;
  wire btnL;
  wire btnR;
  wire btnU;
  wire clock;
  wire [1:0]counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire cout;
  wire [13:0]inp;
  wire [6:0]seg;
  wire [7:0]sw;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM DataROM
       (.DOADO({inp[13:12],inp[10:0]}),
        .Q({\address_reg_n_0_[9] ,\address_reg_n_0_[8] ,\address_reg_n_0_[7] ,\address_reg_n_0_[6] ,\address_reg_n_0_[5] ,\address_reg_n_0_[4] ,\address_reg_n_0_[3] ,\address_reg_n_0_[2] ,\address_reg_n_0_[1] ,\address_reg_n_0_[0] }),
        .clock(clock));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \HEX[0]_i_1 
       (.I0(inp[4]),
        .I1(inp[0]),
        .I2(inp[12]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(inp[8]),
        .O(\HEX[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \HEX[1]_i_1 
       (.I0(inp[5]),
        .I1(inp[1]),
        .I2(inp[13]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(inp[9]),
        .O(\HEX[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \HEX[2]_i_1 
       (.I0(inp[6]),
        .I1(inp[2]),
        .I2(inp[13]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(inp[10]),
        .O(\HEX[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \HEX[3]_i_1 
       (.I0(inp[7]),
        .I1(inp[3]),
        .I2(inp[13]),
        .I3(counter[1]),
        .I4(counter[0]),
        .I5(inp[10]),
        .O(\HEX[3]_i_1_n_0 ));
  FDRE \HEX_reg[0] 
       (.C(cout),
        .CE(1'b1),
        .D(\HEX[0]_i_1_n_0 ),
        .Q(HEX[0]),
        .R(1'b0));
  FDRE \HEX_reg[1] 
       (.C(cout),
        .CE(1'b1),
        .D(\HEX[1]_i_1_n_0 ),
        .Q(HEX[1]),
        .R(1'b0));
  FDRE \HEX_reg[2] 
       (.C(cout),
        .CE(1'b1),
        .D(\HEX[2]_i_1_n_0 ),
        .Q(HEX[2]),
        .R(1'b0));
  FDRE \HEX_reg[3] 
       (.C(cout),
        .CE(1'b1),
        .D(\HEX[3]_i_1_n_0 ),
        .Q(HEX[3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0116)) 
    address
       (.I0(btnR),
        .I1(btnD),
        .I2(btnL),
        .I3(btnU),
        .O(address_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[0]_i_1 
       (.I0(btnR),
        .I1(btnL),
        .O(\^address [0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[1]_i_1 
       (.I0(btnR),
        .I1(btnD),
        .O(\^address [1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[2]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[0]),
        .I4(btnU),
        .O(\^address [2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[3]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[1]),
        .I4(btnU),
        .O(\^address [3]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[4]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[2]),
        .I4(btnU),
        .O(\^address [4]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[5]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[3]),
        .I4(btnU),
        .O(\^address [5]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[6]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[4]),
        .I4(btnU),
        .O(\^address [6]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[7]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[5]),
        .I4(btnU),
        .O(\^address [7]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[8]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[6]),
        .I4(btnU),
        .O(\^address [8]));
  LUT5 #(
    .INIT(32'hFF00FE00)) 
    \address[9]_i_1 
       (.I0(btnD),
        .I1(btnL),
        .I2(btnR),
        .I3(sw[7]),
        .I4(btnU),
        .O(\^address [9]));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [0]),
        .Q(\address_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [1]),
        .Q(\address_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [2]),
        .Q(\address_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [3]),
        .Q(\address_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [4]),
        .Q(\address_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [5]),
        .Q(\address_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [6]),
        .Q(\address_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [7]),
        .Q(\address_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[8] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [8]),
        .Q(\address_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[9] 
       (.C(clock),
        .CE(address_n_0),
        .D(\^address [9]),
        .Q(\address_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an[0]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\an[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[1]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\an[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an[2]_i_1 
       (.I0(counter[0]),
        .I1(counter[1]),
        .O(\an[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an[3]_i_1 
       (.I0(counter[1]),
        .I1(counter[0]),
        .O(\an[3]_i_1_n_0 ));
  FDRE \an_reg[0] 
       (.C(cout),
        .CE(1'b1),
        .D(\an[0]_i_1_n_0 ),
        .Q(an[0]),
        .R(1'b0));
  FDRE \an_reg[1] 
       (.C(cout),
        .CE(1'b1),
        .D(\an[1]_i_1_n_0 ),
        .Q(an[1]),
        .R(1'b0));
  FDRE \an_reg[2] 
       (.C(cout),
        .CE(1'b1),
        .D(\an[2]_i_1_n_0 ),
        .Q(an[2]),
        .R(1'b0));
  FDRE \an_reg[3] 
       (.C(cout),
        .CE(1'b1),
        .D(\an[3]_i_1_n_0 ),
        .Q(an[3]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider cd
       (.CLK(cout),
        .clock(clock));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter[1]_i_1 
       (.I0(counter[0]),
        .I1(counter[1]),
        .O(\counter[1]_i_1_n_0 ));
  FDRE \counter_reg[0] 
       (.C(cout),
        .CE(1'b1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter[0]),
        .R(1'b0));
  FDRE \counter_reg[1] 
       (.C(cout),
        .CE(1'b1),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter[1]),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder ss
       (.Q(HEX),
        .seg(seg));
endmodule

(* CHECK_LICENSE_TYPE = "Calculator_CalculatorDisplayer_0_0,CalculatorDisplayer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "CalculatorDisplayer,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (seg,
    an,
    sw,
    btnU,
    btnL,
    btnD,
    btnR,
    clock);
  output [6:0]seg;
  output [3:0]an;
  input [7:0]sw;
  input btnU;
  input btnL;
  input btnD;
  input btnR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Calculator_clock_0, INSERT_VIP 0" *) input clock;

  wire [3:0]an;
  wire btnD;
  wire btnL;
  wire btnR;
  wire btnU;
  wire clock;
  wire [6:0]seg;
  wire [7:0]sw;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_CalculatorDisplayer inst
       (.an(an),
        .btnD(btnD),
        .btnL(btnL),
        .btnR(btnR),
        .btnU(btnU),
        .clock(clock),
        .seg(seg),
        .sw(sw));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ClockDivider
   (CLK,
    clock);
  output CLK;
  input clock;

  wire CLK;
  wire clock;
  wire \counter[0]_i_2_n_0 ;
  wire [18:18]counter_reg;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_1 ;
  wire \counter_reg[0]_i_1_n_2 ;
  wire \counter_reg[0]_i_1_n_3 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[10] ;
  wire \counter_reg_n_0_[11] ;
  wire \counter_reg_n_0_[12] ;
  wire \counter_reg_n_0_[13] ;
  wire \counter_reg_n_0_[14] ;
  wire \counter_reg_n_0_[15] ;
  wire \counter_reg_n_0_[16] ;
  wire \counter_reg_n_0_[17] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire cout_i_1_n_0;
  wire [3:2]\NLW_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_counter_reg[16]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_2 
       (.I0(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_2_n_0 ));
  FDRE \counter_reg[0] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\counter_reg[0]_i_1_n_1 ,\counter_reg[0]_i_1_n_2 ,\counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] ,\counter[0]_i_2_n_0 }));
  FDRE \counter_reg[10] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \counter_reg[11] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \counter_reg[12] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[12] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S({\counter_reg_n_0_[15] ,\counter_reg_n_0_[14] ,\counter_reg_n_0_[13] ,\counter_reg_n_0_[12] }));
  FDRE \counter_reg[13] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \counter_reg[14] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \counter_reg[15] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \counter_reg[16] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[16] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_counter_reg[16]_i_1_CO_UNCONNECTED [3:2],\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[16]_i_1_O_UNCONNECTED [3],\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S({1'b0,counter_reg,\counter_reg_n_0_[17] ,\counter_reg_n_0_[16] }));
  FDRE \counter_reg[17] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \counter_reg[18] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg),
        .R(1'b0));
  FDRE \counter_reg[1] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \counter_reg[2] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \counter_reg[3] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \counter_reg[4] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({\counter_reg_n_0_[7] ,\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] ,\counter_reg_n_0_[4] }));
  FDRE \counter_reg[5] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \counter_reg[6] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \counter_reg[7] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \counter_reg[8] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[8] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S({\counter_reg_n_0_[11] ,\counter_reg_n_0_[10] ,\counter_reg_n_0_[9] ,\counter_reg_n_0_[8] }));
  FDRE \counter_reg[9] 
       (.C(clock),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[9] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    cout_i_1
       (.I0(counter_reg),
        .O(cout_i_1_n_0));
  FDRE cout_reg
       (.C(clock),
        .CE(1'b1),
        .D(cout_i_1_n_0),
        .Q(CLK),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ROMM
   (DOADO,
    clock,
    Q);
  output [12:0]DOADO;
  input clock;
  input [9:0]Q;

  wire [12:0]DOADO;
  wire [9:0]Q;
  wire clock;
  wire [15:13]NLW_outData_reg_DOADO_UNCONNECTED;
  wire [15:0]NLW_outData_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_outData_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_outData_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d13" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "13312" *) 
  (* RTL_RAM_NAME = "inst/DataROM/outData_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "12" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h1000100018031003100010001802100210001000180110011000100010001000),
    .INIT_01(256'h1000100018071007100010001806100610001000180510051000100018041004),
    .INIT_02(256'h1000100018111011100010001810101010001000180910091000100018081008),
    .INIT_03(256'h1000100018151015100010001814101410001000181310131000100018121012),
    .INIT_04(256'h1000100318021004100010021801100310011001100010021000100010011001),
    .INIT_05(256'h1000100718061008100010061805100710001005180410061000100418031005),
    .INIT_06(256'h1000101118101012100010101809101110001009180810101000100818071009),
    .INIT_07(256'h1000101518141016100010141813101510001013181210141000101218111013),
    .INIT_08(256'h1000100618011005100110041000100410021002100110031000100010021002),
    .INIT_09(256'h1000101418051009100010121804100810001010180310071000100818021006),
    .INIT_0A(256'h1000102218091013100010201808101210001018180710111000101618061010),
    .INIT_0B(256'h1000103018131017100010281812101610001026181110151000102418101014),
    .INIT_0C(256'h1001100910001006100110061001100510031003100210041000100010031003),
    .INIT_0D(256'h1000102118041010100010181803100910001015180210081000101218011007),
    .INIT_0E(256'h1000103318081014100010301807101310001027180610121000102418051011),
    .INIT_0F(256'h1000104518121018100010421811101710001039181010161000103618091015),
    .INIT_10(256'h1001101210011007100210081002100610041004100310051000100010041004),
    .INIT_11(256'h1000102818031011100010241802101010001020180110091001101610001008),
    .INIT_12(256'h1000104418071015100010401806101410001036180510131000103218041012),
    .INIT_13(256'h1000106018111019100010561810101810001052180910171000104818081016),
    .INIT_14(256'h1001101510021008100210101003100710051005100410061000100010051005),
    .INIT_15(256'h1000103518021012100010301801101110011025100010101001102010011009),
    .INIT_16(256'h1000105518061016100010501805101510001045180410141000104018031013),
    .INIT_17(256'h1000107518101020100010701809101910001065180810181000106018071017),
    .INIT_18(256'h1002101810031009100310121004100810061006100510071000100010061006),
    .INIT_19(256'h1000104218011013100110361000101210011030100110111001102410021010),
    .INIT_1A(256'h1000106618051017100010601804101610001054180310151000104818021014),
    .INIT_1B(256'h1000109018091021100010841808102010001078180710191000107218061018),
    .INIT_1C(256'h1002102110041010100310141005100910071007100610081000100010071007),
    .INIT_1D(256'h1001104910001014100110421001101310011035100210121001102810031011),
    .INIT_1E(256'h1000107718041018100010701803101710001063180210161000105618011015),
    .INIT_1F(256'h1000110518081022100010981807102110001091180610201000108418051019),
    .INIT_20(256'h1002102410051011100410161006101010081008100710091000100010081008),
    .INIT_21(256'h1001105610011015100110481002101410011040100310131002103210041012),
    .INIT_22(256'h1000108818031019100010801802101810001072180110171001106410001016),
    .INIT_23(256'h1000112018071023100011121806102210001104180510211000109618041020),
    .INIT_24(256'h1003102710061012100410181007101110091009100810101000100010091009),
    .INIT_25(256'h1001106310021016100110541003101510011045100410141002103610051013),
    .INIT_26(256'h1000109918021020100010901801101910011081100010181001107210011017),
    .INIT_27(256'h1000113518061024100011261805102310001117180410221000110818031021),
    .INIT_28(256'h1003103010071013100510201008101210101010100910111000100010101010),
    .INIT_29(256'h1001107010031017100110601004101610021050100510151002104010061014),
    .INIT_2A(256'h1000111018011021100111001000102010011090100110191001108010021018),
    .INIT_2B(256'h1000115018051025100011401804102410001130180310231000112018021022),
    .INIT_2C(256'h1003103310081014100510221009101310111011101010121000100010111011),
    .INIT_2D(256'h1001107710041018100110661005101710021055100610161002104410071015),
    .INIT_2E(256'h1001112110001022100111101001102110011099100210201001108810031019),
    .INIT_2F(256'h1000116518041026100011541803102510001143180210241000113218011023),
    .INIT_30(256'h1004103610091015100610241010101410121012101110131000100010121012),
    .INIT_31(256'h1001108410051019100210721006101810021060100710171003104810081016),
    .INIT_32(256'h1001113210011023100111201002102210011108100310211001109610041020),
    .INIT_33(256'h1000118018031027100011681802102610001156180110251001114410001024),
    .INIT_34(256'h1004103910101016100610261011101510131013101210141000100010131013),
    .INIT_35(256'h1001109110061020100210781007101910021065100810181003105210091017),
    .INIT_36(256'h1001114310021024100111301003102310011117100410221001110410051021),
    .INIT_37(256'h1000119518021028100011821801102710011169100010261001115610011025),
    .INIT_38(256'h1004104210111017100710281012101610141014101310151000100010141014),
    .INIT_39(256'h1002109810071021100210841008102010021070100910191003105610101018),
    .INIT_3A(256'h1001115410031025100111401004102410011126100510231001111210061022),
    .INIT_3B(256'h1000121018011029100111961000102810011182100110271001116810021026),
    .INIT_3C(256'h1005104510121018100710301013101710151015101410161000100010151015),
    .INIT_3D(256'h1002110510081022100210901009102110031075101010201003106010111019),
    .INIT_3E(256'h1001116510041026100111501005102510011135100610241001112010071023),
    .INIT_3F(256'h1001122510001030100112101001102910011195100210281001118010031027),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    outData_reg
       (.ADDRARDADDR({Q,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clock),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({NLW_outData_reg_DOADO_UNCONNECTED[15:13],DOADO}),
        .DOBDO(NLW_outData_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_outData_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_outData_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpecialHEXtoSevenSegmentEncoder
   (seg,
    Q);
  output [6:0]seg;
  input [3:0]Q;

  wire [3:0]Q;
  wire [6:0]seg;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA894)) 
    \seg[0]_INST_0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(seg[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA4C8)) 
    \seg[1]_INST_0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(seg[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \seg[2]_INST_0 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(seg[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hCA14)) 
    \seg[3]_INST_0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(seg[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hD790)) 
    \seg[4]_INST_0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .O(seg[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hD990)) 
    \seg[5]_INST_0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(seg[5]));
  LUT4 #(
    .INIT(16'h6025)) 
    \seg[6]_INST_0 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .O(seg[6]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
