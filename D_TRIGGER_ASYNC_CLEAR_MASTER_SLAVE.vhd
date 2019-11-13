----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:34:04 10/26/2019 
-- Design Name: 
-- Module Name:    D_TRIGGER_ASYNC_CLEAR_MASTER_SLAVE - Behavioral 
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

entity D_TRIGGER_ASYNC_CLEAR_MASTER_SLAVE is
	Port ( D, CLR, CLOCK : in  STD_LOGIC;
          Q, nQ : out  STD_LOGIC);
end D_TRIGGER_ASYNC_CLEAR_MASTER_SLAVE;

architecture Behavioral of D_TRIGGER_ASYNC_CLEAR_MASTER_SLAVE is

	component D_TRIGGER_ASYNC_CLEAR
		Port (D, CLR, CLOCK : in  STD_LOGIC;
				Q, nQ : out  STD_LOGIC);
	end component;
	
	COMPONENT INV_1
		PORT (Q: IN STD_LOGIC;
				nQ: OUT STD_LOGIC);
	END COMPONENT;
	
	signal temp_Q, temp_nQ, nCLOCK: std_logic;

begin
	U0: INV_1 port map (CLOCK, nCLOCK);
	U1: D_TRIGGER_ASYNC_CLEAR port map (D, CLR, CLOCK, temp_Q, open);
	U2: D_TRIGGER_ASYNC_CLEAR port map (temp_Q, CLR, nCLOCK, Q, nQ);
end Behavioral;


