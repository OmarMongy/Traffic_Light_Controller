# Traffic Light Controller

## Abstract:
This repo presents the design, simulation, and functionality of a Traffic Light Controller implemented in Verilog HDL. The traffic light controller is responsible for managing the traffic flow on two roads, denoted as Road A and Road B. The controller operates based on the presence of cars on each road, enabling efficient traffic light transitions to ensure smooth traffic flow and safety. This report details the specification, functionality, design, and simulation results of the traffic light controller.

## 1. Introduction:
Efficient management of traffic lights is crucial for maintaining smooth traffic flow and ensuring safety on roads. To achieve this, an effective Traffic Light Controller is required. In this report, we present a Verilog-based implementation of a Traffic Light Controller capable of dynamically adjusting its light states based on the presence of cars on Road A and Road B.

## 2. Traffic Light Controller Specification:
The Traffic Light Controller is designed to manage the traffic flow at an intersection with two roads, A and B. It is equipped with the following inputs and outputs:

## Inputs:
- `clk`: (clock signal) : The clock signal used to synchronize the internal state transitions of the controller.
- `reset_n` (active low reset) : A reset signal that initializes the controller to a default state when asserted (low).
- `Sa` (presence of cars on Road A) : A binary input signal indicating the presence of cars on Road A.
- `Sb` (presence of cars on Road B) : A binary input signal indicating the presence of cars on Road B.
## Outputs:
- `Ra` (Red signal for Road A) : A binary output signal representing the red light state for Road A.
- `Ya` (Yellow signal for Road A) : A binary output signal representing the yellow light state for Road A.
- `Ga` (Green signal for Road A) : A binary output signal representing the green light state for Road A.
- `Rb` (Red signal for Road B) : A binary output signal representing the red light state for Road B.
- `Yb` (Yellow signal for Road B) : A binary output signal representing the yellow light state for Road B.
- `Gb` (Green signal for Road B) : A binary output signal representing the green light state for Road B.
## 3. Functionality:
The Traffic Light Controller operates as a finite state machine (FSM) with twelve distinct states, each controlling different traffic light configurations. The states are represented by the following localparam values:

s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, s11 = 11, s12 = 12.

### The functionality of the Traffic Light Controller can be summarized as follows:

The controller starts in state s0, which initializes the traffic lights on Road A to the green state and those on Road B to the red state.
The state transitions occur on each clock edge and are triggered by the FSM logic.
The controller uses inputs Sa and Sb to adjust its state accordingly. Presence of cars on Road B forces the controller to stay in state s5, allowing time for vehicles to pass.
The controller stays in state s6 (yellow light for Road A and red light for Road B) for a certain period before proceeding to states s7 and s8, where Road A turns red and Road B turns green.
In state s9, Road B enters a yellow light state before switching back to the red state (s10) and waiting for input changes.
If both roads have no cars (Sa = 0 and Sb = 0), the controller transitions to state s12, which represents an all-red state, ensuring safety and synchronization.
The Traffic Light Controller is designed to meet specific timing requirements for each road. The timing constraints for each state are as follows:

Street A (Road A) will remain green for 60 seconds unless a car approaches Street B (Road B).
Street B (Road B) will remain green for 50 seconds unless there are cars present on Street B and Street A is empty.
If cars are present on Street B and Street A is empty, 10 seconds will be added to the green time for Street B.
If there are no cars present on Street B, the green light for Street B will turn off, and the main Street A will return to green.
## 4. Traffic Light Controller Design:
The Traffic Light Controller is implemented using two always blocks: one for sequential logic and the other for combinatorial logic.

The sequential logic block updates the state_reg based on the clock edge and the reset signal reset_n.
The combinatorial logic block uses the current state_reg to determine the next state state_next based on the FSM's behavior, including input conditions for transitions.
The output signals (Ra, Ya, Ga, Rb, Yb, and Gb) are assigned based on the state_reg, controlling the traffic light states for Roads A and B.
## 5. Simulation:
The provided testbench, Traffic_Light_Controller_tb, demonstrates the simulation of the Traffic Light Controller.

The clock (clk) and reset (reset_n) signals are initialized and controlled in the testbench.
Inputs Sa and Sb are manipulated to represent different traffic scenarios.
The testbench simulates the traffic light controller behavior over multiple cycles, capturing the output signals (Ra, Ya, Ga, Rb, Yb, and Gb) to observe the changes in traffic light states.

In conclusion, the Traffic Light Controller design presented in this report is an effective solution for managing traffic flow at an intersection with two roads. The design's functionality and simulation results demonstrate its ability to adapt to varying traffic conditions and ensure safe and efficient traffic control.
