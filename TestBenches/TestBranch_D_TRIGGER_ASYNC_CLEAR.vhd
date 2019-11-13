LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBranch_D_TRIGGER_ASYNC_CLEAR IS
END TestBranch_D_TRIGGER_ASYNC_CLEAR;
 
ARCHITECTURE behavior OF TestBranch_D_TRIGGER_ASYNC_CLEAR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_TRIGGER_ASYNC_CLEAR
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         CLR : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal CLR : std_logic := '0';
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
   uut: D_TRIGGER_ASYNC_CLEAR PORT MAP (
          D => D,
          C => C,
          CLR => CLR,
          Q => Q,
          nQ => nQ
        );
	
	CLR <= not CLR after period;
	D <= not D after period / 2;
	C <= not C after period / 4;

END;
