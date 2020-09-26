----------------------------------------------------------------------
-- EECS31L Assignment 2
-- FSM Structural Model
----------------------------------------------------------------------
-- Student First Name : Eesha
-- Student Last Name : Jain
-- Student ID : 78529929
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab2s_FSM IS
     Port (Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
END Lab2s_FSM;

ARCHITECTURE Structural OF Lab2s_FSM IS

	SUBTYPE StateType is STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL Current_State, Next_State: StateType := "0000";

BEGIN

CombLogic: PROCESS(Input, Current_State)
	BEGIN
	
	Next_State(3) <= (((not current_state(3)) and (not current_state(2)) and current_state(1) and (not current_state(0)) and input(2) )  OR 
	
		((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND (not current_state(0)) and Input(2)) OR 
		
	    (not current_state(3) and current_state(2) and current_state(1) and not current_state(0)and not input(2) and input(1) and not input(0))
	    
	    or (not current_state(3) and current_state(2) and current_state(1) and not current_state(0)and input(2)) ) AFTER 10.6 NS;
	    
	
	Next_State(2) <= ((NOT Current_State(3)) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND (NOT Current_State(0)) AND Input(2) AND (NOT Input(1)) AND (NOT Input(0)))
		
		OR((NOT Current_State(3)) AND (NOT Current_State(2)) AND Current_State(1) AND (NOT Current_State(0)) AND (NOT Input(2)) AND Input(1) AND (NOT Input(0))) 
		
		OR ((NOT Current_State(3) AND (NOT Current_State(2)) AND Current_State(1) AND Current_State(0) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0)))) 
		
		OR (((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND not Current_State(0)) AND (((NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR 
		((NOT Input(2)) AND (NOT Input(1)) AND Input(0)) OR ((NOT Input(2)) AND Input(1) AND (NOT Input(0)))))
		
		OR (((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND Current_State(0)) AND (((NOT Input(2)) and (NOT Input(1)) and (NOT Input(0))) OR 
		((NOT Input(2)) AND Input(1)) OR ((NOT Input(2)) AND Input(0)) OR(Input(2))))
		
		OR (((NOT Current_State(3)) AND Current_State(2) AND Current_State(1) AND (NOT Current_State(0))) AND (((NOT Input(2)) AND (NOT Input(1)) 
		AND (NOT Input(0))) OR ((NOT Input(2)) AND (NOT Input(1)) AND Input(0)))) AFTER 10.6 NS;
		
	
	Next_State(1) <= (((NOT Current_State(3)) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND (NOT Current_State(0))) AND (((NOT Input(2)) AND Input(1) AND (NOT Input(0)))OR(Input(2) AND (NOT Input(1)) AND (NOT Input(0))))) OR 
		((NOT Current_State(3)) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND Current_State(0) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR 
		(((NOT Current_State(3)) AND (NOT Current_State(2)) AND Current_State(1) AND (NOT Current_State(0))) AND (((NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR 
		((NOT Input(2)) AND (NOT Input(1)) AND Input(0)))) OR 
		(((NOT Current_State(3)) AND (NOT Current_State(2)) AND Current_State(1) AND Current_State(0)) AND (((NOT Input(2)) AND Input(1)) OR ((NOT Input(2)) AND Input(0)) OR (Input(2)))) OR
		((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND (NOT Current_State(0)) AND (NOT Input(2)) AND Input(1) AND (NOT Input(0))) OR 
		((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND Current_State(0) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR 
		(((NOT Current_State(3)) AND Current_State(2) AND Current_State(1) AND (NOT Current_State(0))) AND (((NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) 
		OR ((NOT Input(2)) AND (NOT Input(1)) AND Input(0)))) AFTER 10.6 NS;
	
 	Next_State(0) <= (((NOT Current_State(3)) AND (NOT Current_State(0)) AND (NOT Current_State(1)) AND (NOT Current_State(0))) AND 
		(((NOT Input(2)) AND (NOT Input(1)) AND Input(0)) OR ((NOT Input(2)) AND Input(1) AND (NOT Input(0))) OR (Input(2) AND (NOT Input(1)) AND (NOT Input(0)))))
		 
		OR (((NOT Current_State(3)) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND Current_State(0)) 
		AND (((NOT Input(2)) AND Input(1)) OR ((NOT Input(2)) AND Input(0)) OR (Input(2))))
		
		OR ((not current_state(3) and not current_state(2) and current_state(1) and not current_state(0)) and ((not input(2) and not input(1) and input(0)) or (not input(2) 
		and input(1) and not input(0))))
		
		OR ((not current_state(3) and not current_state(2) and current_state(1) and current_state(0)) and ((not input(2) and input(1)) or (not input(2) and input(0)) or (input(2))))
		
		OR ((not current_state(3) and current_state(2) and not current_state(1) and not current_state(0)) and ((not input(2) and not input(1) and input(0)) or 
		(not input(2) and input(1) and not input(0))))
		
		OR ((not current_state(3) and current_state(2) and not current_state(1) and current_state(0)) and ((not input(2) and input(1)) or (not input(2) and input(0)) or (input(2))))
		
		OR (not current_state(3) and current_state(2) and current_state(1) and not current_state(0) and not input(2) and not input(1) and input(0)) 
		
		AFTER 10.6 NS;
	
	
	ReturnChange <= ((NOT Current_State(3)) AND (NOT Current_State(2)) AND Current_State(1) AND (NOT Current_State(0)) AND Input(2)) OR 
	
		((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND (NOT Current_State(0)) AND Input(2)) OR
		
		(((NOT Current_State(3)) AND Current_State(2) AND Current_State(1) AND (NOT Current_State(0))) AND (((NOT Input(2))
		 AND Input(1) AND (NOT Input(0))) OR (Input(2))))
		 
		 OR (Current_State(3) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND (NOT Current_State(0))) AFTER 10.6 ns;
	
	Permit <= ((NOT Current_State(3)) AND (NOT Current_State(2)) AND (NOT Current_State(1)) AND (NOT Current_State(0)) AND Input(2) AND (NOT Input(1)) 
	     AND (NOT Input(0))) OR
	     
		((NOT Current_State(3)) AND Current_State(2) AND (NOT Current_State(1)) AND (NOT Current_State(0)) AND (NOT Input(2)) AND Input(1) 
		AND (NOT Input(0))) OR
		
		((NOT Current_State(3)) AND Current_State(2) AND Current_State(1) AND (NOT Current_State(0)) AND (NOT Input(2)) AND (NOT Input(1)) AND Input(0)) OR
		
		((NOT Current_State(3)) AND Current_State(2) AND Current_State(1) AND Current_State(0)) AFTER 10.6 NS;
	
		
	
	
	END PROCESS CombLogic;

StateRegister: Process (Clk)
 BEGIN
 
 if(clk = '1' AND clk'EVENT ) then
    Current_State <= Next_State;
  end if;
 END PROCESS StateRegister;

END Structural;