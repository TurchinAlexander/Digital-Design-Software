library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or_2 is
	Port( A, B : in std_logic;
			Z : out std_logic); 
end Or_2;

architecture Behavioral of Or_2 is

begin
	Z <= A or B;

end Behavioral;

