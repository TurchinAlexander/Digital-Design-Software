----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:56 10/24/2019 
-- Design Name: 
-- Module Name:    D_TRIGGER_ACCESS - Behavioral 
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

entity D_TRIGGER_ACCESS is
    Port ( D, CLOCK, CE : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_TRIGGER_ACCESS;

architecture Behavioral of D_TRIGGER_ACCESS is
	signal out_value: std_logic;
begin
	p1: process(CLOCK, CE)
	begin
		if CE = '1' then
			if (CLOCK'EVENT and CLOCK = '1') then
				out_value <= D;
			end if;
		end if;
		
	end process;

	Q <= out_value;
	nQ <= not out_value;

end Behavioral;

