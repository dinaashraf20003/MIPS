--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:54:15 05/28/2023
-- Design Name:   
-- Module Name:   C:/Users/user/Desktop/MIPS/MIPS_DinaAshraf_20101181_2023/MIPS_TB_20101181_2023.vhd
-- Project Name:  MIPS_DinaAshraf_20101181_2023
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MIPS_Processor_20101181_2023
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
 
ENTITY MIPS_TB_20101181_2023 IS
END MIPS_TB_20101181_2023;
 
ARCHITECTURE behavior OF MIPS_TB_20101181_2023 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS_Processor_20101181_2023
    PORT(
         CLK1 : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK1 : std_logic := '0';

   -- Clock period definitions
   constant CLK1_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS_Processor_20101181_2023 PORT MAP (
          CLK1 => CLK1
        );

   -- Clock process definitions
   CLK1_process :process
   begin
		CLK1 <= '0';
		wait for CLK1_period/2;
		CLK1 <= '1';
		wait for CLK1_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK1_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
