----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:48 10/21/2019 
-- Design Name: 
-- Module Name:    NOR_2 - Behavioral 
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

entity NOR_2 is
    Port ( X1, X2 : in  STD_LOGIC;
           R : out  STD_LOGIC);
end NOR_2;

architecture Behavioral of NOR_2 is
	COMPONENT OR_2
		PORT (X1, X2: IN STD_LOGIC;
				R: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL TEMP : STD_LOGIC;
begin
	U0: OR_2 PORT MAP (X1 => X1, X2 => X2, R => TEMP);
	U1: INV_1 PORT MAP (Q => TEMP, nQ => R);

end Behavioral;

