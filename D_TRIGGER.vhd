----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:49 10/24/2019 
-- Design Name: 
-- Module Name:    D_TRIGGER - Behavioral 
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

