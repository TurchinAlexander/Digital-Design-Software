library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_2 is
	Port( A, B : in std_logic;
			Z: out std_logic);
end AND_2;

architecture Behavioral of And_2 is

begin
	Z <= A and B;

end Behavioral;

