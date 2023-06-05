----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    10:26:30 05/28/2023
-- Design Name:
-- Module Name:    Mux1_2to1_32bits_20101181_2023 - Behavioral
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

entity Mux1_2to1_32bits_20101181_2023 is
    Port ( in0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in1 : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux1_2to1_32bits_20101181_2023;

architecture Behavioral of Mux1_2to1_32bits_20101181_2023 is
begin

process (in0, in1, s)
begin

if s='0' then
o <= in0;
elsif s='1' then
o <= in1;
end if;

end process;

end Behavioral;