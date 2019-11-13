LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_D_LATCH_CLEAR IS
END TestBench_D_LATCH_CLEAR;
 
ARCHITECTURE behavior OF TestBench_D_LATCH_CLEAR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_LATCH_CLEAR
    PORT(
         D : IN  std_logic;
         CLR : IN  std_logic;
			CLOCK: IN std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal CLR : std_logic := '0';
	signal CLOCK : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_LATCH_CLEAR PORT MAP (
          D => D,
          CLR => CLR,
			 CLOCK => CLOCK,
          Q => Q,
          nQ => nQ
        );

	CLR <= not CLR after period;
	D <= not D after period / 2;
	CLOCK <= not CLOCK after period / 4;

END;
