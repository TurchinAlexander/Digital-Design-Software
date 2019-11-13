LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_D_TRIGGER_ACCESS IS
END TestBench_D_TRIGGER_ACCESS;
 
ARCHITECTURE behavior OF TestBench_D_TRIGGER_ACCESS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_TRIGGER_ACCESS
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         CE : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CE : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_TRIGGER_ACCESS PORT MAP (
          D => D,
          C => C,
          CE => CE,
          Q => Q,
          nQ => nQ
        );
	
	D <= not D after period;
	CE <= not CE after period / 2;
	C <= not C after period / 4;

END;
