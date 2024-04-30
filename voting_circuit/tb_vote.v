`timescale 1ns/10ps
`include "vote_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"

module testbench_Vote_machine;
reg     [2:0] A,B,C,D,E;

wire    [2:0] R;

vote R0(A,B,C,D,E,R);

initial $sdf_annotate("vote.sdf", R0);
initial begin:testbench_Vote_machine
integer i,j,k,l,m;
    for(i=1 ; i<5 ; i=i*2)
        begin
            A=i;
            for(j=1 ; j<5 ; j=j*2)
                begin
                    B=j;
                    for(k=1 ; k<5 ; k=k*2)
                        begin
                            C=k;
                            for(l=1 ; l<5 ; l=l*2)
                                begin
                                    D=l;
                                    for(m=1 ; m<5 ; m=m*2)
                                        begin
                                            E=m;
                            
                                        #10;
                            
                                        end
                                end
                        end
                end
        end
    $finish;
end

initial begin
$dumpfile("vote_syn.vcd");
$dumpvars;
end

    initial $monitor("A=%b B=%b C=%b D=%b E=%b R=%b", A, B, C, D, E, R);
    
endmodule