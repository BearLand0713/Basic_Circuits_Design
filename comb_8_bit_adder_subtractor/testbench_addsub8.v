`include "addsub8.v"

module testbench_addsub8;
reg     [7:0] A,B;
reg     C0;
wire    [7:0] S;
wire    C1;
addsub8 R0(A, B, C0, S, C1);

initial begin:testbench_addsub8
integer i,j,k;
    for(i=0 ; i<2 ; i=i+1)
        begin
            C0=i;
            for(j=0 ; j<256 ; j=j+1)
                begin
                    A=j;
                    for(k=0 ; k<256 ; k=k+1)
                        begin
                            B=k;
                            #10;
                            if(({C1,S}!=A+B+!C0)&&(i==1))
                            $display("A=%d B=%d C0=%b failed01", A, B, C0);
                                if(({S}!=A-B)&&(i==0))
                                $display("A=%d B=%d C0=%b failed02", A, B, C0);
                            
                        end
                end
        end
    $finish;
end

initial begin
$dumpfile("wave_addsub8.vcd");
$dumpvars;
end

    initial $monitor("A=%d B=%d C0=%b S=%d C1=%b", A, B, C0, S, C1);
    
endmodule