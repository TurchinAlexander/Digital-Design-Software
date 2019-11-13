LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_D_LATCH_ACCESS IS
END TestBench_D_LATCH_ACCESS;
 
ARCHITECTURE behavior OF TestBench_D_LATCH_ACCESS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_LATCH_ACCESS
    PORT(
         D : IN  std_logic;
         E : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_LATCH_ACCESS PORT MAP (
          D => D,
          E => E,
          Q => Q,
          nQ => nQ
        );
	
	E <= not E after period;
	D <= not D after period / 2;

END;
