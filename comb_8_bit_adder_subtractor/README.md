# Combinational 8-bit adder/subtractor

This is a combinational 8-bit adder/subtractor, which can handle two 8-bit binary inputs to do addition or subtraction with a one-bit controller
### Input
Two 8-bit operands: A, B
One 1-bit control input for addition/subtraction: Add_ctrl (Add_ctrl=1 (0) for addition (subtraction))
### Output
One 8-bit sum output: SUM
One 1-bit carry-out output: C_out


## Structure
![image](https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/8b_addsub.png)
The combined 8-bit adder/subtractor consists of XOR, NOT, and adder 8 (8-bit adder.) XOR is used to compute the complement operation of B and determines whether to perform an addition or subtraction operation through NOT (add_ctrl).

![image](https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/adder8.png)
Adder8 consists of two adder4 (4-bit CLA adder) in series.

![image](https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/comb_8_bit_adder_subtractor/picture/adder4.png)
Schematic diagram of adder4 (4-bit CLA adder).

## Test Bench


## Synthesis Result
