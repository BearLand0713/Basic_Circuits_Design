`timescale 1ns/10ps
/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun May 31 00:51:48 2020
/////////////////////////////////////////////////////////////


module TLcontroller ( clk, reset, TS, TL, TCS, TCL, R0G, R0Y, R0R, R1G, R1Y, 
        R1R, CG, CY, CR, ST_out );
  input clk, reset, TS, TL, TCS, TCL;
  output R0G, R0Y, R0R, R1G, R1Y, R1R, CG, CY, CR, ST_out;
  wire   ST, n1, n3, n4, n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSX1 ST_out_reg ( .D(ST), .CK(clk), .SN(n1), .Q(ST_out) );
  CLKINVX1 U3 ( .A(reset), .Y(n1) );
  DFFRX1 \state_reg[2]  ( .D(n3), .CK(clk), .RN(n1), .Q(state[2]), .QN(CR) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n1), .Q(state[1]), 
        .QN(R1R) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n1), .Q(state[0])
         );
  CLKINVX1 U4 ( .A(n11), .Y(n3) );
  AOI221XL U5 ( .A0(n10), .A1(n4), .B0(R1Y), .B1(TS), .C0(CG), .Y(n11) );
  CLKINVX1 U6 ( .A(n17), .Y(n4) );
  OAI221XL U7 ( .A0(TS), .A1(n12), .B0(n9), .B1(n5), .C0(n6), .Y(next_state[1]) );
  CLKINVX1 U8 ( .A(R1G), .Y(n6) );
  CLKINVX1 U9 ( .A(R0Y), .Y(n5) );
  OAI221XL U10 ( .A0(TS), .A1(n13), .B0(TCS), .B1(n14), .C0(n15), .Y(
        next_state[0]) );
  CLKINVX1 U11 ( .A(TCS), .Y(n10) );
  OAI221XL U12 ( .A0(n9), .A1(n13), .B0(n14), .B1(n10), .C0(n15), .Y(ST) );
  CLKINVX1 U13 ( .A(TS), .Y(n9) );
  NAND2X1 U14 ( .A(n17), .B(n12), .Y(R0R) );
  CLKINVX1 U15 ( .A(n14), .Y(CY) );
  NAND2X1 U16 ( .A(state[2]), .B(R1R), .Y(n17) );
  NAND2X1 U17 ( .A(state[1]), .B(CR), .Y(n12) );
  NOR2X1 U18 ( .A(n12), .B(state[0]), .Y(R1G) );
  NAND2X1 U19 ( .A(state[0]), .B(n4), .Y(n14) );
  NAND2X1 U20 ( .A(state[0]), .B(CR), .Y(n13) );
  NOR2X1 U21 ( .A(n13), .B(state[1]), .Y(R0Y) );
  NOR2X1 U22 ( .A(n17), .B(state[0]), .Y(CG) );
  AOI21X1 U23 ( .A0(TCL), .A1(CG), .B0(n16), .Y(n15) );
  NOR3BXL U24 ( .AN(TL), .B(state[0]), .C(state[2]), .Y(n16) );
  NOR2BX1 U25 ( .AN(state[0]), .B(n12), .Y(R1Y) );
  NOR3X1 U26 ( .A(state[0]), .B(state[2]), .C(state[1]), .Y(R0G) );
endmodule


module counter ( clk, ST_out, TS, TL, TCS, TCL );
  input clk, ST_out;
  output TS, TL, TCS, TCL;
  wire   N7, N8, N9, N10, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] count;

  DFFQX1 \count_reg[2]  ( .D(N9), .CK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N8), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N7), .CK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[3]  ( .D(N10), .CK(clk), .Q(count[3]) );
  NOR4X1 U3 ( .A(count[3]), .B(count[1]), .C(count[0]), .D(n2), .Y(TCS) );
  NAND2BX1 U4 ( .AN(count[0]), .B(count[1]), .Y(n3) );
  NOR3X1 U5 ( .A(n3), .B(count[3]), .C(count[2]), .Y(TS) );
  OAI22XL U6 ( .A0(n5), .A1(n2), .B0(count[2]), .B1(n6), .Y(N9) );
  NAND3BX1 U7 ( .AN(ST_out), .B(count[1]), .C(count[0]), .Y(n6) );
  AOI2BB1X1 U8 ( .A0N(count[1]), .A1N(ST_out), .B0(N7), .Y(n5) );
  NAND2X1 U9 ( .A(count[3]), .B(n2), .Y(n4) );
  NOR2X1 U10 ( .A(ST_out), .B(count[0]), .Y(N7) );
  NOR2X1 U11 ( .A(n3), .B(n4), .Y(TCL) );
  NOR3X1 U12 ( .A(n4), .B(count[1]), .C(count[0]), .Y(TL) );
  CLKINVX1 U13 ( .A(count[2]), .Y(n2) );
  OAI222XL U14 ( .A0(ST_out), .A1(n4), .B0(n6), .B1(n8), .C0(n5), .C1(n1), .Y(
        N10) );
  NAND2X1 U15 ( .A(count[2]), .B(n1), .Y(n8) );
  CLKINVX1 U16 ( .A(count[3]), .Y(n1) );
  AOI21X1 U17 ( .A0(n3), .A1(n7), .B0(ST_out), .Y(N8) );
  NAND2BX1 U18 ( .AN(count[1]), .B(count[0]), .Y(n7) );
endmodule


module TLC ( clk, reset, R0G, R0Y, R0R, R1G, R1Y, R1R, CG, CY, CR );
  input clk, reset;
  output R0G, R0Y, R0R, R1G, R1Y, R1R, CG, CY, CR;
  wire   TS, TL, TCS, TCL, ST_out;

  TLcontroller U0 ( .clk(clk), .reset(reset), .TS(TS), .TL(TL), .TCS(TCS), 
        .TCL(TCL), .R0G(R0G), .R0Y(R0Y), .R0R(R0R), .R1G(R1G), .R1Y(R1Y), 
        .R1R(R1R), .CG(CG), .CY(CY), .CR(CR), .ST_out(ST_out) );
  counter U1 ( .clk(clk), .ST_out(ST_out), .TS(TS), .TL(TL), .TCS(TCS), .TCL(
        TCL) );
endmodule

