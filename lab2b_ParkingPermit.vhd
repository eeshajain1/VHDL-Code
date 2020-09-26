----------------------------------------------------------------------
-- EECS31L Assignment 2
-- FSM Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Eesha 
-- Student Last Name : Jain
-- Student ID : 78529929
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Lab2b_FSM is
    Port ( Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
end Lab2b_FSM;

architecture Behavioral of Lab2b_FSM is

-- DO NOT modify any signals, ports, or entities above this line
-- Recommendation: Create 2 processes (one for updating state status and the other for describing transitions and outputs)
-- Figure out the appropriate sensitivity list of both the processes.
-- Use CASE statements and IF/ELSE/ELSIF statements to describe your processes.
-- add your code here
	TYPE STATETYPE IS
		(Start, Five, Five_Wait, Ten, Ten_Wait, Fifteen, Fifteen_Wait, PrintPermit, Refund);
		SIGNAL Current_state, Next_state: STATETYPE;

BEGIN
	CombLogic: PROCESS(Input, Current_State)
	 BEGIN
		CASE Current_state IS
		 WHEN Start =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then
			Next_state <= Start;
		   elsif (Input = "001") then
			Next_state <= Five;
		   elsif (Input = "010") then
		    Next_state <= Ten;
		   elsif (Input <= "100") then
		    Next_state <= PrintPermit;
		   else
			Next_state <= Start;
		   end if;
		 
		 WHEN Five =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Five_Wait;
		   else
			Next_state <= Five;
		   end if;
		
		 WHEN Five_Wait =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Five_Wait;
		   elsif (Input = "001") then --$5
			Next_state <= Ten;
		   elsif (Input = "010") then --$10
		    Next_state <= Fifteen;
		   elsif (Input <= "100") then --$20
		    Next_state <= Refund;
		   elsif (Input <= "111") then --Refund
			Next_state <= Refund;
		   else
			Next_state <= Five_Wait;
		   end if;
		   
		 WHEN Ten =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Ten_wait;
		   else
			Next_state <= Ten;
		   end if;
		   
		 WHEN Ten_Wait =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Ten_Wait;
		   elsif (Input = "001") then --$5
			Next_state <= Fifteen;
		   elsif (Input = "010") then --$10
		    Next_state <= PrintPermit;
		   elsif (Input <= "100") then --$20
		    Next_state <= Refund;
		   elsif (Input <= "111") then --Refund
			Next_state <= Refund;
		   else
			Next_state <= Ten_Wait;
		   end if;
		
		   
		 WHEN Fifteen =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Fifteen_Wait;
		   else
			Next_state <= Fifteen;
		   end if;
		   
	     WHEN Fifteen_Wait =>
		  Permit <= '0';
		  ReturnChange <= '0';
		   if (Input = "000") then --$0
			Next_state <= Fifteen_Wait;
		   elsif (Input = "001") then --$5
			Next_state <= PrintPermit;
		   elsif (Input = "010") then --$10
		    Next_state <= Refund;
		   elsif (Input <= "100") then --$20
		    Next_state <= Refund;
		   elsif (Input <= "111") then --Refund
			Next_state <= Refund;
		   else
			Next_state <= Fifteen_Wait;
		   end if;
		   
		 WHEN PrintPermit =>
		  Permit <= '1';
		  ReturnChange <= '0';
		   Next_state <= Start;
		 
		 WHEN Refund =>
		  Permit <= '0';
		  ReturnChange <= '1';
		   Next_state <= Start;
	 end case;
end PROCESS CombLogic;


StateRegister: Process (Clk)
 BEGIN
 
 if(clk = '1' AND clk'EVENT ) then
    Current_State <= Next_State;
  end if;
 END PROCESS StateRegister;
 
END Behavioral;
 
	
		   
		 
		   
		   

		 
		 
		   
		
		
		 
		 
		 
		 
		
		
	
