LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_RS_LATCH IS
END TestBench_RS_LATCH;
 
ARCHITECTURE behavior OF TestBench_RS_LATCH IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_LATCH
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN

--	-- Instantiate the Unit Under Test (UUT)
--   uut: entity work.RS_LATCH(PARAM) PORT MAP (
--          S => S,
--          R => R,
--          Q => Q,
--          nQ => nQ
--        );
--
--	p1 : process
--	begin
--		R <= '1' ;
--		S <= '1' ;
--
--		wait for period;
--
--		R <= '0';
--		S <= '0';
--		
--		wait;
--
--	end process;

	uut: entity work.RS_LATCH(BEH) port map (
		S => S,
		R => R,
		Q => Q,
		nQ => nQ
	);
	
	R <= not R after period * 2;
	S <= not S after period;
	
END;
