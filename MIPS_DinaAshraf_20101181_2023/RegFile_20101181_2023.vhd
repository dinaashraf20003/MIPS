----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:34 04/11/2023 
-- Design Name: 
-- Module Name:    RegFile_20101181_2023 
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

entity RegFile_20101181_2023 is
    Port ( ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           RegWrite : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegFile_20101181_2023;

architecture Behavioral of RegFile_20101181_2023 is
type arr32 is array (0 to 31) of STD_LOGIC_VECTOR (31 DOWNto 0);
signal REG:arr32:= (
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000005",X"00000007",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000",
											X"00000000",X"00000000");
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

