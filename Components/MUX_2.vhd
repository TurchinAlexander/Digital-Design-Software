library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
	port (A, A1, B, B1, S : in std_logic;
			Z, Z1 : out std_logic);
end Mux2;

architecture Structural of Mux2 is
component Mux
	port( A, B, S : in std_logic;
			Z: out std_logic);
end component;
begin
	MUX_0_PAIR: Mux port map (A, B, S, Z);
	MUX_1_PAIR: Mux port map (A1, B1, S, Z1);

end Structural;

