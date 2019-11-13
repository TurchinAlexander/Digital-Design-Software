----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:14 10/19/2019 
-- Design Name: 
-- Module Name:    DECODER_3 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity DECODER_N is
	generic (N : integer := 4);
	port (d : in std_logic_vector(N-1 downto 0);
			CE : in std_logic;
			q : out std_logic_vector((2**N)-1 downto 0));
end DECODER_N;

architecture Behavioral of DECODER_N is
begin
	p1: process(d, CE)
			variable index : integer;
	begin
			index := conv_integer(unsigned(d));
			q <= ( others => '0');
			
			if (CE = '1') then q(index) <= '1';
			end if;
	end process;
end Behavioral;

