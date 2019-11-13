LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_D_TRIGGER IS
END TestBench_D_TRIGGER;
 
ARCHITECTURE behavior OF TestBench_D_TRIGGER IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_TRIGGER
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_TRIGGER PORT MAP (
          D => D,
          C => C,
          Q => Q,
          nQ => nQ
        );

	D <= not D after period;
	C <= not C after period / 2;
	
END;
