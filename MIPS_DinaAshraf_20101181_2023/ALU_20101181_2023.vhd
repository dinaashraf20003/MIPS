----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    09:59:41 04/11/2023
-- Design Name:
-- Module Name:    ALU_20101181_2023 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_20101181_2023 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (3 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC);
end ALU_20101181_2023;

architecture Behavioral of ALU_20101181_2023 is
begin

process (A, B, AluOp)
begin

if (AluOp = "0000") then
Result <= A and B;
elsif (AluOp = "0001") then
Result <= A or B;
elsif (AluOp = "0010") then
Result <= STD_LOGIC_VECTOR(unsigned(unsigned(A) + unsigned(B)));
elsif (AluOp = "0110") then
Result <= STD_LOGIC_VECTOR(unsigned(unsigned(A) - unsigned(B)));
elsif (AluOp <= "0111") then
if (A<B) then
Result <= X"00000001";
else
Result <= X"00000000";
end if;
elsif (AluOp = "1100") then
Result <= A nor B;
end if;

if (A=B) then
Zero <= '1';
else
Zero <= '0';
end if;

end process;

end Behavioral;