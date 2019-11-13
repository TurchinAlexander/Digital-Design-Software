LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBanch_DeMux IS
END TestBanch_DeMux;
 
ARCHITECTURE behavior OF TestBanch_DeMux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DeMux
    PORT(
         X : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         F0 : OUT  std_logic;
         F1 : OUT  std_logic;
         F2 : OUT  std_logic;
         F3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';

 	--Outputs
   signal F0_Str, F1_Str, F2_Str, F3_Str : std_logic;
   signal F0_Beh, F1_Beh, F2_Beh, F3_Beh : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	signal Error : std_logic;
   constant period : time := 120 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   struct: entity Work.DeMux(Structural) PORT MAP (
          X => X,
          A1 => A1,
          A2 => A2,
          F0 => F0_Str,
          F1 => F1_Str,
          F2 => F2_Str,
          F3 => F3_Str
        );
		  
	Beh: entity Work.DeMux(Behavioral) PORT MAP (
          X => X,
          A1 => A1,
          A2 => A2,
          F0 => F0_Beh,
          F1 => F1_Beh,
          F2 => F2_Beh,
          F3 => F3_Beh
        );

	X <= not X after period / 2;
	A1 <= not A1 after period / 4;
	A2 <= not A2 after period / 8;
	
	Error <= (F0_Str xor F0_Beh) and (F1_Str xor F1_Beh) and (F2_Str xor F2_Beh) and (F3_Str xor F3_Beh);

END;
