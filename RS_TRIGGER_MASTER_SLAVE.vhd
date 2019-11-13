----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:24 10/26/2019 
-- Design Name: 
-- Module Name:    RS_TRIGGER_MASTER_SLAVE - Behavioral 
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

entity RS_TRIGGER_MASTER_SLAVE is
	port (R, S, CLOCK: in std_logic;
			Q, nQ: out std_logic);
end RS_TRIGGER_MASTER_SLAVE;

architecture Behavioral of RS_TRIGGER_MASTER_SLAVE is

	component RS_TRIGGER is
		 Port ( R, S, CLOCK : in  STD_LOGIC;
				  Q, nQ : out  STD_LOGIC);
	end component;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	signal temp_Q, temp_nQ, nCLOCK: std_logic;
begin

	U0: INV_1 port map (CLOCK, nCLOCK);
	U1: RS_TRIGGER port map (R, S,  CLOCK, temp_Q, temp_nQ);
	U2: RS_TRIGGER port map (temp_Q, temp_nQ, nCLOCK, Q, nQ);
end Behavioral;

