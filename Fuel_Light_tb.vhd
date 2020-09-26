LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE tb OF Testbench IS
    COMPONENT LFDetector IS
    	PORT(	Fuel3: IN std_logic;
                Fuel2: IN std_logic;
				Fuel1: IN std_logic;
				Fuel0: IN std_logic;
                F: OUT std_logic);
    END COMPONENT;
    
    SIGNAL Fuel3, Fuel2 ,Fuel1, Fuel0, F: std_logic;

BEGIN
    testObject : LFDetector PORT MAP (Fuel3, Fuel2, Fuel1, Fuel0, F);
    
    PROCESS
    BEGIN
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