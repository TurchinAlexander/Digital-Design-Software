----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:59 10/09/2019 
-- Design Name: 
-- Module Name:    DeMux - Behavioral 
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

entity DeMux is
	port (X, A1, A2 : in std_logic;
			F0, F1, F2, F3 : out std_logic);
end DeMux;

architecture Structural of DeMux is
component Invert
	port (Q : in std_logic;
			nQ : out std_logic);
end component;

component And_3
	port (A, B, C : in std_logic;
			Z : out std_logic);
end component;

signal nA1, nA2 : std_logic;
begin
	INV_A1: Invert port map (A1, nA1);
	INV_A2: Invert port map (A2, nA2);
	AND_nA1_nA2: And_3 port map (nA1, nA2, X, F0);
	AND_nA1_A2: And_3 port map (nA1, A2, X, F1);
	AND_A1_nA2: And_3 port map (A1, nA2, X, F2);
	AND_A1_A2: And_3 port map (A1, A2, X, F3);
end Structural;

architecture Behavioral of DeMux is
begin
	F0 <= X and not A1 and not A2;
	F1 <= X and not A1 and A2;
	F2 <= X and A1 and not A2;
	F3 <= X and A1 and A2;
end Behavioral;

