library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_TRIGGER is
    Port ( D, C : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_TRIGGER;

architecture Behavioral of D_TRIGGER is
	signal out_value: std_logic;
begin
	p1: process(D, C)
	begin
		if (C'EVENT and C = '1') then
			out_value <= D;
		end if;
	end process;

	Q <= out_value;
	nQ <= not out_value;
end Behavioral;
