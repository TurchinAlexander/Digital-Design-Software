LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_BISTABLE IS
END TestBench_BISTABLE;
 
ARCHITECTURE behavior OF TestBench_BISTABLE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BISTABLE
    PORT(
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

 	--Outputs
   signal Q, nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port nam e 
 
   constant period : time := 10 ns;
 
BEGIN
--	 Instantiate the Unit Under Test (UUT)
   str: BISTABLE PORT MAP (
          Q => Q,
          nQ => nQ
        );

END;
