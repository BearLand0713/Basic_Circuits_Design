# Traffic Light Controller  

This is a practical traffic light controller that integrates a synchronization counter with reset and count enable functions as a timer to control the timing of light transitions.  

## Description
This design is a pedestrian-friendly intersection, separating the traffic light signals for sidewalks from those for vehicles, making it safer for pedestrians to cross the street and solving the problem of turning cars not yielding to pedestrians. It also extends the duration of the green and yellow lights for pedestrians, making it easier for the elderly to cross the street.  
  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/intersec.png" width="400" height="300">

<table>
    <tr>
        <td rowspan="2">Input</td><td>clk</td><td>Clock</td>
    </tr>
    <tr>
        <td>reset</td><td>Trigger reset when 1</td>
    </tr>
    <tr>
        <td rowspan="9">Output</td><td>R0G</td><td>Green light of Road 0 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R0Y</td><td>Yellow light of Road 0 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R0R</td><td>Red light of Road 0 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1G</td><td>Green light of Road 1 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1Y</td><td>Yellow light of Road 1 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>R1R</td><td>Red light of Road 1 (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CG</td><td>Green light of crosswalk (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CY</td><td>Yellow light of crosswalk (1 ON/0 off)</td>
    </tr>
    <tr>
        <td>CR</td><td>Red light of crosswalk (1 ON/0 off)</td>
    </tr>
</table>
   


## Structure  
    
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/TCL.png" width="400" height="300">  
The traffic light controller consists of a Counter and a finite state machine (TLcontroller). The counter is responsible for counter timing. The TLcontroller is responsible for handling state.  
  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/detailed_TCL.png" width="600" height="300"> 
This is the detailed Schematic diagram of each components.  
  
### finite state machine (TLcontroller) 
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/state.png" width="600" height="300">   

  
## Synthesis Result  
### Gate Count =485.456397÷5≒97     
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/gatecount.png" width="400" height="300"> 

  
### Critical Path  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/criticalpath.png" width="400" height="300"> 

  
### Power  
<img src="https://github.com/BearLand0713/Basic_Circuits_Design/blob/main/traffic_light_controler/picture/power.png" width="400" height="300"> 
