library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_TRIGGER_ASYNC_CLEAR is
    Port ( D, CLR, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_TRIGGER_ASYNC_CLEAR;

architecture Behavioral of D_TRIGGER_ASYNC_CLEAR is
	signal out_value: std_logic;
begin
	p1: process(CLOCK, CLR)
	begin
		if CLR = '1' then
			out_value <= '0';
		elsif (CLOCK'EVENT and CLOCK = '1') then
			out_value <= D;
		end if;
	end process;

	Q <= out_value;
	nQ <= not out_value;

end Behavioral;

