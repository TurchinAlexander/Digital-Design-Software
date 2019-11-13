library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Invert is
	Port( Q: in std_logic;
			nQ: out std_logic);
end Invert;

architecture Behavioral of Invert is

begin
	nQ <= not Q;

end Behavioral;

