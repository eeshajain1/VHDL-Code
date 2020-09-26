# VHDL-Code
This is a collection of all the code I wrote in my EECS 31L class at University of California, Irvine. 

Project 1 (XOR Gate): I wrote a VHDL behavioral file and testbench that outputs the result when two bits of information are inputted into an XOR gate. (Eg- if 0 XOR 1 is inputted, the result will be 1, and if 1 XOR 1 is inputted, the result will be 0)

Project 1a (Low Fuel Light Detector): I designed a small digital circuit for low fuel detection. The fuel system sensor provides a value from “0000” (empty) to “1111” (full). The controller turns on the low fuel light (FuelWarningLight = ‘1’) when it detects low fuel in the system (“0000” through “0100”). 

Project 2 (Parking Permit):I designed a controller for parking permit dispensing machines, which are automated pay machines that provide daily permits. I used an FSM and implemented the controller with state register and combinational circuit.

"The daily parking permit cost $20. Each pay station has a single slot, which accepts various bills. A subcontractor provides a bill sensor, which outputs a 3-bit vector named Input, representing $5, $10, $20, or cancelling the transaction. We dispense the permit (Permit = ‘1’ for one clock cycle) when $20 or more is collected and produce change if needed (ReturnChange = ‘1’ for one clock cycle)"

Project 3 (Accelarating Object Locator): I wrote a VHDL behavioral, structural, and testbench file in order to design the Locator. The locator has three 1-bit inputs (Start, Rst, and Clk), as well as a 16-bit position output (Location) and a 1-bit output (Done). When Rst = ‘1’, the Locator is set to Start State. When Start = ‘1’, the Locator computes the following locating equation (xf = x0 +v0t + 0.5at^2) based on the values stored in the regArray and finds the new position of the object while ignoring any remainder from division. Once the result is calculated, the Locator enters into the End State and outputs the location through the Loc port for 1 clock cycle.
