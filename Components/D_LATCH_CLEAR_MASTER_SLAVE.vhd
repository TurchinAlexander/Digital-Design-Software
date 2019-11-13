library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH_CLEAR_MASTER_SLAVE is
	port (D, CLR, CLOCK: in std_logic;
			Q, nQ: out std_logic);
end D_LATCH_CLEAR_MASTER_SLAVE;

architecture Behavioral of D_LATCH_CLEAR_MASTER_SLAVE is

	component D_LATCH_CLEAR	
		port (D, CLR, CLOCK: in std_logic;
				Q, nQ: out std_logic);
	end component;
	
	component INV_1
		port (Q: in std_logic;
				nQ: out std_logic);
	end component;

	signal nCLOCK, temp_Q: std_logic;
begin

	U0: INV_1 port map (CLOCK, nCLOCK);
	U1: D_LATCH_CLEAR port map (D, CLR, CLOCK, temp_Q, open);
	U2: D_LATCH_CLEAR port map (temp_Q, CLR, nCLOCK, Q, nQ);

end Behavioral;

