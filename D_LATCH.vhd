----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:13 10/23/2019 
-- Design Name: 
-- Module Name:    D_LATCH - Behavioral 
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

entity D_LATCH is
	PORT (D: IN STD_LOGIC;
			Q, nQ: OUT STD_LOGIC);
end D_LATCH;

--architecture STR of D_LATCH is
--	COMPONENT RS_LATCH
--		PORT(S, R: IN STD_LOGIC;
--				Q, nQ: OUT STD_LOGIC);
--	END COMPONENT;
--	
--	COMPONENT INV_1
--		PORT (Q: IN STD_LOGIC;
--				nQ: OUT STD_LOGIC);
--	END COMPONENT;
--
--	SIGNAL S, R: STD_LOGIC;
--begin
--	S <= D;
--	U0: INV_1 PORT MAP (Q => D, nQ => R);
--	U1: entity Work.RS_LATCH(STR) PORT MAP (S => S, R => R, Q => Q, nQ => nQ);
--
--end STR;

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
--s
--ARCHITECTURE PARAM OF D_LATCH IS
--	SIGNAL S, R, TEMP, START: STD_LOGIC;
--BEGIN
--	S <= D AFTER 2 NS;
--	R <= NOT D AFTER 2 NS;
--	
--	TEMP <= NOT (START OR S) AFTER 2 NS;
--	START <= NOT (TEMP OR R) AFTER 2 NS;
--	
--	Q <= TRANSPORT START AFTER 10 NS;
--	nQ <= TRANSPORT TEMP AFTER 10 NS;
--END PARAM;

