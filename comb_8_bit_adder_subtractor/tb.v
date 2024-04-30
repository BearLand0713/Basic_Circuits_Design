`timescale 1ns/10ps
`include "addsub8_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"

module testbench_addsub8_syn;
reg     [7:0] A,B;
reg     addctrl;
wire    [7:0] S;
wire    C;
addsub8 R0(A, B, addctrl, S, C);

initial $sdf_annotate("addsub.sdf", R0);
initial begin:testbench_addsub8
integer i,j,k;
    for(i=0 ; i<2 ; i=i+1)
        begin
            addctrl=i;
            for(j=0 ; j<256 ; j=j+1)
                begin
                    A=j;
                    for(k=0 ; k<256 ; k=k+1)
                        begin
                            B=k;
                            #10;
                            if(({C,S}!=A+B+!addctrl)&&(i==1))
                            $display("A=%d B=%d addctrl=%b failed01", A, B, addctrl);
                                if(({S}!=A-B)&&(i==0))
                                $display("A=%d B=%d addctrl=%b failed02", A, B, addctrl);
                            
                        end
                end
        end
    $finish;
end

initial begin
$dumpfile("addsub8_syn.vcd");
$dumpvars;
end

    initial $monitor("A=%d B=%d addctrl=%b S=%d C=%b", A, B, addctrl, S, C);
    
endmodule