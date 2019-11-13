LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_RS_TRIGGER IS
END TestBench_RS_TRIGGER;
 
ARCHITECTURE behavior OF TestBench_RS_TRIGGER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_TRIGGER
    PORT(
         R : IN  std_logic;
         S : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal R : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_TRIGGER PORT MAP (
          R => R,
          S => S,
          Q => Q,
          nQ => nQ
        );

	R <= not R after period;
	S <= not S after period / 2;


END;
