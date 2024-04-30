# Traffic Light Controller  

This is a practical traffic light controller that integrates a synchronization counter with reset and count enable functions as a timer to control the timing of light transitions.  

## Description
This design is a pedestrian-friendly intersection, separating the traffic light signals for sidewalks from those for vehicles, making it safer for pedestrians to cross the street and solving the problem of turning cars not yielding to pedestrians. It also extends the duration of the green and yellow lights for pedestrians, making it easier for the elderly to cross the street.  

<table>
    <tr>
        <td rowspan="2">Input</td><td>clk</td><td>clock</td>
    </tr>
    <tr>
        <td>reset</td><td>reset when 1</td>
    </tr>
    <tr>
        <td rowspan="9">Output</td><td>R0G</td><td>Green light of Road 0(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R0Y</td><td>Yellow light of Road 0(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R0R</td><td>Red light of Road 0(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1G</td><td>Green light of Road 1(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1Y</td><td>Yellow light of Road 1(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1R</td><td>Red light of Road 1(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CG</td><td>Green light of crosswalk(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CY</td><td>Yellow light of crosswalk(1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CR</td><td>Red light of crosswalk(1 ON/0 off)</td>
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
