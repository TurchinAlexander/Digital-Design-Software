----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:47 10/26/2019 
-- Design Name: 
-- Module Name:    D_LATCH_MASTER_SLAVE - Behavioral 
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

entity D_TRIGGER_MASTER_SLAVE is
    Port ( D, CLOCK, : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end D_TRIGGER_MASTER_SLAVE;

architecture Behavioral of D_TRIGGER_MASTER_SLAVE is
	component D_TRIGGER
		port (D, C: in std_logic;
				Q, nQ: out std_logic);
	end component;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	signal temp_Q, temp_nQ, nCLOCK: std_logic;
begin

	U0: INV_1 port map (CLOCK, nCLOCK);
	U1: D_TRIGGER port map (D, CLOCK, temp_Q, temp_nQ);
	U2; D_TRIGGER port mpa (D, nCLOCK, Q, nQ);
	
	
end Behavioral;

