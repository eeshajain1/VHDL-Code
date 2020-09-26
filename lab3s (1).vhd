----------------------------------------------------------------------
-- EECS31L Assignment 3
-- Locator Structural Model
----------------------------------------------------------------------
-- Student First Name : Eesha
-- Student Last Name : Jain
-- Student ID : 78529929
----------------------------------------------------------------------

---------- Components library ----------

---------- 8x16 Register File ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY RegFile IS
   PORT (R_Addr1, R_Addr2, W_Addr: IN std_logic_vector(2 DOWNTO 0);
         R_en, W_en: IN std_logic;
         Reg_Data1 : OUT std_logic_vector(15 DOWNTO 0); 
	   	 Reg_Data2 : OUT std_logic_vector(15 DOWNTO 0); 
         W_Data: IN std_logic_vector(15 DOWNTO 0); 
         Clk, Rst: IN std_logic);
END RegFile;

ARCHITECTURE Beh OF RegFile IS 
   TYPE regArray_type IS 
      ARRAY (0 TO 7) OF std_logic_vector(15 DOWNTO 0); 
   SIGNAL regArray : regArray_type;
BEGIN
   WriteProcess: PROCESS(Clk)    
   BEGIN
      IF (Clk = '1' AND Clk'EVENT) THEN
         IF (Rst = '1') THEN
            regArray(0) <= X"0000" AFTER 6.0 NS;
            regArray(1) <= X"000B" AFTER 6.0 NS;
            regArray(2) <= X"0008" AFTER 6.0 NS;
            regArray(3) <= X"0003" AFTER 6.0 NS;
            regArray(4) <= X"0005" AFTER 6.0 NS;
            regArray(5) <= X"0000" AFTER 6.0 NS;
            regArray(6) <= X"0000" AFTER 6.0 NS;
            regArray(7) <= X"0000" AFTER 6.0 NS;
         ELSE
            IF (W_en = '1') THEN
                regArray(conv_integer(W_Addr)) <= W_Data AFTER 6.0 NS;
                END IF;
        END IF;
     END IF;
   END PROCESS;
            
   ReadProcess1: PROCESS(R_en, R_Addr1, regArray)
   BEGIN
      IF (R_en = '1') THEN
        CASE R_Addr1 IS
            WHEN "000" =>
                Reg_Data1 <= regArray(0) AFTER 6.0 NS;
            WHEN "001" =>
                Reg_Data1 <= regArray(1) AFTER 6.0 NS;
            WHEN "010" =>
                Reg_Data1 <= regArray(2) AFTER 6.0 NS;
            WHEN "011" =>
                Reg_Data1 <= regArray(3) AFTER 6.0 NS;
            WHEN "100" =>
                Reg_Data1 <= regArray(4) AFTER 6.0 NS;
            WHEN "101" =>
                Reg_Data1 <= regArray(5) AFTER 6.0 NS;
            WHEN "110" =>
                Reg_Data1 <= regArray(6) AFTER 6.0 NS;
            WHEN "111" =>
                Reg_Data1 <= regArray(7) AFTER 6.0 NS;
            WHEN OTHERS =>
                Reg_Data1 <= (OTHERS=>'0') AFTER 6.0 NS;
        END CASE;
      ELSE
        Reg_Data1 <= (OTHERS=>'0') AFTER 6.0 NS;
      END IF;
   END PROCESS;
	
	ReadProcess2: PROCESS(R_en, R_Addr2, regArray)
   BEGIN
      IF (R_en = '1') THEN
        CASE R_Addr2 IS
            WHEN "000" =>
                Reg_Data2 <= regArray(0) AFTER 6.0 NS;
            WHEN "001" =>
                Reg_Data2 <= regArray(1) AFTER 6.0 NS;
            WHEN "010" =>
                Reg_Data2 <= regArray(2) AFTER 6.0 NS;
            WHEN "011" =>
                Reg_Data2 <= regArray(3) AFTER 6.0 NS;
            WHEN "100" =>
                Reg_Data2 <= regArray(4) AFTER 6.0 NS;
            WHEN "101" =>
                Reg_Data2 <= regArray(5) AFTER 6.0 NS;
            WHEN "110" =>
                Reg_Data2 <= regArray(6) AFTER 6.0 NS;
            WHEN "111" =>
                Reg_Data2 <= regArray(7) AFTER 6.0 NS;
            WHEN OTHERS =>
                Reg_Data2 <= (OTHERS=>'0') AFTER 6.0 NS;
        END CASE;
      ELSE
        Reg_Data2 <= (OTHERS=>'0') AFTER 6.0 NS;
      END IF;
   END PROCESS;
END Beh;


---------- 16-Bit ALU ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY ALU IS
    PORT (Sel: IN std_logic;
            A: IN std_logic_vector(15 DOWNTO 0);
            B: IN std_logic_vector(15 DOWNTO 0);
            ALU_Out: OUT std_logic_vector (15 DOWNTO 0) );
END ALU;

ARCHITECTURE Beh OF ALU IS

BEGIN
    PROCESS (A, B, Sel)
         variable temp: std_logic_vector(31 DOWNTO 0):= X"00000000";
    BEGIN
        IF (Sel = '0') THEN
            ALU_Out <= A + B AFTER 12 NS;                
        ELSIF (Sel = '1') THEN
            temp := A * B ;
                ALU_Out <= temp(15 downto 0) AFTER 12 NS; 
        END IF;
          
    END PROCESS;
END Beh;


---------- 16-bit Shifter ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Shifter IS
   PORT (I: IN std_logic_vector(15 DOWNTO 0);
         Q: OUT std_logic_vector(15 DOWNTO 0);
         sel: IN std_logic );
END Shifter;

ARCHITECTURE Beh OF Shifter IS 
BEGIN
   PROCESS (I,sel) 
   BEGIN
         IF (sel = '1') THEN 
            Q <= I(14 downto 0) & '0' AFTER 4.0 NS;
         ELSE
            Q <= '0' & I(15 downto 1) AFTER 4.0 NS;
         END IF;   
   END PROCESS; 
END Beh;


---------- 2-to-1 Selector ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Selector IS
   PORT (sel: IN std_logic;
         x,y: IN std_logic_vector(15 DOWNTO 0);
         f: OUT std_logic_vector(15 DOWNTO 0));
END Selector;

ARCHITECTURE Beh OF Selector IS 
BEGIN
   PROCESS (x,y,sel)
   BEGIN
         IF (sel = '0') THEN
            f <= x AFTER 3.0 NS;
         ELSE
            f <= y AFTER 3.0 NS;
         END IF;   
   END PROCESS; 
END Beh;


---------- 16-bit Register ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Reg IS
   PORT (I: IN std_logic_vector(15 DOWNTO 0);
         Q: OUT std_logic_vector(15 DOWNTO 0);
         Ld: IN std_logic; 
         Clk, Rst: IN std_logic );
END Reg;

ARCHITECTURE Beh OF Reg IS 
BEGIN
   PROCESS (Clk)
   BEGIN
      IF (Clk = '1' AND Clk'EVENT) THEN
         IF (Rst = '1') THEN
            Q <= X"0000" AFTER 4.0 NS;
         ELSIF (Ld = '1') THEN
            Q <= I AFTER 4.0 NS;
         END IF;   
      END IF;
   END PROCESS; 
END Beh;

---------- 16-bit Three-state Buffer ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ThreeStateBuff IS
    PORT (Control_Input: IN std_logic;
          Data_Input: IN std_logic_vector(15 DOWNTO 0);
          Output: OUT std_logic_vector(15 DOWNTO 0) );
END ThreeStateBuff;

ARCHITECTURE Beh OF ThreeStateBuff IS
BEGIN
    PROCESS (Control_Input, Data_Input)
    BEGIN
        IF (Control_Input = '1') THEN
            Output <= Data_Input AFTER 2 NS;
        ELSE
            Output <= (OTHERS=>'Z') AFTER 2 NS;
        END IF;
    END PROCESS;
END Beh;

---------- Controller ----------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Controller IS
    PORT(R_en: OUT std_logic;
         W_en: OUT std_logic;
         R_Addr1: OUT std_logic_vector(2 DOWNTO 0);
		 R_Addr2: OUT std_logic_vector(2 DOWNTO 0);
         W_Addr: OUT std_logic_vector(2 DOWNTO 0);
         Shifter_Sel: OUT std_logic;
         Selector_Sel: OUT std_logic;
         ALU_sel : OUT std_logic;
         OutReg_Ld: OUT std_logic;
         Oe: OUT std_logic;
         Done: OUT std_logic;
         Start, Clk, Rst: IN std_logic); 
END Controller;


ARCHITECTURE Beh OF Controller IS

-------------------------------------------------------
-- Hint:
-- Controller shall consist of a CombLogic process 
-- containing case-statement and a StateReg process.
--      
-------------------------------------------------------

 -- add your code here
    
SUBTYPE StateType is STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL CurrentState, NextState: StateType;


BEGIN

CtrlCombLogic: PROCESS(CurrentState, Start)


	BEGIN	
		CASE CurrentState IS
			WHEN "0000" =>
				W_en <= '0';
				R_en <= '0';
				Oe <= '0';
				OutReg_Ld <= '0';
				Done <= '0';
				
			IF (Start = '0') THEN  
				Nextstate <= "0000" after 44 ns;
			ELSE	
			    Nextstate <= "0001" after 44 ns;
			END IF;
				
				WHEN "0001" => 
					Nextstate <= "0010" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "010";
					R_Addr2 <= "010";
					W_addr <= "101";
					Alu_sel <= '1';
					Selector_Sel <= '1';
					OutReg_Ld <= '0';
					Oe <= '0';
					Done <= '0'; 
					
					
				WHEN "0010" => 
					Nextstate <= "0011" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "001";
					R_Addr2 <= "101";
					W_addr <= "101";
					Alu_sel <= '1';
					Selector_Sel <= '1';
					OutReg_Ld <= '0';
					Oe <= '0';
					Done <= '0'; 
					
				WHEN "0011" => 
					Nextstate <= "0101" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "101";
					W_addr <= "101";
					Shifter_Sel <= '0';
					Selector_Sel <= '0';
					OutReg_Ld <= '0';
					Oe <= '0';
					Done <= '0'; 
					
				WHEN "0101" =>
					Nextstate <= "0110" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "101"; --reg(5) .5at^2
					R_Addr2 <= "100"; --   + reg(4),    x(0) 
					W_addr <= "111";
					Alu_sel <= '0';
					Selector_Sel <= '1';
					OutReg_Ld <= '0';
					Oe <= '0';
					Done <= '0'; 
					
				WHEN "0110" =>
					Nextstate <= "0111" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "011"; --reg(3) vo
					R_Addr2 <= "010"; -- * reg(2) t 
					W_Addr <= "110"; --reg(6)
					ALU_sel <= '1';
					Selector_Sel <= '1';
					OutReg_Ld <= '0';
					Oe <= '0';
					Done <= '0';
					
				WHEN "0111" => --add reg array 6 and reg array 7 110 and 111
					Nextstate <= "1111" after 44 ns;
					R_en <= '1';
					W_en <= '1';
					R_Addr1 <= "110";
					R_Addr2 <= "111";
					W_Addr <= "111";
					ALU_sel <= '0';
					Selector_Sel <= '1';
					OutReg_Ld <= '1';
					Oe <= '0';
					Done <= '0';
				WHEN "1111" =>
				    Nextstate <= "0000" after 44 ns;
				    R_en <= '1';
				    W_en <= '0';
				    R_Addr1 <= "111";
				    R_Addr2 <= "000";
				    W_Addr <= "111";
				    Alu_sel <= '0';
				    Selector_sel <= '1';
				    OutReg_Ld <= '0';
				    Oe <= '1';
				    Done <= '1';
				    
				WHEN OTHERS =>
					
					
	END CASE;
		
	END PROCESS CtrlCombLogic;	
	
    Process (Clk, Rst)
	BEGIN
	
	    IF rising_edge(Clk) THEN
			IF (Rst = '1') THEN
				CurrentState <= "0000";
			ELSE
				CurrentState <= Nextstate;
			END IF;
		END IF;
    End Process; 		

END Beh;


---------- Locator (with clock cycle =  44 NS )----------
--         INDICATE YOUR CLOCK CYCLE TIME ABOVE      ----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Locator_struct is
    Port ( Start : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Loc : out  STD_LOGIC_VECTOR (15 downto 0);
           Done : out  STD_LOGIC);
end Locator_struct;

architecture Struct of Locator_struct is
    
    COMPONENT RegFile IS
        PORT (  R_Addr1, R_Addr2, W_Addr: IN std_logic_vector(2 DOWNTO 0);
                R_en, W_en: IN std_logic;
                Reg_Data1: OUT std_logic_vector(15 DOWNTO 0); 
				Reg_Data2: OUT std_logic_vector(15 DOWNTO 0);
                W_Data: IN std_logic_vector(15 DOWNTO 0); 
                Clk, Rst: IN std_logic );
    END COMPONENT;
    
    COMPONENT ALU IS
        PORT (Sel: IN std_logic;
                A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
                B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
                ALU_Out: OUT STD_LOGIC_VECTOR (15 DOWNTO 0) );
    END COMPONENT;

    COMPONENT Shifter IS
         PORT (I: IN std_logic_vector(15 DOWNTO 0);
               Q: OUT std_logic_vector(15 DOWNTO 0);
               sel: IN std_logic );
    END COMPONENT;

    COMPONENT Selector IS
        PORT (sel: IN std_logic;
              x,y: IN std_logic_vector(15 DOWNTO 0);
              f: OUT std_logic_vector(15 DOWNTO 0) );
    END COMPONENT;
   
    COMPONENT Reg IS
        PORT (I: IN std_logic_vector(15 DOWNTO 0);
              Q: OUT std_logic_vector(15 DOWNTO 0);
              Ld: IN std_logic; 
              Clk, Rst: IN std_logic );
    END COMPONENT;
    
    COMPONENT ThreeStateBuff IS
        PORT (Control_Input: IN std_logic;
              Data_Input: IN std_logic_vector(15 DOWNTO 0);
              Output: OUT std_logic_vector(15 DOWNTO 0) );
    END COMPONENT;
    
    COMPONENT Controller IS
       PORT(R_en: OUT std_logic;
            W_en: OUT std_logic;
            R_Addr1: OUT std_logic_vector(2 DOWNTO 0);
			R_Addr2: OUT std_logic_vector(2 DOWNTO 0);
            W_Addr: OUT std_logic_vector(2 DOWNTO 0);
            Shifter_sel: OUT std_logic;
            Selector_sel: OUT std_logic;
            ALU_sel : OUT std_logic;
            OutReg_Ld: OUT std_logic;
            Oe: OUT std_logic;
            Done: OUT std_logic;
            Start, Clk, Rst: IN std_logic); 
     END COMPONENT;

-- do not modify any code above this line
-- add signals needed below. hint: name them something you can keep track of while debugging/testing
-- add your code starting here
	SUBTYPE Statetype IS std_logic_vector(3 downto 0);
	SIGNAL CurrentState, Nextstate: Statetype;
	SIGNAL R_Addr1, R_Addr2, W_Addr: std_logic_vector(2 downto 0);
	SIGNAL R_en, W_en: std_logic;
	SIGNAL Reg_Data1, Reg_Data2: std_logic_vector(15 downto 0);
	
	SIGNAL ALU_Sel, Selector_sel, Shifter_sel: std_logic;
	SIGNAL ALU_out, Shifter_Output, Selector_Output, Result: std_logic_vector(15 downto 0);
	
	SIGNAL OutReg_Ld: std_logic;
	SIGNAL Oe: std_logic; 

	
	

BEGIN
	
	Controller_1: Controller PORT MAP (R_en, W_en, R_Addr1, R_Addr2, W_Addr, Shifter_Sel, Selector_Sel, ALU_Sel, OutReg_Ld, Oe, Done, Start, Clk, Rst);
	ALU_1: ALU PORT MAP ( ALU_sel, Reg_Data1, Reg_Data2, Alu_out); --multiplies
	SHIFTER_1: Shifter PORT MAP (Reg_Data1, Shifter_Output, Shifter_Sel); --divides
	SELECTOR_1: Selector PORT MAP (Selector_Sel, Shifter_Output, ALU_Out, Selector_Output); --chooses either the shifter or selector output
	RegFile_2: RegFile PORT MAP (R_Addr1, R_Addr2, W_Addr, R_en, W_en, Reg_Data1, Reg_Data2, Selector_Output, Clk, Rst); --puts the selector output into the regArray(W_addr)
	REG_1: Reg PORT MAP (Selector_Output, Result, OutReg_Ld, Clk, Rst);
	ThreeState1: ThreeStateBuff PORT MAP (Oe, Result, Loc);
	
	
	
	
	
	
	
end Struct;
