library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BISTABLE is
	 Port ( Q, nQ : out  STD_LOGIC);
end BISTABLE;

architecture Structural of BISTABLE is
	component NOT_1
		port (Q : in std_logic;
				nQ : out std_logic);
	end component;

	signal Start: std_logic := '0';
	signal OutNQ: std_logic;
begin

	INVERT_START: NOT_1 port map (Q => Start, nQ => OutNQ);
	INVERT_Q: NOT_1 port map (Q => OutNQ, nQ => Q);
	
	nQ <= OutNQ;
end Structural;