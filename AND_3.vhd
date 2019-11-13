library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_3 is
	port (A, B, C : in std_logic;
			Z : out std_logic);
end And_3;

architecture Behavioral of And_3 is
component And_2
	port (A, B : in std_logic;
			Z : out std_logic);
end component;

signal R1: std_logic;
begin
	AND_A_B: And_2 port map (A, B, R1);
	ABD_PREV_C: And_2 port map (R1, C, Z);

end Behavioral;

