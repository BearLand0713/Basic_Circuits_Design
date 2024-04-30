# Combinational 8-bit adder/subtractor  

This is a combinational 8-bit adder/subtractor, which can handle two 8-bit binary inputs to do addition or subtraction with a one-bit controller  

### Input  
**Two 8-bit operands:** A, B  
**One 1-bit control input for addition/subtraction:** Add_ctrl (Add_ctrl=1 (0) for addition (subtraction))  
### Output  
**One 8-bit sum output:** SUM  
**One 1-bit carry-out output:** C_out  


## Structure  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/8b_addsub.png" width="400" height="300">  
The combined 8-bit adder/subtractor consists of XOR, NOT, and adder 8 (8-bit adder). XOR is used to compute the complement operation of B and determines whether to perform an addition or subtraction operation through NOT (add_ctrl).  

  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/adder8.png" width="400" height="150">   
Adder8 consists of two adder4 (4-bit CLA adder) in series.  

    
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/adder4.png" width="400" height="300">  
Schematic diagram of adder4 (4-bit CLA adder).  

## Test Bench  
The testbench is designed to simulate various inputs by using three layers of for loops.  
( i: add/drop (0,1), j: A(0~256), k: B(0~256))  
We also use $display to detect errors and call the system function $monitor to display the value of A, B, C0, S, and C1 whenever it changes.  

<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/tb.png" width="400" height="300">  
  
## Synthesis Result  
### Gate Count = 414.165594÷5≒83  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/Gatecount.png" width="400" height="300"> 

  
### Critical Path  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/Criticalpath.png" width="400" height="300"> 

  
### Power  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/power.png" width="400" height="300"> 



