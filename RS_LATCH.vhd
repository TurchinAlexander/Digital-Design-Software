----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:11:36 10/24/2019 
-- Design Name: 
-- Module Name:    RS_LATCH - Behavioral 
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

entity RS_LATCH is
	PORT (S, R: IN STD_LOGIC;
			Q, nQ: OUT STD_LOGIC);
end RS_LATCH;

architecture STR of RS_LATCH is
	COMPONENT NOR_2
		PORT (X1, X2: IN STD_LOGIC;
				R: OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL START: STD_LOGIC := '0';
	SIGNAL TEMP: STD_LOGIC;
begin	
	Q <= START;
	
	FIRST_NOR: NOR_2 PORT MAP (X1 => START, X2 => S, R => TEMP);
	SECOND_NOR: NOR_2 PORT MAP (X1 => TEMP, X2 => R, R => START);
	
	nQ <= TEMP;
	
end STR;


ARCHITECTURE BEH OF RS_LATCH IS
	SIGNAL START: STD_LOGIC;
	SIGNAL TEMP: STD_LOGIC;
BEGIN
	Q <= START;
	TEMP <= NOT (START OR S);
	START <= NOT (TEMP OR R);
	
	nQ <= TEMP;
END BEH;

ARCHITECTURE PARAM OF RS_LATCH IS
	SIGNAL START: STD_LOGIC;
	SIGNAL TEMP: STD_LOGIC;
BEGIN
	
	TEMP <= NOT (START OR S) AFTER 1 NS;
--	nQ <= TRANSPORT TEMP AFTER 10 NS;
	nQ <= TEMP;
	
	START <= NOT (TEMP OR R) AFTER 2 NS;
--	Q <= TRANSPORT START AFTER 10 NS;
	Q <= START;
END PARAM;

