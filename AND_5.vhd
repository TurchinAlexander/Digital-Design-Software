library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_5 is
	generic (N: integer:= 5);
	port (A : in std_logic_vector (N-1 downto 0);
			R : out std_logic);
end AND_5;

architecture Structural of AND_5 is
	component And_2
		port (A, B : in std_logic;
				Z : out std_logic);
	end component;
	
	signal X : std_logic_vector(N-2 downto 0);	
begin
	GEN0: And_2 port map (A(0), A(1), X(0));
	
	SCH: for J in 1 to N-2 generate
		GENJ: And_2 port map (X(J-1), A(J+1), X(J)); 
	end generate;

	R <= X(N-2);
end Structural;

architecture Behavioral of AND_5 is
	signal X : std_logic_vector(N-2 downto 0);
begin
	X(0) <= A(0) and A(1);
	
	sch: for J in 1 to N-2 generate
		X(J) <= X(J-1) and A(J+1);
	end generate;
	
	R <= X(N-2);
end Behavioral;

