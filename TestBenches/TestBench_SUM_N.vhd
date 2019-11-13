LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TestBench_SUM_N IS
END TestBench_SUM_N;
 
ARCHITECTURE behavior OF TestBench_SUM_N IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	constant N : integer := 3;
 
    COMPONENT SUM_N
    PORT(
         X : IN  std_logic_vector(N-1 downto 0);
         Y : IN  std_logic_vector(N-1 downto 0);
         Z : OUT  std_logic_vector(N-1 downto 0);
         Pn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(N-1 downto 0) := (others => '0');
   signal Y : std_logic_vector(N-1 downto 0) := (others => '0');

 	--Outputs
   signal Z_Beh, Z_STR : std_logic_vector(N-1 downto 0);
   signal Pn_Beh, Pn_Str : std_logic;
	signal Error: std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 160 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   struct: entity Work.SUM_N(Behavioral) 
		GENERIC MAP (N => N)
		PORT MAP (
          X => X,
          Y => Y,
          Z => Z_Str,
          Pn => Pn_Str
        );
		  
	beh: entity Work.SUM_N(Structural) 
		GENERIC MAP (N => N)
		PORT MAP (
          X => X,
          Y => Y,
          Z => Z_Beh,
          Pn => Pn_Beh
        );
	
	p1 :process(X, Y)
   begin
		for i in 0 to N-1 loop
			X(i) <= not X(i) after period / 2**i;
			Y(i) <= not Y(i) after period / 2**(N + i);
		end loop;
	end process;
	
	p2: process(Z_Beh, Z_Str, Pn_Str, Pn_Beh)
		variable err: std_logic;
	begin
		err := Pn_Beh xor Pn_Str;
		for i in 0 to N-1 loop
			err := (Z_Beh(i) xor Z_Str(i)) and err;
		end loop;
		
		Error <= err;
	end process;

END;
