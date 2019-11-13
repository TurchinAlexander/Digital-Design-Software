----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:28 10/09/2019 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
	port (A, A1, B, B1, S : in std_logic;
			Z, Z1 : out std_logic);
end Mux2;

architecture Structural of Mux2 is
component Mux
	port( A, B, S : in std_logic;
			Z: out std_logic);
end component;
begin
	MUX_0_PAIR: Mux port map (A, B, S, Z);
	MUX_1_PAIR: Mux port map (A1, B1, S, Z1);

end Structural;

