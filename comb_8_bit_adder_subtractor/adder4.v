module adder4(A,B,Cin,S,Cout) ;

input [3:0] A,B;
input       Cin;

output[3:0] S;
output      Cout;
wire  [3:0] P,G,C,D;
wire  [5:0] H;

or (P[0], A[0], B[0]);
or (P[1], A[1], B[1]);
or (P[2], A[2], B[2]);
or (P[3], A[3], B[3]);

and (G[0], A[0], B[0]);
and (G[1], A[1], B[1]);
and (G[2], A[2], B[2]);
and (G[3], A[3], B[3]);

xor (S[0], A[0], B[0], Cin);
xor (S[1], A[1], B[1], C[0]);
xor (S[2], A[2], B[2], C[1]);
xor (S[3], A[3], B[3], C[2]);

and (D[0], P[0], Cin);
and (D[1], P[1], P[0], Cin);
and (D[2], P[2], P[1], P[0], Cin);
and (D[3], P[3], P[2], P[1], P[0], Cin);

and (H[0], P[1], G[0]);
and (H[1], P[2], P[1], G[0]);
and (H[2], P[3], P[2], P[1], G[0]);
and (H[3], P[2], G[1]);
and (H[4], P[3], P[2], G[1]);
and (H[5], P[3], G[2]);



or  (C[0], G[0], D[0]);
or  (C[1], G[1], H[0], D[1]);
or  (C[2], G[2], H[3], H[1], D[2]); 
or  (Cout, G[3], H[5], H[4], H[2], D[3]); 

endmodule    