# Median Circuit  

This is a median circuit, which accepts three eight-bit one-hot numbers, and outputs the input with the middle of the three values.    

### Input  
**Three 8-bit one-hot numbers** a2\[7:0\], a1\[7:0\], a0\[7:0\]  
  
### Output  
**One 8-bit median output:** R      


## Structure  
  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/median_circuit/picture/MCD.png" width="400" height="300">  
The median circuit consists of six comparators and six 2x1 multiplexers.  

## Test Bench  
The testbench is designed to simulate a variety of inputs by using a three-level for loop.  
(Starting with 1 for I, j, k and multiplying by two each time thereafter to simulate various inputs of one hot numbers).   
And call the system function $monitor to display the value of a0, a1, a2, R when it changes.   
**Input:** a0=a0 , a1=a1 , a2=a2.    
**Output:** R=R.   

  
## Synthesis Result  
### Gate Count = 1067.664583÷5≒214   
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/median_circuit/picture/gatecount.png" width="400" height="300"> 

  
### Critical Path  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/median_circuit/picture/criticalpath.png" width="400" height="300"> 

  
### Power  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/median_circuit/picture/power.png" width="400" height="300"> 


