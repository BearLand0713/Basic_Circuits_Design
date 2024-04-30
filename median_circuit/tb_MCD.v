`timescale 1ns/10ps
`include "MCD_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"

module testbench_Median_Circuit;
reg     [7:0] a0,a1,a2;

wire    [7:0] R;

MCD  R1(a0,a1,a2,R);

initial $sdf_annotate("MCD.sdf", R1);
initial begin:testbench_Median_Circuit
integer i,j,k;
    for(i=1 ; i<129 ; i=i*2)
        begin
            a0=i;
            for(j=1 ; j<129 ; j=j*2)
                begin
                    a1=j;
                    for(k=1 ; k<129 ; k=k*2)
                        begin
                            a2=k;                            
                                        #10;
                                        
                        end
                end
        end
    $finish;
end

initial begin
$dumpfile("MCD_syn.vcd");
$dumpvars;
end

    initial $monitor("a0=%b a1=%b a2=%b R=%b", a0, a1, a2, R);
    
endmodule