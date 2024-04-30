`timescale 1ns/10ps
`include "TLC_syn.v"
`include "/mnt3/CBDK_IC_Contest_v2.1/Verilog/tsmc13.v"

module testbench_TLC;

reg         clk,reset;

wire        R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR;

TLC R0(clk,reset,R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR);

initial $sdf_annotate("TLC.sdf", R0);
initial begin

    clk=0;reset=0;


    #10  reset=1;   
    #20  reset=0;
    #2000 $finish;
    end 
    always #5 clk=~clk;


initial begin
$dumpfile("TLC_syn.vcd");
$dumpvars;
end

    initial $monitor($time,,"clk=%b reset=%b R0G=%b R0Y=%b R0R=%b R1G=%b R1Y=%b R1R=%b CG=%b CY=%b CR=%b", clk, reset, R0G, R0Y, R0R, R1G, R1Y, R1R, CG, CY, CR);
    
endmodule