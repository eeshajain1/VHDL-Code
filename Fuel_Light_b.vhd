----------------------------------------------------------------------
-- Digital Design Lab
-- Fuel Light Detector
----------------------------------------------------------------------
-- Student First Name : Eesha
-- Student Last Name : Jain
-- Student ID : 78529929
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY LFDetector IS
	PORT(	Fuel3: IN std_logic;
			Fuel2: IN std_logic;
			Fuel1: IN std_logic;
			Fuel0: IN std_logic;
			F: OUT std_logic);
END LFDetector;  


ARCHITECTURE behav OF LFDetector IS

  -- add your code here
BEGIN
  -- Equation: Fuel3'Fuel1'Fuel0' + Fuel3'Fuel2'
  F <= ((NOT(Fuel3) AND NOT(Fuel1) AND NOT(Fuel0)) OR (NOT(Fuel3) AND NOT(Fuel2))) AFTER 8.2 ns;
END behav;