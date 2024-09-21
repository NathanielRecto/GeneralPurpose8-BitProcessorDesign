# General Purpose 8-bit Processor Design
## Project Overview 
This project involves the design of a simple 8-bit general-purpose processor on a FPGA board, utilizing latches for data storage, an ALU for performing arithmetic and logic operations, and a control unit made up of a Finite State Machine (FSM) and a 4x16 Decoder. The processor executes various Boolean operations, displaying results via a 7-segment display. This project was made by using VHDL and Quartus II with a performance of a waveform simulation. 

The latches temporarily store input values before transferring them to the ALU, which performs mathematical operations. The FSM acted as an up-counter cycling through 0-8, sending them to the 4x16 decoder, which sends a 16-bit message to the ALU.
## Processor Components:
### Latch 1 and Latch 2:
- These latches act as temporary storage for input values before transferring them to the ALU. The input values (A and B) are binary representations of the last 4 digits of the student number.
### Finite State Machine (FSM):
- The FSM operates with nine states, handling the student ID code. It sends the current state to the decoder, which determines the ALU's operation.
### 4x16 Decoder:
- The decoder takes the FSM's current state, decodes it, and outputs a 16-bit signal. This signal selects the ALU's operations.
### ALU
- The Arithmetic Logic Unit (ALU) executes arithmetic and logical operations on 8-bit values A and B, depending on the assigned microcode. It uses the FSM and 4x16 decoder to select specific operations for the given input and outputs the result in 7-segment display.
### 7-segment Display:
- The 7-segment display is used to visualize the outputs from the ALU. It shows the results of boolean operations performed on the input values, including the student ID and, in later problem sets, whether the student digits are odd or even.
## ALU_1 for Problem Set 1
The ALU executes boolean operations between 8-bit values A and B, based on the assigned microcode. The result is displayed on 7-segment displays. Due to clocking synchronization issues, the ALU's operation lags behind the FSM/Decoder output.
## Microcode Table for ALU_1:

## ALU_1 Block Diagram Schematic:

## ALU_2 for Problem Set 2
Similar to ALU_1, this problem set modifies the boolean functions for A and B, with new microcodes for different operations. The outputs and functionality remain consistent with Problem Set 1.

## Microcode Table for ALU_2:

## ALU_2 Block Diagram Schematic:

## ALU_3 for Problem Set 3
In this set, the ALU was modified to include a 4-bit student ID input. The ALU determines whether each digit of the student number is odd ("y") or even ("n") and displays this result along with the student ID.
## ALU_3 Block Diagram Schematic:

## Conclusion
This lab deomstrated the flexibility of ALU design on a FPGA board. The combination of the ALU, FSM, and latches allowed for various boolean operations, state transitions, and displaying results on a 7-segment display.
