module Vote_machine(A,B,C,D,E,R);

input [2:0] A,B,C,D,E;
output[2:0] R;

wire    [2:0] M0,M1,M2,Rt;

assign M0=A[0]+B[0]+C[0]+D[0]+E[0];
assign M1=A[1]+B[1]+C[1]+D[1]+E[1];
assign M2=A[2]+B[2]+C[2]+D[2]+E[2];


assign Rt[0]=((M0>=M2)?((M0>=M1)?1:0):0);
assign Rt[1]=((M1>=M2)?((M1>=M0)?1:0):0);
assign Rt[2]=((M2>=M1)?((M2>=M0)?1:0):0);

assign R[2]=Rt[2];
assign R[1]=(~Rt[2])&Rt[1];
assign R[0]=(~Rt[2])&(~Rt[1])&Rt[0];

endmodule
