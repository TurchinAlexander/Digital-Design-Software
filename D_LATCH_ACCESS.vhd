----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:04:08 10/23/2019 
-- Design Name: 
-- Module Name:    D_LATCH_ACCESS - Behavioral 
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
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity D_LATCH_ACCESS is
    Port ( D, E : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_LATCH_ACCESS;

architecture STR of D_LATCH_ACCESS is
	COMPONENT RS_LATCH
		PORT(S, R: IN STD_LOGIC;
				Q, nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL S, R, nD, OUT_S, OUT_R: STD_LOGIC;
begin
	S <= D;
	U0: INV_1 PORT MAP (Q => D, nQ => R);
	U1: AND2 PORT MAP (I0 => S, I1 => E, O => OUT_S);
	U2: AND2 PORT MAP (I0 => R, I1 => E, O => OUT_R);
	U3: ENTITY WORK.RS_LATCH(STR) PORT MAP (S => OUT_S, R => OUT_R, Q => Q, nQ => nQ);

end STR;

architecture BEH of D_LATCH_ACCESS is
	SIGNAL S, R, nD, OUT_S, OUT_R, START, TEMP: STD_LOGIC;
begin
	S <= D;
	R <= not D;
	OUT_S <= S and E;
	OUT_R <= R and E;
	
	TEMP <= NOT (START OR OUT_S);
	START <= NOT (TEMP OR OUT_R);
	
	Q <= START;
	nQ <= TEMP;
	
end BEH;

architecture PARAM of D_LATCH_ACCESS is
	SIGNAL S, R, nD, OUT_S, OUT_R, START, TEMP: STD_LOGIC;
begin
	S <= D after 2 ns;
	R <= not D after 2 ns;
	OUT_S <= S and E after 2 ns;
	OUT_R <= R and E after 2 ns;
	
	TEMP <= transport NOT (START OR OUT_S) after 10 ns;
	START <= transport NOT (TEMP OR OUT_R) after 10 ns;
	
	Q <= START after 2 ns;
	nQ <= TEMP after 2 ns;
	
end PARAM;


