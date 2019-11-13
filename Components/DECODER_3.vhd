library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


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

