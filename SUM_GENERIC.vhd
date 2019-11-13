library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUM_N is
	generic (N : integer:= 2);
	port (X, Y : in std_logic_vector(N-1 downto 0);
			Z: out std_logic_vector(N-1 downto 0);
			Pn: out std_logic);
end SUM_N;

architecture Structural of SUM_N is
	
	component HALF_SUM
		port (A, B : in std_logic;
				C, P : out std_logic);
	end component;
	
	component SUM_1
		port (A, B, P : in std_logic;
				Z, Pn : out std_logic);
	end component;

	signal P: std_logic_vector(N-1 downto 0);
begin
	GEN_0: HALF_SUM port map (X(0), Y(0), Z(0), P(0));

	SCH: for J in 1 to N-1 generate
		GEN_J: SUM_1 port map (X(J), Y(J), P(J-1), Z(J), P(J));
	end generate;
	Pn <= P(N-1);
end Structural;

architecture Behavioral of SUM_N is
begin
	p1: process (X, Y)
		variable vsum: std_logic_vector(N-1 downto 0);
		variable carry: std_logic;
	begin
		carry := '0';
		for i in 0 to N - 1 loop
			vsum(i) := (X(i) xor Y(i)) xor carry;
			carry := (X(i) and Y(i)) or (carry and (X(i) or Y(i)));
		end loop;
		
		Z <= vsum;
		Pn <= carry;
	end process p1; 

end Behavioral;

