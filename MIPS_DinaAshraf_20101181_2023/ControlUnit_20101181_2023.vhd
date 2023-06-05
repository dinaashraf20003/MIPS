----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:48 05/08/2023 
-- Design Name: 
-- Module Name:    ControlUnit_20101181_2023 - Behavioral 
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

entity ControlUnit_20101181_2023 is
    Port ( instruct : in  STD_LOGIC_VECTOR (5 downto 0);
           regDst : out  STD_LOGIC;
           aluSrc : out  STD_LOGIC;
           memtoReg : out  STD_LOGIC;
           regWrite : out  STD_LOGIC;
           memRead : out  STD_LOGIC;
           memWrite : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           aluOp : out  STD_LOGIC_VECTOR (1 downto 0));
end ControlUnit_20101181_2023;

architecture Behavioral of ControlUnit_20101181_2023 is

begin
	process(instruct)
		begin
			if (instruct ="000000") then --R-Format 
				regDst<= '1';
				aluSrc<='0';
				memtoReg<='0';
				regWrite<='1';
				memRead<='0';
				memWrite<='0';
				branch<='0';
				aluOp<="10";
			elsif (instruct ="100011") then	--lw
				regDst<= '0';
				aluSrc<='1';
				memtoReg<='1';
				regWrite<='1';
				memRead<='1';
				memWrite<='0';
				branch<='0';
				aluOp<="00";
			
			elsif (instruct ="101011") then	--sw
				regDst<= '0';
				aluSrc<='1';
				memtoReg<='0';
				regWrite<='0';
				memRead<='0';
				memWrite<='1';
				branch<='0';
				aluOp<="00";
			
			elsif(instruct ="000100") then	--beq
				regDst<= '0';
				aluSrc<='0';
				memtoReg<='0';
				regWrite<='0';
				memRead<='0';
				memWrite<='0';
				branch<='1';
				aluOp <="01";
			end if;
	end process;

end Behavioral;

