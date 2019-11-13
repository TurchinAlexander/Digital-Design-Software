library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity T_TRIGGER is
    Port ( T, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end T_TRIGGER;

architecture Behavioral of T_TRIGGER is
	
	COMPONENT RS_LATCH
		PORT( S, R: IN STD_LOGIC;
				Q, nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	signal out_value: std_logic;
begin
	
	p1: process(CLOCK)
	begin
		if (CLOCK'EVENT and CLOCK = '1') then
			out_value <= not T;
		end if;
	end process;
	
	Q <= out_value;
	nQ <= not out_value;
end Behavioral;

