----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:18 03/13/2023 
-- Design Name: 
-- Module Name:    ALUCTRL_20101181_2023 - Behavioral 
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


entity ALUCTRL_20101181_2023 is
    Port ( ALU_op : in  STD_LOGIC_VECTOR (1 downto 0);
           FUNCT : in  STD_LOGIC_VECTOR (5 downto 0);
           Cout : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUCTRL_20101181_2023;

architecture Behavioral of ALUCTRL_20101181_2023 is

begin
process(ALU_op,FUNCT)
begin
	if ALU_op="00" then Cout<="0010";
	elsif ALU_op="01" then Cout<="0110";
	elsif ALU_op="10" then
		if FUNCT(3 downto 0)="0000" then Cout<="0010";
		elsif FUNCT(3 downto 0)="0010" then Cout<="0110";
		elsif FUNCT(3 downto 0)="0100" then Cout<="0000";
		elsif FUNCT(3 downto 0)="0101" then Cout<="0001";
		elsif FUNCT(3 downto 0)="1010" then Cout<="0111";
		end if;
	elsif ALU_op="11" then
		if FUNCT(3 downto 0)="0010" then Cout<="0110";
		elsif FUNCT(3 downto 0)="1010" then Cout<="0111";
		end if;
	end if;
end process;


end Behavioral;


