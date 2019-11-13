library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_TRIGGER_ASYNC_INIT is
    Port ( D, PRE, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_TRIGGER_ASYNC_INIT;

architecture Behavioral of D_TRIGGER_ASYNC_INIT is
	signal out_value: std_logic;
begin
	p1: process(CLOCK, PRE)
	begin
		if PRE = '1' then
			out_value <= '1';
		elsif (CLOCK'EVENT and CLOCK = '1') then
			out_value <= D;
		end if;
	end process;

	Q <= out_value;
	nQ <= not out_value;

end Behavioral;

