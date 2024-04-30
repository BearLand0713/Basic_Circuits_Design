module MCD(a2,a1,a0,R);

input   [7:0] a2,a1,a0;
output  [7:0] R;
wire    [7:0] R1,R2,R3;

assign R1=(a2>a1)?a2:a1;
assign R2=(a2>a0)?a2:a0;
assign R3=(a1>a0)?a1:a0;
assign R=(R1==R2)?R3:(R1==R3)?R2:(R2==R3)?R1:0;

endmodule