# Voting Circuit  

This is a voting circuit that accepts five three-bit one-hot numbers and outputs the input with the most occurrences.    

### Input  
**Five 3-bit one-hot numbers** A\[2:0\], B\[2:0\], C\[2:0\], D\[2:0\], E\[2:0\]  
  
### Output  
**One 8-bit median output:** R\[2:0\]      


## Structure  
  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/voting_circuit/picture/VM.png" width="400" height="300">  

The entire voting machine consists of adders, 2x1 multiplexers, comparators, ANDs, and NOTs. The functions of each element are described below.
  
**Adder**   
Since the inputs are all one hot numbers, the five inputs are added up by bits to get the number of times the bit 1 occurs.  
**Comparator**  
Compare the number of occurrences of bit 1 as the control of multiplexer.  
**2x1 Multiplexer**  
Controls the multiplexer by the result of the comparator so that the bit with the most occurrences of 1 is output as 1.  
**AND, NOT** 
Since a tie occurs, it is necessary to design an architecture to achieve a tie by selecting the higher bit output.  
  

## Test Bench  
The testbench is designed to simulate various inputs by using five levels of for loops. 
(Starting with 1 for I, j, k, l, m and multiplying by two each time to achieve the input of one hot numbers). 
And call the system function $monitor to display the value when A,B,C,D,E,R changes. 
**Input:** A=A , B=B , C=C , D=D , E=E . 
**Output:** R=R.   

  
## Synthesis Result  
### Gate Count = 383.612398÷5≒77    
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/voting_circuit/picture/gatecount.png" width="400" height="300">  
  
### Critical Path  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/voting_circuit/picture/criticalpath.jpg" width="400" height="300">  
  
### Power  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/voting_circuit/picture/power.png" width="400" height="300">  


