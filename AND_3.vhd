----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:04 10/09/2019 
-- Design Name: 
-- Module Name:    And_3 - Behavioral 
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

entity And_3 is
	port (A, B, C : in std_logic;
			Z : out std_logic);
end And_3;

architecture Behavioral of And_3 is
component And_2
	port (A, B : in std_logic;
			Z : out std_logic);
end component;

signal R1: std_logic;
begin
	AND_A_B: And_2 port map (A, B, R1);
	ABD_PREV_C: And_2 port map (R1, C, Z);

end Behavioral;

