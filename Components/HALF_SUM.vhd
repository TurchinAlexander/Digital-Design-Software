library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HALF_SUM is
	port (A, B: in std_logic;
			C, P: out std_logic);
end HALF_SUM;

architecture Behavioral of HALF_SUM is
component Xor_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;

component And_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;
begin
	FIND_P: And_2 port map (A, B, P);
	FIND_C: Xor_2 port map (A, B, C);
end Behavioral;

