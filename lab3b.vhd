----------------------------------------------------------------------

-- Locator Behavioral Model

----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


entity Locator_beh  is
    Port ( Start : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Loc : out  STD_LOGIC_VECTOR (15 downto 0);
           Done : out  STD_LOGIC);
end Locator_beh;

architecture Behavioral of Locator_beh  is

   TYPE regArray_type IS 
      ARRAY (0 TO 7) OF std_logic_vector(15 DOWNTO 0); 
   SIGNAL regArray : regArray_type :=  (X"0000", X"000B", X"0008", X"0003", X"0005", X"0000", X"0000", X"0000");     


	TYPE Statetype IS (Start_State, Computation_State, Second_Comp_State, End_State);
	SIGNAL Currentstate, Nextstate: Statetype;
	
BEGIN
	CombLogic: PROCESS (Clk, CurrentState, Start)
	variable temp1: std_logic_vector(31 downto 0) := X"00000000";
	variable temp2: std_logic_vector(31 downto 0) := X"00000000";
	variable temp3: std_logic_vector(31 downto 0) := X"00000000";
	variable temp4: std_logic_vector(15 downto 0) := X"0000";
	variable temp5: std_logic_vector(15 downto 0) := X"0000";
	
	BEGIN
		CASE CurrentState IS
			WHEN Start_State => 
			Done <= '0';
			LOC <= (OTHERS => 'Z');
			if(Start = '0') then
				Nextstate <= Start_State;
			else 
				Nextstate <= Computation_State;
				
			end if;
			WHEN Computation_State =>
				Done <= '0';
				LOC <= (OTHERS => 'Z');
				temp1 :=  regArray(1) * regArray(2); --a*t
				temp5 := temp1(15 downto 0);
				temp2 :=  temp5 * regArray(2); --at^2
				regArray(5) <= '0' & temp2(15 downto 1);  --at^2 divided by 2
				temp3 := regArray(3) * regArray(2);
				regArray(6) <= temp3(15 downto 0);
				Nextstate <= Second_Comp_State;
			WHEN Second_Comp_State =>
				Done <= '0';
				LOC <= (OTHERS => 'Z');
				temp4 := regArray(5) + regArray(6);
				regArray(7) <= temp4 + regArray(4);
				Nextstate <= End_State;
			WHEN End_State =>
				Done <= '1';
				Loc <= regArray(7);
				Nextstate <= Start_State;
				
		END CASE;
		
	END PROCESS CombLogic;	
	StateRegister: Process (clk)
 begin
 -- State Register Process
   if(clk = '1' AND Clk'Event AND rst = '1')then
    Currentstate <= Start_State;
   else
    Currentstate <= Nextstate after 4 ns;
   end if;
 end Process StateRegister;
	

END Behavioral;

