# Traffic Light Controller  

This is a practical traffic light controller that integrates a synchronization counter with reset and count enable functions as a timer to control the timing of light transitions.     

<table>
    <tr>
        <td rowspan="3">1班</td><td>语文</td><td>95</td>
    </tr>
    <tr>
        <td>数学</td><td>96</td>
    </tr>
    <tr>
        <td>英语</td><td>92</td>
    </tr>
</table>
   


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
