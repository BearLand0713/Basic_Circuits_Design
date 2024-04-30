/**************************************************************************


 *****************                   ***************************
 *               * TS,TL,TCS,THL     *                         *   R0G,R0Y,R0R,R1G   
 *               * ----------------->*                         *---------------->           
 *               *                   *                         *   R1Y,R1R,CG,CY,CR         
 *               *                   *                         *           
 *    counter    * <---clk           *      TLcontroller       *           
 *               *                   *                         *            
 *               *                   *                         *           
 *               *<------------------*                         * <---------------          
 *               *   ST_out          *                         *    clk,reset          
 *****************                   ***************************          
                                           
                                           


***************************************************************************
    *States* 
    S0  R0G  Road0 green               (Road1 red,Crosswalk red)
    S1  R0Y  Road0 yellow              (Road1 red,Crosswalk red)
    S2  R1G  Road1 green               (Road0 red,Crosswalk red)
    S3  R1Y  Road1 yellow              (Road0 red,Crosswalk red)
    S4  CG   Crosswalk green           (Road0 red,Road1 red)
    S5  CR   Crosswalk yellow          (Road0 red,Road1 red)  
   
    
****************************************************************************
    *Input signal*
    clk                clock
    reset              place FSM in initial state
    
****************************************************************************
    *Output signal*
    R0G,R0Y,R0R        Road0      green/yellow/red
    R1G,R1Y,R1R        Road1      green/yellow/red
    CG,CY,CR           Crosswalk  green/yellow/red
    ST                 start timing for TS/TL/TCS/TCL
    
****************************************************************************    
    *Reg*
    TS                 Short time interval
    TL                 long time interval
    TCS                short Crosswalk time interval
    TCL                long Crosswalk time interval
       
***************************************************************************/

module TLC (clk,reset,R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR);

input   clk,reset;
output  R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR;

wire    ST_out,TS,TL,TCS,TCL;


TLcontroller U0(clk,reset,TS,TL,TCS,TCL,R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR,ST_out);
counter U1(clk,ST_out,TS,TL,TCS,TCL);


endmodule






module TLcontroller (clk,reset,TS,TL,TCS,TCL,R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR,ST_out);

input   clk,reset,TS,TL,TCS,TCL;
output  R0G,R0Y,R0R,R1G,R1Y,R1R,CG,CY,CR,ST_out;

reg     [2:0] state,next_state;

reg     ST,ST_out;



parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;

assign  R0G=(state==S0);
assign  R0Y=(state==S1);
assign  R0R=((state==S2)||(state==S3)||(state==S4)||(state==S5));
assign  R1G=(state==S2);
assign  R1Y=(state==S3);
assign  R1R=((state==S0)||(state==S1)||(state==S4)||(state==S5));
assign  CG=(state==S4);
assign  CY=(state==S5);
assign  CR=((state==S0)||(state==S1)||(state==S2)||(state==S3));

always@(posedge clk or posedge reset)
    
    if(reset)
        begin 
            state<=S0;
            ST_out<=1;

        end
    else 
        begin
            state<=next_state;
            ST_out<=ST;
        end

        
always@(*)
    case(state)
        S0:if(TL)
                begin
                next_state=S1;
                ST=1;
                end
            else
                begin
                next_state=S0;
                ST=0;           
                end
        S1:if(TS)
                begin
                next_state=S2;
                ST=1;       
                end
            else
                begin
                next_state=S1;
                ST=0;        
                end
        S2:if(TL)
                begin
                next_state=S3;
                ST=1;                 
                end
            else
                begin
                next_state=S2;
                ST=0;        
                end
        S3:if(TS)
                begin
                next_state=S4;
                ST=1;
                end
            else
                begin
                next_state=S3;
                ST=0;
                end
        S4:if(TCL)
                begin
                next_state=S5;
                ST=1;
                end
            else
                begin
                next_state=S4;
                ST=0;          
                end
        S5:if(TCS)
                begin
                next_state=S0;
                ST=1;
                end
            else
                begin
                next_state=S5;
                ST=0;          
                end
        default:begin
                next_state=S0;
                ST=0;
                end
    endcase
        
endmodule
        
        
        
module counter(clk,ST_out,TS,TL,TCS,TCL);

input   clk,ST_out;
output  TS,TL,TCS,TCL;
reg     [3:0] count;

            
always@(posedge clk)

    if(ST_out)
        begin 
            count<=4'd0;
        end
    else
        begin
            count<=count+1; 
        end
        
        
assign  TS=(count==4'd2);
assign  TL=(count==4'd8);
assign  TCS=(count==4'd4);        
assign  TCL=(count==4'd10);

endmodule

