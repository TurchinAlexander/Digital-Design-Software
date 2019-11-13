----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:17:29 10/19/2019 
-- Design Name: 
-- Module Name:    BISTABLE - Behavioral 
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

entity BISTABLE is
	 Port ( Q, nQ : out  STD_LOGIC);
end BISTABLE;

architecture Structural of BISTABLE is
	component NOT_1
		port (Q : in std_logic;
				nQ : out std_logic);
	end component;

	signal Start: std_logic := '0';
	signal OutNQ: std_logic;
begin

--	INVERT_START: NOT_1 port map (Q => Start, nQ => OutNQ);
--	INVERT_Q: NOT_1 port map (Q => OutNQ, nQ => Start);
--	
	INVERT_START: NOT_1 port map (Q => Start, nQ => OutNQ);
	INVERT_Q: NOT_1 port map (Q => OutNQ, nQ => Q);
	
	nQ <= OutNQ;
	
	
--	Q <= Start;
--	nQ <= OutNQ;
end Structural;