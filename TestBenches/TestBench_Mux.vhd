LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TestBench_Mux IS
END TestBench_Mux;
 
ARCHITECTURE behavior OF TestBench_Mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal Z_Str, Z_Beh : std_logic;
	signal Error: std_logic;
 
   constant period : time := 120 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   struct: entity Work.Mux(Structural) PORT MAP (
          A => A,
          B => B,
          S => S,
          Z => Z_Str
        );
		  
	beh: entity Work.Mux(Behavioral) PORT MAP (
          A => A,
          B => B,
          S => S,
          Z => Z_Beh
        );

	A <= not A after period / 2;
	B <= not B after period / 4;
	S <= not S after period / 8;
	
	Error <= Z_Str xor Z_Beh;

END;
