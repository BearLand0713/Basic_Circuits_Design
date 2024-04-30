 `include "adder4.v"
module adder8(B, A, C0, S, C2);
input[7:0] B, A;
input C0;
output[7:0] S;
output C2;
wire C1;
adder4 B0(B[3:0], A[3:0], C0, S[3:0], C1);
adder4 B1(B[7:4], A[7:4], C1, S[7:4], C2);

endmodule