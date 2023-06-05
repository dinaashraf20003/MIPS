----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:21:22 05/01/2023 
-- Design Name: 
-- Module Name:    PC_Adder_20101181_2023 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_Adder_20101181_2023 is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end PC_Adder_20101181_2023;

architecture Behavioral of PC_Adder_20101181_2023 is
signal tmp: STD_LOGIC_VECTOR (31 downto 0);
begin
tmp<= X"00000004";
 output <= STD_LOGIC_VECTOR(unsigned( unsigned(input) + unsigned(tmp)));

end Behavioral;

