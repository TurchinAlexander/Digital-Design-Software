library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use UNISIM.VComponents.all;

entity D_LATCH_CLEAR is
    Port ( D, CLR, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_LATCH_CLEAR;

architecture Behavioral of D_LATCH_CLEAR is
	signal out_value: STD_LOGIC;
begin

	P1: process(CLOCK, CLR)
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

