LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TestBench_DECODER_N IS
		generic (N : integer := 4);
END TestBench_DECODER_N;
 
ARCHITECTURE behavior OF TestBench_DECODER_N IS 
 
    -- Component Declaration for the Unit Under Test (UUT)	
    COMPONENT DECODER_N
    PORT(
         d : IN  std_logic_vector(3 downto 0);
			CE : in std_logic;
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(3 downto 0) := (others => '0');
	signal ce : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	constant varPeriod : time := 10 ns;
   constant period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   beh: entity Work.DECODER_N(Behavioral) 
	GENERIC MAP(N => N)
	PORT MAP (
          d => d,
			 CE => ce,
          q => q
        );
	
	p1: process(d, CE, q)
	begin
		ce <= not ce after varPeriod;
	
		for i in 0 to N-1 loop
			d(i) <= not d(i) after varPeriod * 2**(i+1);
		end loop;
		
		
	end process;


END;
