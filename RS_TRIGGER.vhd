----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:46:06 10/24/2019 
-- Design Name: 
-- Module Name:    RS_TRIGGER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RS_TRIGGER is
    Port ( R, S, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end RS_TRIGGER;

architecture Behavioral of RS_TRIGGER is
	signal out_value: std_logic;
begin
	p1: process(CLOCK)
	begin
		if (CLOCK'EVENT and CLOCK = '1') then
			if (R = '0' and S = '1') then
				out_value <= '0';
			elsif (R = '1' and S = '0') then
				out_value <= '1';
			elsif (R = '1' and S = '1') then
				out_value <= 'Z';
			end if;
		end if;
	end process;

	Q <= out_value;
	nQ <= not out_value;

end Behavioral;
