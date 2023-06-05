--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:43:32 04/10/2023
-- Design Name:   
-- Module Name:   F:/arch/Dina_20101181_DataMemory/DataMemoryTest.vhd
-- Project Name:  Dina_20101181_DataMemory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MemoryUnit_TB_20101181_2023 IS
END MemoryUnit_TB_20101181_2023;
 
ARCHITECTURE behavior OF MemoryUnit_TB_20101181_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoryUnit_20101181_2023
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         MemRead : IN  std_logic;
         MemWrite : IN  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal MemRead : std_logic := '0';
   signal MemWrite : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoryUnit_20101181_2023 PORT MAP (
          Address => Address,
          WriteData => WriteData,
          CLK => CLK,
          MemRead => MemRead,
          MemWrite => MemWrite,
          ReadData => ReadData
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

  -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here
      MemRead <= '1';
		MemWrite <= '0';
		Address <= X"00000001";
		WriteData <= X"12345678";
		
		wait for 100 ns;
		
		MemRead <= '0';
		MemWrite <= '1';
		Address <= X"00000002";
		
		wait for 100 ns;		

      
   end process;

END;


