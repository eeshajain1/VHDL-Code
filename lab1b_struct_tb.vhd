LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE tb OF Testbench IS
    COMPONENT LFDetector_structural
	PORT(
		Fuel3: IN std_logic;
		Fuel2: IN std_logic;
		Fuel1: IN std_logic;
		Fuel0: IN std_logic;
		FuelWarningLight: OUT std_logic
		);
	END COMPONENT;
	
	--Inputs
	SIGNAL Fuel3 : std_logic := '0';
	SIGNAL Fuel2 : std_logic := '0';
	SIGNAL Fuel1 : std_logic := '0';
	SIGNAL Fuel0 : std_logic := '0';
	
	--OUTPUTS
	SIGNAL FuelWarningLight: std_logic;
			
   

BEGIN
    testObject : LFDetector_structural PORT MAP (Fuel3, Fuel2, Fuel1, Fuel0, FuelWarningLight);
    
    PROCESS
    BEGIN
		WAIT FOR 100 ns;
		Fuel3 <= '0'; Fuel2 <= '0'; Fuel1 <= '0'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '0'; Fuel1 <= '0'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '0'; Fuel1 <= '1'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '0'; Fuel1 <= '1'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '1'; Fuel1 <= '0'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '1'; Fuel1 <= '0'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '1'; Fuel1 <= '1'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '0'; Fuel2 <= '1'; Fuel1 <= '1'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '0'; Fuel1 <= '0'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '0'; Fuel1 <= '0'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '0'; Fuel1 <= '1'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '0'; Fuel1 <= '1'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '1'; Fuel1 <= '0'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '1'; Fuel1 <= '0'; Fuel0 <='1';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '1'; Fuel1 <= '1'; Fuel0 <='0';
		WAIT FOR 10 ns;
		Fuel3 <= '1'; Fuel2 <= '1'; Fuel1 <= '1'; Fuel0 <='1';
		WAIT;

    END PROCESS;



END tb;