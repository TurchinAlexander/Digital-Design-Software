LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_SUM IS
END TestBench_SUM;
 
ARCHITECTURE behavior OF TestBench_SUM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUM_1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         P : IN  std_logic;
         Z : OUT  std_logic;
         Pn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal P : std_logic := '0';

 	--Outputs
   signal Z : std_logic;
   signal Pn : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUM_1 PORT MAP (
          A => A,
          B => B,
          P => P,
          Z => Z,
          Pn => Pn
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
