----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    10:40:42 05/28/2023
-- Design Name:
-- Module Name:    InstructionMemory_20101181_2023 - Behavioral
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

entity InstructionMemory_20101181_2023 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory_20101181_2023;

architecture Behavioral of InstructionMemory_20101181_2023 is

type A is array(0 to 31) of STD_LOGIC_VECTOR ( 7 downto 0);

signal mem: A:=
(x"00",x"85",x"10",x"20",	--add $v0, $a0, $a1
								x"AC",x"02",x"00",x"08",	--sw $v0, 8($zero)
								x"8C",x"06",x"00",x"08",	--lw $a2, 8($zero)
								x"10",x"46",x"00",x"01",	--beq $v0, $a2, Good_Processor
								x"00",x"46",x"88",x"2A",	--slt $s1, $v0, $a2
								x"00",x"A4",x"88",x"22",	--Good_Processor: sub $s1, $a1, $a0
								x"00",x"00",x"00",x"00",
								x"00",x"00",x"00",x"00");
begin
Instruction <= mem(to_integer(unsigned(PC)))&
mem(to_integer(unsigned(PC))+1)&
mem(to_integer(unsigned(PC))+2)&
mem(to_integer(unsigned(PC))+3);

end Behavioral;