----------------------------------------------------------------------
-- Digital Design Lab
-- LFD Structural Model
----------------------------------------------------------------------
-- Student First Name : Eesha
-- Student Last Name : Jain
-- Student ID : 78529929
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY NAND2 IS
   PORT (x: IN std_logic;
         y: IN std_logic;
         F: OUT std_logic);
END NAND2;  

ARCHITECTURE behav OF NAND2 IS
BEGIN
   PROCESS(x, y)
   BEGIN
      F <= NOT (x and y) AFTER 1.4 ns; 
   END PROCESS;
END behav;
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY LFDetector_structural IS
   PORT (Fuel3, Fuel2, Fuel1, Fuel0: IN std_logic;
         FuelWarningLight: OUT std_logic);
END LFDetector_structural;

ARCHITECTURE Structural OF LFDetector_structural IS

-- add your code here
    COMPONENT NAND2 IS
        PORT (  x: IN std_logic;
                y: IN std_logic;
                F: OUT std_logic);
    END COMPONENT;
     
    SIGNAL n1: std_logic;
    SIGNAL n2: std_logic;
    SIGNAL n3: std_logic;
    SIGNAL n4: std_logic;
	SIGNAL n5: std_logic;
	SIGNAL n6: std_logic;

BEGIN
	
    Nand_1: NAND2 PORT MAP(Fuel3, Fuel3, n1);
    Nand_2: NAND2 PORT MAP(Fuel1, Fuel1, n2);
    Nand_3: NAND2 PORT MAP(Fuel0, Fuel0, n3);
    Nand_4: NAND2 PORT MAP(n2, n3, n4);
    Nand_5: NAND2 PORT MAP(Fuel2, n4, n5);
	Nand_6: NAND2 PORT MAP(n1, n5, n6);
	Nand_7: NAND2 PORT MAP(n6, n6, FuelWarningLight);
END Structural;