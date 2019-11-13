----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:48 10/16/2019 
-- Design Name: 
-- Module Name:    HALF_SUM - Behavioral 
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

entity HALF_SUM is
	port (A, B: in std_logic;
			C, P: out std_logic);
end HALF_SUM;

architecture Behavioral of HALF_SUM is
component Xor_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;

component And_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;
begin
	FIND_P: And_2 port map (A, B, P);
	FIND_C: Xor_2 port map (A, B, C);
end Behavioral;

