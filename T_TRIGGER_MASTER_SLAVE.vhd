----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:52 10/26/2019 
-- Design Name: 
-- Module Name:    T_TRIGGER_MASTER_SLAVE - Behavioral 
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

entity T_TRIGGER_MASTER_SLAVE is
	Port ( T, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
end T_TRIGGER_MASTER_SLAVE;

architecture Behavioral of T_TRIGGER_MASTER_SLAVE is
	component T_TRIGGER
    Port ( T, CLOCK : in  STD_LOGIC;
           Q, nQ : out  STD_LOGIC);
	end component;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	signal temp_Q, temp_nQ, nCLOCK: std_logic;
begin

	U0: INV_1 port map (CLOCK, nCLOCK);
	U1: T_TRIGGER port map (T, CLOCK, temp_Q, open);
	U2: T_TRIGGER port map (temp_Q, nCLOCK, Q, nQ);
	
end Behavioral;

