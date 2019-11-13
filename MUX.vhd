library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( A, B, S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end Mux;

architecture Structural of Mux is
	signal Sn, R1, R2: std_logic;
component And_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;

component Or_2
	port (A, B: in std_logic;
			Z: out std_logic);
end component;

component Invert
	port (Q: in std_logic;
			nQ: out std_logic);
end component;
begin
	INV_S: Invert port map (S, Sn);
	AND_A_nS: And_2 port map (A, Sn, R1);
	AND_B_S: And_2 port map (B, S, R2);
	OR_RES: Or_2 port map (R1, R2, Z);

end Structural;

architecture Behavioral of Mux is 
begin
	Z <= A when S = '0' else B;
end Behavioral;
