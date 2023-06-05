----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:34 04/11/2023 
-- Design Name: 
-- Module Name:    RegFile - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile_20101181_2023 is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile_20101181_2023;

architecture Behavioral of RegisterFile_20101181_202 is
type arr32 is array (0 to 31) of STD_LOGIC_VECTOR (31 DOWNto 0);
signal REG:arr32:= (X"ABCEFD01", X"11111111", X"00000000", X"00001111",
X"A0CD1101", X"11910011", X"00110700", X"00010111",
X"ABCEFD10", X"111DD111", X"0B0000A0", X"0A001611",
X"BBCEAD11", X"1013101A", X"A30100B0", X"100B11E1",
X"0B1E0D01", X"B1011510", X"000E0010", X"0A05F111",
X"A1CE1D01", X"11C11101", X"0010D000", X"F0001A01",
X"1BC0FD01", X"101A1111", X"0A0B10C0", X"0A00F11A",
X"11C00301", X"11101611", X"00002100", X"00101A11");
begin
--READING
Data1<=REG(conv_integer (ReadReg1));
Data2<=REG(conv_integer (ReadReg2));
--WRITING
process(RegWrite,Clk)
begin
	if RegWrite='1' and rising_edge(Clk)
		then
			REG(conv_integer (WriteReg))<=WriteData;
	end if;
end process;
end Behavioral;

