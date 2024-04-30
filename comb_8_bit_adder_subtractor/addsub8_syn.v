`timescale 1ns/10ps
/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sat May 16 03:17:23 2020
/////////////////////////////////////////////////////////////


module adder4_0 ( A, B, Cin, S, Cout );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OR2X1 U1 ( .A(A[2]), .B(n5), .Y(n1) );
  XNOR2X1 U2 ( .A(n2), .B(n3), .Y(S[3]) );
  XNOR2X1 U3 ( .A(A[3]), .B(B[3]), .Y(n2) );
  XNOR2X1 U4 ( .A(n4), .B(n5), .Y(S[2]) );
  XNOR2X1 U5 ( .A(A[2]), .B(B[2]), .Y(n4) );
  XNOR2X1 U6 ( .A(n6), .B(n7), .Y(S[1]) );
  XNOR2X1 U7 ( .A(A[1]), .B(B[1]), .Y(n6) );
  XOR2X1 U8 ( .A(A[0]), .B(n8), .Y(S[0]) );
  XOR2X1 U9 ( .A(Cin), .B(B[0]), .Y(n8) );
  OAI2BB1X1 U10 ( .A0N(n3), .A1N(A[3]), .B0(n9), .Y(Cout) );
  OAI21XL U11 ( .A0(A[3]), .A1(n3), .B0(B[3]), .Y(n9) );
  AO22X1 U12 ( .A0(n1), .A1(B[2]), .B0(n5), .B1(A[2]), .Y(n3) );
  OAI2BB1X1 U13 ( .A0N(n7), .A1N(A[1]), .B0(n10), .Y(n5) );
  OAI21XL U14 ( .A0(A[1]), .A1(n7), .B0(B[1]), .Y(n10) );
  OAI2BB1X1 U15 ( .A0N(A[0]), .A1N(B[0]), .B0(n11), .Y(n7) );
  OAI21XL U16 ( .A0(A[0]), .A1(B[0]), .B0(Cin), .Y(n11) );
endmodule


module adder4_1 ( A, B, Cin, S, Cout );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OR2X1 U1 ( .A(A[2]), .B(n5), .Y(n1) );
  XNOR2X1 U2 ( .A(n2), .B(n3), .Y(S[3]) );
  XNOR2X1 U3 ( .A(A[3]), .B(B[3]), .Y(n2) );
  XNOR2X1 U4 ( .A(n4), .B(n5), .Y(S[2]) );
  XNOR2X1 U5 ( .A(A[2]), .B(B[2]), .Y(n4) );
  XNOR2X1 U6 ( .A(n6), .B(n7), .Y(S[1]) );
  XNOR2X1 U7 ( .A(A[1]), .B(B[1]), .Y(n6) );
  XOR2X1 U8 ( .A(A[0]), .B(n8), .Y(S[0]) );
  XOR2X1 U9 ( .A(Cin), .B(B[0]), .Y(n8) );
  OAI2BB1X1 U10 ( .A0N(n3), .A1N(A[3]), .B0(n9), .Y(Cout) );
  OAI21XL U11 ( .A0(A[3]), .A1(n3), .B0(B[3]), .Y(n9) );
  AO22X1 U12 ( .A0(n1), .A1(B[2]), .B0(n5), .B1(A[2]), .Y(n3) );
  OAI2BB1X1 U13 ( .A0N(n7), .A1N(A[1]), .B0(n10), .Y(n5) );
  OAI21XL U14 ( .A0(A[1]), .A1(n7), .B0(B[1]), .Y(n10) );
  OAI2BB1X1 U15 ( .A0N(A[0]), .A1N(B[0]), .B0(n11), .Y(n7) );
  OAI21XL U16 ( .A0(A[0]), .A1(B[0]), .B0(Cin), .Y(n11) );
endmodule


module adder8 ( B, A, C0, S, C2 );
  input [7:0] B;
  input [7:0] A;
  output [7:0] S;
  input C0;
  output C2;
  wire   C1;

  adder4_0 B0 ( .A(B[3:0]), .B(A[3:0]), .Cin(C0), .S(S[3:0]), .Cout(C1) );
  adder4_1 B1 ( .A(B[7:4]), .B(A[7:4]), .Cin(C1), .S(S[7:4]), .Cout(C2) );
endmodule


module addsub8 ( A, B, add_ctrl, SUM, C_out );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input add_ctrl;
  output C_out;
  wire   n1;
  wire   [7:0] M;

  adder8 S01 ( .B(A), .A(M), .C0(n1), .S(SUM), .C2(C_out) );
  XOR2X1 U10 ( .A(n1), .B(B[7]), .Y(M[7]) );
  XOR2X1 U11 ( .A(n1), .B(B[6]), .Y(M[6]) );
  XOR2X1 U12 ( .A(n1), .B(B[5]), .Y(M[5]) );
  XOR2X1 U13 ( .A(n1), .B(B[4]), .Y(M[4]) );
  XOR2X1 U14 ( .A(n1), .B(B[3]), .Y(M[3]) );
  XOR2X1 U15 ( .A(n1), .B(B[2]), .Y(M[2]) );
  XOR2X1 U16 ( .A(n1), .B(B[1]), .Y(M[1]) );
  XOR2X1 U17 ( .A(n1), .B(B[0]), .Y(M[0]) );
  CLKINVX1 U18 ( .A(add_ctrl), .Y(n1) );
endmodule

