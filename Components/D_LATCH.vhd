library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH is
	PORT (D: IN STD_LOGIC;
			Q, nQ: OUT STD_LOGIC);
end D_LATCH;

architecture str of d_latch is
	component rs_latch
		port(s, r: in std_logic;
				q, nq: out std_logic);
	end component;
	
	component inv_1
		port (q: in std_logic;
				nq: out std_logic);
	end component;

	signal s, r: std_logic;
begin
	s <= d;
	u0: inv_1 port map (q => d, nq => r);
	u1: entity work.rs_latch(str) port map (s => s, r => r, q => q, nq => nq);

end str;

ARCHITECTURE BEH OF D_LATCH IS
	SIGNAL S, R, TEMP, START: STD_LOGIC;
BEGIN
	S <= D;
	R <= NOT D;
	
	TEMP <= NOT (START OR S);
	START <= NOT (TEMP OR R);
	
	Q <= START;
	nQ <= TEMP;
END BEH;

ARCHITECTURE PARAM OF D_LATCH IS
	SIGNAL S, R, TEMP, START: STD_LOGIC;
BEGIN
	S <= D AFTER 2 NS;
	R <= NOT D AFTER 2 NS;
	
	TEMP <= NOT (START OR S) AFTER 2 NS;
	START <= NOT (TEMP OR R) AFTER 2 NS;
	
	Q <= TRANSPORT START AFTER 10 NS;
	nQ <= TRANSPORT TEMP AFTER 10 NS;
END PARAM;

