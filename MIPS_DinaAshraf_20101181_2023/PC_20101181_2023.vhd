----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:30:36 05/01/2023 
-- Design Name: 
-- Module Name:    PC_20101181_2023 - Behavioral 
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

entity PC_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end PC_20101181_2023;

architecture Behavioral of PC_20101181_2023 is
signal tmp: STD_LOGIC_VECTOR (31 downto 0):= X"00000000";
begin
process(input,clk)
begin
	if rising_edge(clk) then
		output <= input;
		tmp <= input;
		
			else
		output <= tmp;
	end if;
end process;

end Behavioral;

