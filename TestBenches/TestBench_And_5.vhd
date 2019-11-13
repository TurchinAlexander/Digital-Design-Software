LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_And_5 IS
END TestBench_And_5;
 
ARCHITECTURE behavior OF TestBench_And_5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT And_5
    PORT(
         A : IN  std_logic_vector(4 downto 0);
         R : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal R_Str, R_Beh : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	signal Error : std_logic;
   constant period : time := 320 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   struct: entity Work.And_5(Structural) PORT MAP (
          A => A,
          R => R_Str
        );
		  
	behavioral: entity Work.And_5(Behavioral) PORT MAP (
          A => A,
          R => R_Beh
        );
		  
	A(4) <= not A(4) after period / 2;
	A(3) <= not A(3) after period / 4;
	A(2) <= not A(2) after period / 8;
	A(1) <= not A(1) after period / 16;		  
	A(0) <= not A(0) after period / 32;

	Error <= R_Str xor R_Beh;
END;
